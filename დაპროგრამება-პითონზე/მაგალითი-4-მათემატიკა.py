"""
მაგალითი 4: მათემატიკური ოპერაციები
ეს მაგალითი გვიჩვენებს როგორ გავაკეთოთ მათემატიკური გამოთვლები
"""

# 1. რიცხვების ჯამი
print("=== 1. პირველი 10 ნატურალური რიცხვის ჯამი ===")
sum_result = 0
for i in range(1, 11):  # 1-დან 10-მდე (11 არ შედის)
    sum_result += i
print(f"ჯამი: {sum_result}")  # შედეგი: 55
print()

# 2. გეომეტრიული საშუალო
print("=== 2. გეომეტრიული საშუალო ===")
import math

product = 1
for i in range(1, 11):
    product *= i

# 10-ე ხარისხის ფესვი
geometric_mean = math.pow(product, 1/10)
print(f"ნამრავლი: {product}")
print(f"გეომეტრიული საშუალო: {geometric_mean:.2f}")
print()

# 3. ციფრთა ნამრავლი
print("=== 3. ციფრთა ნამრავლი ===")
def digit_product(number):
    product = 1
    for digit in str(number):
        if digit.isdigit():
            product *= int(digit)
    return product

number = 1234
result = digit_product(number)
print(f"რიცხვი: {number}")
print(f"ციფრთა ნამრავლი: {result}")  # 1 * 2 * 3 * 4 = 24
print()

# 4. ფაქტორიალი
print("=== 4. ფაქტორიალი ===")
def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result

n = 7
result = factorial(n)
print(f"{n}! = {result}")  # 7! = 5040
print()

# 5. წრფივი განტოლება ax + b = 0
print("=== 5. წრფივი განტოლება ===")
def solve_linear(a, b):
    if a == 0:
        if b == 0:
            return "უსასრულოდ ბევრი ამონახსნი"
        else:
            return "ამონახსნი არ არსებობს"
    else:
        x = -b / a
        return f"x = {x}"

a, b = 2, -4
solution = solve_linear(a, b)
print(f"განტოლება: {a}x + {b} = 0")
print(f"ამონახსნი: {solution}")  # x = 2
print()

# 6. ლუწი რიცხვების ჯამი და საშუალო
print("=== 6. ლუწი რიცხვები (2-დან 20-მდე) ===")
even_numbers = []
for i in range(2, 21):  # 2-დან 20-მდე
    if i % 2 == 0:  # თუ 2-ზე გაყოფისას ნაშთი 0-ია
        even_numbers.append(i)

sum_even = sum(even_numbers)
average = sum_even / len(even_numbers)

print(f"ლუწი რიცხვები: {even_numbers}")
print(f"ჯამი: {sum_even}")
print(f"საშუალო: {average:.2f}")

