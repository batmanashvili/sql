

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

```python

"""
2. (6 ქულა) აბსტრაქტული კლასის გამოყენებით შეადგინეთ პროგრამა, რომელიც წარმო-
გვიდგენს მოცემული მწკრივის მნიშვნელობას, სადაც n=10.

y = 1 + (x/1!) + (x^2/2!) + (x^3/3!) + (x^4/4!) + ... + (x^n/n!)
"""

from abc import ABC, abstractmethod

class SeriesCalculator(ABC):
    def __init__(self, x, n):
        self.x = x
        self.n = n
    
    @abstractmethod
    def calculate(self):
        pass
    
    def factorial(self, num):
        if num == 0 or num == 1:
            return 1
        result = 1
        for i in range(2, num + 1):
            result *= i
        return result


class ExponentialSeries(SeriesCalculator):
    def calculate(self):
        result = 0
        for i in range(self.n + 1):
            term = (self.x ** i) / self.factorial(i)
            result += term
        return result


x_value = float(input("შეიყვანეთ x-ის მნიშვნელობა: "))
n_value = 10

series = ExponentialSeries(x_value, n_value)
y = series.calculate()

print(f"\nმწკრივის მნიშვნელობა y = {y}")
print(f"x = {x_value}, n = {n_value}")
```