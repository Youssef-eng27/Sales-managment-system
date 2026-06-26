import pyodbc

conn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost;"
    "DATABASE=Sales_DB;"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;"
)
cursor1= conn.cursor()
cursor2= conn.cursor()
cursor3= conn.cursor()
# to show all orders
def all_order():
        cursor1.execute("""select * 
            from Orders as o 
            left join customers as c on c.cust_id=o.cust_id 
            left join products as p on o.product_id = p.productID""")
        for row in cursor1.fetchall():
            print(row)
# top products
def top_product():
        cursor2.execute(""" select top (3) product_name,
sum(quantity * price) as total_each_sale
from Orders as o 
right join products as p on o.product_id = p.productID
group by product_name
order by sum(quantity * price) desc """)
        for row in cursor2.fetchall():
            print(row)        
# to show top cities 
def top_city():
        cursor3.execute(""" select sum(quantity * price) as total_each_sale,
city
from Orders as o 
left join customers as c on c.cust_id=o.cust_id
left join products as p on o.product_id = p.productID
group by city """)
        for row in cursor3.fetchall():
            print(row)  
print('the orders are',all_order())
print('the top 3 products are ',top_product())
print('the top cities',top_city())
