import tkinter as tk
import random

root = tk.Tk()
root.title("დავალება #1")
root.geometry("600x600")



label1 = tk.Label(root, text="სათაური")
label1.pack()

label2 = tk.Label(
    root, 
    text="მეორე ტექსტი",
)
label2.pack()

natural_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def button_clicked():
    print("ღილაკზე დაწკაპუნება მოხდა!")
    natural_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum_of_natural_numbers = sum(natural_numbers)
    average_of_natural_numbers = sum_of_natural_numbers / len(natural_numbers)
    label1.config(text=f"პირველი 10 ნატურალური რიცხვის ჯამი: {sum_of_natural_numbers}")
    label2.config(text=f"პირველი 10 ნატურალური რიცხვის საშუალო: {average_of_natural_numbers}")



button = tk.Button(
    root,
    text="დააწკაპუნეთ აქ",
    command=button_clicked,
)
button.pack()

root.mainloop()

# ------------------------------------------------------------- 1 -------------------------------------------------------------

# def button_clicked():
#     print("ღილაკზე დაწკაპუნება მოხდა!")
#     natural_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#     sum_of_natural_numbers = sum(natural_numbers)
#     average_of_natural_numbers = sum_of_natural_numbers / len(natural_numbers)
#     label1.config(text=f"პირველი 10 ნატურალური რიცხვის ჯამი: {sum_of_natural_numbers}")
#     label2.config(text=f"პირველი 10 ნატურალური რიცხვის საშუალო: {average_of_natural_numbers}")


# ------------------------------------------------------------- 2 -------------------------------------------------------------

random_integer = random.randint(1, 1000)

label1.config(text=f"ნებისმიერი რიცხვის ციფრთა ნამრავლი ციფრისა: {random_integer} არის ...")

label2.config(text=f"პასუხი გამოჩნდება 1 წამში")

def digit_product(number):
    product = 1
    for digit in str(number):
        product = product * int(digit)
    return product


def button_clicked():
    print("ღილაკზე დაწკაპუნება მოხდა!")
    result = digit_product(random_integer)
    label2.config(text=f"პასუხი არის: {result}")

root.after(1000, button_clicked)

# ------------------------------------------------------------- 3 -------------------------------------------------------------

def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result

# ------------------------------------------------------------- 4 -------------------------------------------------------------


random_integer_one = random.randint(1, 1000)
random_integer_two = random.randint(1, 1000)

label1.config(text=f": {random_integer_one}x+{random_integer_two}=0 წრფივი განტოლების ამოხსნის შედეგი არის ...")

def calculate_linear_equation(a, b):
    if a == 0:
        if b == 0:
            return "უსასრულოდ ბევრი ამონახსნი"
        else:
            return "ამონახსნი არ არსებობს"
    else:
        x = -b / a
        return f"x = {x}"


# ------------------------------------------------------------- 5 -------------------------------------------------------------

def calculate_sum_and_average():
    numbers = []

    for i in range(2, 21):
        if i % 2 == 0:
            numbers.append(i)

    sum_of_numbers = sum(numbers)
    average_of_numbers = sum_of_numbers / len(numbers)

    label1.config(text=f"2 დან 20-ის ჩათვლით 2-ის ჯერადი ნატურალური რიცხვების ჯამი: {sum_of_numbers}")
    label2.config(text=f"2 დან 20-ის ჩათვლით 2-ის ჯერადი ნატურალური რიცხვების საშუალო: {average_of_numbers}")


