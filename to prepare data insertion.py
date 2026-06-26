import random

customers=[]
orders=[]
products=[]
lcust=['younis','mena','rawan','abdallah','aziz','tefa','hazem','reem','ola']
lcit=['EGY','ksa','usa','uk','par','lib','ir','de','ind','jap']
lp=['rexona','nevia','eva','vatika','familia','fa','starvile','oxi','peril','bahi']

#loop to insert customer
for i in range (10):
    l1=random.randint(20,30) #cust_id
    l2=random.randint(1000,1010) #pid
    l3=random.randint(100,800) #prices
    l4=random.randint(1,11) #oid
    l5=random.randint(1,11) #quantity
    l6=random.randint(1,32) #date
    date=f'2026-06-{l6:02d}'
    custname=random.choice(lcust).strip().title()
    city=random.choice(lcit).strip().upper()
    product=random.choice(lp).strip().title()
    
   
    customers.append(f"({l1},'{custname}','{city})")
    products.append(f"({l2},'{product}',{l3})")
    orders.append(f'({l4},{l5},{date},{l1},{l2})')
print(customers,end=",\n")
print(products,end=",\n")
print(orders,end=",\n")    