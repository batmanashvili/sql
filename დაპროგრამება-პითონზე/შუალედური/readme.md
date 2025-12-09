

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

# დავალება N3

```python

"""
3. (6 ქულა) კლასებში მემკვიდრეობითობის პრინციპის გამოყენებით შეადგინეთ პროგრამა,
რომელიც კლავიატურიდან თქვენ მიერ შეტანილი n რაოდენობის რიცხვების საშუალო
არითმეტიკულს გამოთვლის.
"""

class NumberCollection:
    def __init__(self):
        self.numbers = []
    
    def add_number(self, number):
        self.numbers.append(number)
    
    def get_sum(self):
        return sum(self.numbers)
    
    def get_count(self):
        return len(self.numbers)


class ArithmeticMean(NumberCollection):
    def calculate_mean(self):
        if self.get_count() == 0:
            return 0
        return self.get_sum() / self.get_count()


n = int(input("შეიყვანეთ რიცხვების რაოდენობა: "))

calculator = ArithmeticMean()

for i in range(n):
    number = float(input(f"შეიყვანეთ {i+1}-ე რიცხვი: "))
    calculator.add_number(number)

mean = calculator.calculate_mean()

print(f"\nშეტანილი რიცხვები: {calculator.numbers}")
print(f"საშუალო არითმეტიკული: {mean}")
```

# დავალება N4

```python
"""
4. (6 ქულა) შეადგინეთ გრაფიკული ინტერფეისის მქონე პროგრამა, რომელიც დაპროგრა-
მების ხუთი ენის დასახელებებით შეავსებს სიას (ListBox) ერთსტრიქონიანი ტექსტური
ველიდან (Entry); მოახდენს სიის ცალკეული ელემენტის მონიშვნას და დასასრულს
გაასუფთავებს სიას. აღნიშნული ფუნქციები bind() მეთოდით განახორციელეთ ღილაკზე
(Button) ერთხელ დაწკაპების გზით.
"""

import tkinter as tk

root = tk.Tk()
root.title("დაპროგრამების ენები")
root.geometry("400x400")

label = tk.Label(root, text="დაპროგრამების ენის დასახელება:")
label.pack()

entry = tk.Entry(root, width=30)
entry.pack(pady=10)

listbox = tk.Listbox(root, width=30, height=10)
listbox.pack(pady=10)


result_label = tk.Label(root, text="")
result_label.pack(pady=5)

def add_language(event):
    language = entry.get()
    if language:
        listbox.insert(tk.END, language)
        entry.delete(0, tk.END)

selected_index = 0

def select_item(event):
    global selected_index
    selected_index = listbox.curselection()[0]
    selected_language = listbox.get(selected_index)
    result_label.config(text=f"მონიშნული: {selected_language}")

def clear_list(event):
    listbox.delete(selected_index)
    result_label.config(text="სია გასუფთავებულია")

add_button = tk.Button(root, text="დამატება", width=15)
add_button.pack()
add_button.bind("<Button-1>", add_language)

select_button = tk.Button(root, text="მონიშვნა", width=15)
select_button.pack()
select_button.bind("<Button-1>", select_item)

clear_button = tk.Button(root, text="გასუფთავება", width=15)
clear_button.pack()
clear_button.bind("<Button-1>", clear_list)

root.mainloop()
```

# დავალება N5

```python

"""
5. (6 ქულა) შეადგინეთ გრაფიკული ინტერფეისის მქონე პროგრამა, რომელიც ითვალისწი-
ნებს ტექსტური ველიდან მთელრიცხვა მნიშვნელობის შეტანას. მომხმარებლის მიერ
არარიცხვითი მნიშვნელობის შეტანის შემთხვევაში პროგრამამ უნდა გამოიტანოს
შეცდომის ტიპის გამაფრთხილებელი დიალოგური ფანჯარა, რომელშიც ასახული იქნება
შეცდომის ტიპი და შეცდომის გასწორების შემდეგ პროგრამამ ჭდეზე (Label) უნდა ასახოს
შეტანილი რიცხვის ბოლო ციფრი.
"""

import tkinter as tk
from tkinter import messagebox

root = tk.Tk()
root.title("რიცხვის ბოლო ციფრი")
root.geometry("400x300")

label = tk.Label(root, text="შეიყვანეთ მთელი რიცხვი:")
label.pack(pady=20)

entry = tk.Entry(root, width=30)
entry.pack(pady=10)

result_label = tk.Label(root, text="")
result_label.pack(pady=20)

def process_number():
    try:
        number = int(entry.get())
        last_digit = abs(number) % 10
        result_label.config(text=f"ბოლო ციფრი: {last_digit}")
    except ValueError as e:
        messagebox.showerror("შეცდომა", f"შეცდომის ტიპი:\n\nგთხოვთ შეიყვანოთ მთელი რიცხვი!")
        result_label.config(text="")

button = tk.Button(root, text="გამოთვალე", command=process_number, width=20)
button.pack(pady=10)

root.mainloop()
```
