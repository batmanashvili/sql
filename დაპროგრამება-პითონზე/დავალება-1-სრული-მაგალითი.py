"""
დავალება #1: პირველი 10 ნატურალური რიცხვის ჯამი და გეომეტრიული საშუალო
ეს არის სრული მაგალითი, რომელიც გვიჩვენებს როგორ გავაერთიანოთ GUI და მათემატიკა
"""

import tkinter as tk
import math

def calculate():
    """
    ეს ფუნქცია გაეშვება Button-ზე დაწკაპუნებისას
    """
    # პირველი 10 ნატურალური რიცხვის ჯამი
    sum_result = sum(range(1, 11))
    
    # გეომეტრიული საშუალო
    product = 1
    for i in range(1, 11):
        product *= i
    geometric_mean = math.pow(product, 1/10)
    
    # კონსოლში დაბეჭდვა
    print(f"ჯამი: {sum_result}")
    print(f"გეომეტრიული საშუალო: {geometric_mean:.2f}")
    
    # Label-ებში გამოჩენა
    label1.config(text=f"ჯამი: {sum_result}")
    label2.config(text=f"გეომეტრიული საშუალო: {geometric_mean:.2f}")

# მთავარი ფანჯარა
root = tk.Tk()
root.title("დავალება #1")
root.geometry("400x300")

# პირველი Label - ჯამისთვის
label1 = tk.Label(root, text="ჯამი: -", font=("Arial", 14))
label1.pack(pady=10)

# მეორე Label - გეომეტრიული საშუალოსთვის
label2 = tk.Label(root, text="გეომეტრიული საშუალო: -", font=("Arial", 14))
label2.pack(pady=10)

# Button - გამოთვლის ღილაკი
button = tk.Button(
    root,
    text="გამოთვალე",
    command=calculate,  # calculate ფუნქცია გაეშვება დაწკაპუნებისას
    font=("Arial", 12),
    bg="lightgreen",
    width=15,
    height=2
)
button.pack(pady=20)

# ფანჯრის გაშვება
root.mainloop()

