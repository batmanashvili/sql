## Shopify React Native WebView Authentication

### Goal
- Wrap the existing hosted Shopify custom web application inside a React Native WebView and deliver a mobile app experience.
- Authenticate customers securely with Shopify so that once the WebView loads, they are already signed in (or can sign in inside the WebView) without rewriting the entire storefront.

### Key Constraints
- The production web app already exists; the React Native layer should be as thin as possible.
- OAuth flows are browser-based and require HTTPS redirects; a WebView can host them but native integration improves UX.
- Shopify exposes customer authentication through the Storefront API (GraphQL) and Multipass (Plus only) for customer-facing apps; Admin/session tokens are not suitable for public storefront login.
- The WebView and native layers run in different sandboxes. Any token created natively must be bridged securely to the web layer (cookies, local storage, or HTTP handshakes).

### Authentication Options
| Option | Description | Pros | Cons | Recommended Use |
| --- | --- | --- | --- | --- |
| **Native Sign-In via Storefront API** | Build a lightweight native screen that calls `customerAccessTokenCreate`, then injects the token into the WebView (cookie/exchange endpoint). | Fast UX, reuse existing web app session logic, full control over onboarding (biometrics, device storage). | Requires building token exchange endpoint in web app; token management complexity. | ✅ Primary recommendation when you can modify the web app.
| **WebView-Hosted Shopify Login** | Load the existing `/account/login` (or custom login) page directly in the WebView. | Minimal native work; uses existing web auth flows. | Multi-factor prompts and redirects can be fragile in WebView; cannot access token natively; relies on third-party cookies. | Good fallback if native screen is out-of-scope.
| **Shopify Multipass (Plus)** | Generate a Multipass token natively and redirect the WebView to `/account/login/multipass/{token}`. | Instant single sign-on between native and web; Shopify-managed session. | Only for Shopify Plus; requires secure server to sign Multipass tokens. | Use if you already have Multipass infrastructure.

The remainder of this document focuses on the recommended **Native Sign-In + Token Bridge** approach with notes on supporting the fallback WebView login.

### Architecture Overview (Native Sign-In)
1. **Native login screen** collects customer credentials (or social login) and calls the Shopify Storefront GraphQL mutation `customerAccessTokenCreate` using a Storefront Access Token.
2. On success, React Native receives a `customerAccessToken` (short-lived) and optionally a `customer` object (via `customerAccessTokenCreateWithMultipass`).
3. The native layer sends the access token to the WebView using one of:
   - Injected JavaScript that raises a custom DOM event
   - `postMessage` bridge (`window.ReactNativeWebView.postMessage`)
4. The web app listens for the event, calls a secure backend endpoint (e.g., `/api/native-login`) that exchanges the Storefront `customerAccessToken` for a regular Shopify customer session (set HTTP-only cookies) by leveraging `customerAccessTokenCreate` + [`customerAccessTokenCreateWithMultipass`](https://shopify.dev/docs/api/storefront/2024-10/mutations/customerAccessTokenCreateWithMultipass) or existing sign-in logic.
5. Once the backend establishes the browser session (sets Shopify cookies) the endpoint redirects the WebView to the main page (account dashboard, storefront, etc.).
6. Subsequent loads reuse the Shopify cookies; the native layer can refresh tokens when needed using `customerAccessTokenRenew` or by re-prompting sign-in.

### React Native Implementation Steps
1. **Create Storefront API credentials**
   - In Shopify admin, create a custom Storefront API token with `unauthenticated_read_*` scopes plus `unauthenticated_write_customers` if needed for sign-up.
2. **Install dependencies**
   ```bash
   npm install react-native-webview cross-fetch
   ```
3. **Build the login hook**

```tsx
// useCustomerAccessToken.ts
import { useState, useCallback } from 'react';

const SHOPIFY_DOMAIN = 'your-shop.myshopify.com';
const STOREFRONT_TOKEN = process.env.EXPO_PUBLIC_STOREFRONT_TOKEN ?? '';

const CUSTOMER_TOKEN_MUTATION = `
mutation customerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) {
  customerAccessTokenCreate(input: $input) {
    customerAccessToken { accessToken expiresAt }
    customerUserErrors { field message }
  }
}`;

export function useCustomerAccessToken() {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const signIn = useCallback(async (email: string, password: string) => {
    setLoading(true);
    setError(null);
    try {
      const res = await fetch(`https://${SHOPIFY_DOMAIN}/api/2024-10/graphql.json`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-Shopify-Storefront-Access-Token': STOREFRONT_TOKEN,
        },
        body: JSON.stringify({
          query: CUSTOMER_TOKEN_MUTATION,
          variables: { input: { email, password } },
        }),
      });

      const json = await res.json();
      const payload = json.data?.customerAccessTokenCreate;
      if (!payload?.customerAccessToken) {
        throw new Error(payload?.customerUserErrors?.[0]?.message ?? 'Unable to sign in');
      }

      return payload.customerAccessToken;
    } finally {
      setLoading(false);
    }
  }, []);

  return { signIn, loading, error };
}
```

4. **Bridge token to the WebView**

```tsx
// App.tsx
import { useRef, useState } from 'react';
import { View, TextInput, Button } from 'react-native';
import { WebView } from 'react-native-webview';
import { useCustomerAccessToken } from './useCustomerAccessToken';

