import tkinter as tk
import mysql.connector
from tkinter import font


# Function to show Vehicle table
def show_vehicle_table(mydb):
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="automobiles_sales_db"
    )

    # Create a cursor object using the cursor() method
    cursor = conn.cursor()

    # Execute a SQL query

    cursor.execute("SELECT * FROM vehicle")
    data = cursor.fetchall()
    conn.close()
    display_data(data)


# Function to show Sales table
def show_sales_table(mydb):
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="automobiles_sales_db"
    )

    # Create a cursor object using the cursor() method
    cursor = conn.cursor()

    # Execute a SQL query

    cursor.execute("SELECT * FROM sales")
    data = cursor.fetchall()
    conn.close()
    display_data(data)


# Function to show Dealers table
def show_dealers_table(mydb):
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="automobiles_sales_db"
    )

    # Create a cursor object using the cursor() method
    cursor = conn.cursor()

    # Execute a SQL query

    cursor.execute("SELECT * FROM dealers")
    data = cursor.fetchall()
    conn.close()
    display_data(data)


# Function to display data in a new window
def display_data(data):
    new_window = tk.Toplevel(root)
    for row_index, row in enumerate(data):
        for col_index, value in enumerate(row):
            tk.Label(new_window, text=value, borderwidth=1, relief="solid").grid(row=row_index, column=col_index)


# Main function to create the GUI
def main():
    import mysql.connector

    # Establish a connection to the database
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="automobiles_sales_db"
    )

    global root
    root = tk.Tk()
    root.title("Interface")
    root.geometry("800x400+70+50")
    color = "#%02x%02x%02x" % (200,140,250)
    root.config(bg=color)
    # Login functionality
    def login():
        role = role_var.get()
        if role == "Customer":
            show_vehicle_table(conn)
        elif role == "Marketing Manager":
            show_sales_table(conn)
        elif role == "Distributor":
            show_dealers_table(conn)

    # GUI components
    role_var = tk.StringVar(root)
    role_var.set("Customer")
    roles = ["Customer", "Marketing Manager", "Distributor"]
    role_dropdown_width = len(max(roles, key=len))
    tk.Label(root, text="THE AUTOMOBILE CATALOGUE", font=('Algerian', 28)).place(x=130, y=10)

    tk.Label(root, text="Select Role:",font=('Georgia', 18, font.BOLD)).place(x=230,y=120)
    role_dropdown = tk.OptionMenu(root, role_var, *roles)
    role_dropdown.config(width=role_dropdown_width)
    role_dropdown.place(x=400,y=120)


    login_button = tk.Button(root, text="Login", font=('Helvatica', 15, font.BOLD),command=login)
    login_button.place(x=350,y=200)


    root.mainloop()


if __name__ == "__main__":
    main()