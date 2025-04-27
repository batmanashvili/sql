USE Shekveta;

-- ცვლადს მიანიჭეთ ნებისმიერი ორი მთელი რიცხვის ჯამი 
DECLARE @ricxvi1 int,
@ricxvi2 int,
@jami int;

SET @ricxvi1 = 10;
SET @ricxvi2 = 20;
SET @jami = @ricxvi1+ @ricxvi2;

select @ricxvi1 as [შესაკრები 1],
    @ricxvi2 as [შესაკრები 2],
    @jami as [ჯამი];

-- ცვლადს მიანიჭეთ ორი სტრიქონის გაერთიანებული მნიშვნელობა 

DECLARE @text1 NVARCHAR(100),
@text2 NVARCHAR(100),
@text3 NVARCHAR(100);

SET @text1 = N'მომხმარებლის';
SET @text2 = N'სახელი';
SET @text3 = N'გვარი';

SELECT @text1 + ' ' + @text2 + ' ' + @text3 as [სახელი და გვარი];

-- ცვლადს მიანიჭეთ მაქსიმალური გადასახდელი თანხა ლარებში 
USE Shekveta;
DECLARE @max_gadasaxdeli MONEY;

SET @max_gadasaxdeli = (SELECT MAX(gadasaxdeli)
FROM Xelshekruleba);

SELECT @max_gadasaxdeli AS [მაქსიმალური გადასახდელი];
