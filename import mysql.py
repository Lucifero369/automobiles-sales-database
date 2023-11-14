import mysql.connector

# Establish a connection to the database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="mynew"
)

# Create a cursor object using the cursor() method
cursor = conn.cursor()

# Execute a SQL query
cursor.execute("SELECT * FROM vehicle")

# Fetch and print the result
result = cursor.fetchall()
print(result)

# Close the cursor and connection
cursor.close()
conn.close()