export default function App() {
  const webviewRef = useRef<WebView>(null);
  const { signIn } = useCustomerAccessToken();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [token, setToken] = useState<string | null>(null);

  const handleSignIn = async () => {
    const accessToken = await signIn(email, password);
    setToken(accessToken.accessToken);

    const script = `
      window.dispatchEvent(new CustomEvent('NativeCustomerAccessToken', {
        detail: { token: '${accessToken.accessToken}', expiresAt: '${accessToken.expiresAt}' }
      }));
      true;
    `;
    webviewRef.current?.injectJavaScript(script);
  };

  return (
    <View style={{ flex: 1 }}>
      <View style={{ padding: 16 }}>
        <TextInput autoCapitalize="none" value={email} onChangeText={setEmail} placeholder="Email" />
        <TextInput value={password} onChangeText={setPassword} placeholder="Password" secureTextEntry />
        <Button title="Sign In" onPress={handleSignIn} />
      </View>
      <WebView
        ref={webviewRef}
        source={{ uri: 'https://app.example.com/mobile' }}
        onMessage={(event) => {
          // (Optional) handle messages posted from the web app
        }}
      />
    </View>
  );
}
```

5. **Secure storage & refresh**
   - Use `SecureStore` (Expo) or `Keychain`/`EncryptedStorage` to persist tokens if you need automatic login.
   - Implement refresh via [`customerAccessTokenRenew`](https://shopify.dev/docs/api/storefront/2024-10/mutations/customerAccessTokenRenew) before expiration.

### Web Application Changes
1. **Listen for native events**

```js
// public/native-bridge.js
window.addEventListener('NativeCustomerAccessToken', async (event) => {
  const { token, expiresAt } = event.detail;
  const response = await fetch('/api/native-login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    credentials: 'include',
    body: JSON.stringify({ token, expiresAt }),
  });

  if (response.ok) {
    window.location.href = '/account';
  } else {
    console.error('Failed to exchange native token');
  }
});
```

2. **Exchange token on the server**
   - Call the Storefront API with the provided token to verify the customer and create a Shopify session.
   - If you already have a session-establishment route (perhaps using Multipass or JWT), reuse it by treating the Storefront token as a proof of identity.

```ts
// api/native-login.ts (Node/Express example)
import type { Request, Response } from 'express';
import fetch from 'node-fetch';

export async function nativeLogin(req: Request, res: Response) {
  const { token } = req.body;
  if (!token) return res.status(400).json({ error: 'Missing token' });

  const response = await fetch('https://your-shop.myshopify.com/api/2024-10/graphql.json', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Shopify-Storefront-Access-Token': process.env.STOREFRONT_TOKEN!,
    },
    body: JSON.stringify({
      query: `query customer($accessToken: String!) {
        customer(customerAccessToken: $accessToken) { id email }
      }`,
      variables: { accessToken: token },
    }),
  });

  const data = await response.json();
  const customer = data.data?.customer;
  if (!customer) {
    return res.status(401).json({ error: 'Invalid access token' });
  }

  // Create or restore your app session + Shopify cookies
  // e.g. res.cookie('session', createSession(customer));
  res.status(200).json({ success: true });
}
```

3. **Handle logout**
   - From the web side, post a message to React Native to clear native storage and navigate to login screen.
   - Use `window.ReactNativeWebView.postMessage(JSON.stringify({ type: 'logout' }))` and handle it in `onMessage`.

### Fallback: WebView-Hosted Shopify Login
- Load `https://your-shop.myshopify.com/account/login` directly in the WebView when no token is stored.
- Set `sharedCookiesEnabled={true}` (iOS) and `thirdPartyCookiesEnabled={true}` (Android) so Shopify can manage authentication cookies inside the WebView.
- Listen to navigation changes; when the URL matches your authenticated page (`/account` or `/apps/home`), hide the login screen.
- Ensure your Shopify app supports App Bridge redirect whitelisting if you rely on admin OAuth screens.

### Security Considerations
- Always use HTTPS endpoints and pin the Shopify domain list if possible.
- Never embed Admin API credentials or private app secrets in the mobile bundle. Use Storefront tokens only or proxy through your backend.
- `customerAccessToken` expires in 1 hour by default; refresh proactively and clear tokens on logout.
- Validate the token server-side before issuing any session cookies to prevent tampering.
- Avoid storing Shopify customer credentials; rely on Shopify for authentication.

### Testing Checklist
- ✅ Native sign-in returns a valid customer access token.
- ✅ Token injection triggers the web app listener and establishes a session.
- ✅ Reloading the WebView keeps the user logged in (cookies present).
- ✅ Logout clears cookies and native storage.
- ✅ Error states (invalid credentials, network errors) show friendly messages.

### References
- Shopify Storefront API Authentication: https://shopify.dev/docs/custom-storefronts/building-with-storefront-api/customer-accounts
- `customerAccessTokenCreate` Mutation: https://shopify.dev/docs/api/storefront/2024-10/mutations/customerAccessTokenCreate
- Multipass Single Sign-On: https://shopify.dev/docs/custom-storefronts/tools/multipass-login
- React Native WebView Guide: https://github.com/react-native-webview/react-native-webview
- WebView Cookie Management (iOS/Android): https://shopify.dev/docs/custom-storefronts/tools/mobile-webviews/cookies

