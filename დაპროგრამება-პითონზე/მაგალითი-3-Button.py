"""
მაგალითი 3: Button (ღილაკი) ვიჯეტი
Button გამოიყენება მომხმარებლის მოქმედებისთვის
"""

import tkinter as tk

# ფუნქცია, რომელიც გაეშვება ღილაკზე დაწკაპუნებისას
def button_clicked():
    print("ღილაკზე დაწკაპუნება მოხდა!")
    # Label-ის ტექსტის შეცვლა
    label.config(text="ღილაკზე დაწკაპუნება მოხდა!")

root = tk.Tk()
root.title("Button მაგალითი")
root.geometry("400x300")

# Label - აჩვენებს შედეგს
label = tk.Label(root, text="დააწკაპუნეთ ღილაკზე", font=("Arial", 14))
label.pack(pady=20)  # pady = ვერტიკალური ზედნაყოფი

# Button - ღილაკი
button = tk.Button(
    root,
    text="დააწკაპუნეთ აქ",
    command=button_clicked,  # ფუნქცია, რომელიც გაეშვება დაწკაპუნებისას
    bg="lightblue",          # ფონის ფერი
    fg="black",              # ტექსტის ფერი
    font=("Arial", 12),
    width=15,                # სიგანე
    height=2                 # სიმაღლე
)
button.pack(pady=10)

root.mainloop()

