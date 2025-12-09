

# დავალება N1

```python

"""
1. (6 ქულა) მომხმარებლის მიერ შექმნილი კლასის გამოყენებით შეადგინეთ პროგრამა, რო-
მელიც მომხმარებლის მიერ კლავიატურიდან შეტანილ ნებისმიერ ორნიშნა ნატურალურ
რიცხვში განსაზღვრავს, თუ რომელია რიცხვის შემადგენლობაში შემავალი უდიდესი და
უმცირესი ციფრი.
"""

class DigitAnalyzer:    
    def __init__(self, number):
        self.number = number
    
    def find_max_min_digits(self):
        number_str = str(self.number)

        digits = [int(digit) for digit in number_str]

        max_digit = max(digits)
        min_digit = min(digits)
        return max_digit, min_digit


user_input = input("შეიყვანეთ ორნიშნა ნატურალური რიცხვი: ")
number = int(user_input)

analyzer = DigitAnalyzer(number)
max_digit, min_digit = analyzer.find_max_min_digits()

print(f"\nრიცხვი: {number}")
print(f"უდიდესი ციფრი: {max_digit}")
print(f"უმცირესი ციფრი: {min_digit}")
```

# დავალება N2