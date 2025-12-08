"""
მაგალითი 2: Label (ჭდე) ვიჯეტი
Label გამოიყენება ტექსტის გამოსაჩენად
"""

import tkinter as tk

root = tk.Tk()
root.title("Label მაგალითი")
root.geometry("400x300")

# მარტივი Label
label1 = tk.Label(root, text="ეს არის ჩემი პირველი ჭდე")
label1.pack()  # pack() აყენებს ვიჯეტს ფანჯარაში

# Label პარამეტრებით
label2 = tk.Label(
    root, 
    text="ფერადი ტექსტი",
    font=("Arial", 16),      # ფონტი და ზომა
    fg="blue",               # ტექსტის ფერი (foreground)
    bg="yellow"              # ფონის ფერი (background)
)
label2.pack(pady=10)  # pady = ვერტიკალური ზედნაყოფი

# Label ტექსტის შეცვლა
label3 = tk.Label(root, text="საწყისი ტექსტი")
label3.pack(pady=10)

# ტექსტის შეცვლა (2 გზა)
# გზა 1: config() მეთოდით
label3.config(text="შეცვლილი ტექსტი")

# გზა 2: პირდაპირ (ეს არ გამოვიყენოთ ახლა, მაგრამ იცოდეთ)
# label3["text"] = "შეცვლილი ტექსტი"

root.mainloop()

