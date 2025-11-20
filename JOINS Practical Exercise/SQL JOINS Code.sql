SELECT*
FROM customer_large_dataset;

SELECT*
FROM orders_large_dataset;

SELECT*
FROM product_large_dataset;
-------------------------------------------------------------------------------------------------------------------------------

---1. INNER JOIN:Orders with Customer Name.
Question.
---List all orders with the customer name and product name.
---Expected output columns: OrderID,OrderDate ,CustomerName, ProductName, Quantit

SELECT A.orderid,
       A.orderdate,
       B.customername,
       C.productid,
       A.quantity
FROM orders_large_dataset AS A
INNER JOIN customer_large_dataset AS B ON A.customerid = B.customerid
INNER JOIN product_large_dataset AS C ON C.productid = C.productid
------------------------------------------------------------------------------------------------------------------------------

---2. INNER JOIN: customers who placed Orders
  Question.
---Which customer have placed at least one order.
---Expected output columns : customer_id,Customer_name,Country,Order_id,Order-date

  SELECT 
    A.CUSTOMERID,
    A.CUSTOMERNAME,
    A.COUNTRY,
    B.ORDERID,
    B.ORDERDATE
FROM CUSTOMER_LARGE_DATASET A
INNER JOIN ORDERS_LARGE_DATASET B
    ON A.CUSTOMERID = B.CUSTOMERID;


SELECT 
    A.customerid,
    A.customername,
    A.country,
    B.orderid,
    B.orderdate
FROM customer_large_dataset A
INNER JOIN orders_large_dataset B
    ON A.customerid = B.customerid
WHERE B.quantity = 1;
--------------------------------------------------------------------------------------------------------------------------

---3. LEFT JOIN: All Customers and Their Orders
Question:
---List all customers and any orders they might have placed. Include customers who have not placed any orders.
---Expected Output Columns:
--- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT A.CUSTOMERID,
       A.CUSTOMERNAME,
       A.COUNTRY,
       B.ORDERID,
       B.ORDERDATE,
       C.PRODUCTID,
       B.QUANTITY
FROM CUSTOMER_LARGE_DATASET AS A
LEFT JOIN ORDERS_LARGE_DATASET AS B ON A.CUSTOMERID =B .CUSTOMERID
LEFT JOIN PRODUCT_LARGE_DATASET AS C ON C.PRODUCTID=C.PRODUCTID;
-------------------------------------------------------------------------------------------------------------------------

--4. LEFT JOIN: Product Order Count
--Question:
--List all products and how many times each was ordered (if any).
--Expected Output Columns:
-- ProductID, ProductName, TotalOrders
--(TotalOrders is the count of how many times the product appears in orders)

SELECT 
    A.PRODUCTID,
    A.PRODUCTNAME,
    COUNT(B.ORDERID) AS TOTALORDERS
FROM PRODUCT_LARGE_DATASET AS A
LEFT JOIN ORDERS_LARGE_DATASET AS B
    ON A.PRODUCTID = B.PRODUCTID
GROUP BY 
    A.PRODUCTID,
    A.PRODUCTNAME;
-------------------------------------------------------------------------------------------------------------------------

-- 5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
--Question:
--Find all orders along with product details, including any products that might not have been ordered.
--Expected Output Columns:
--OrderID, OrderDate, ProductID, ProductName, Price, Quantity

SELECT A.PRODUCTID,
       A.PRODUCTNAME,
       B.ORDERID,
       B.ORDERDATE,
       B.QUANTITY,
       A.PRICE
FROM PRODUCT_LARGE_DATASET AS A
RIGHT JOIN ORDERS_LARGE_DATASET AS B
ON A.PRODUCTID = B.PRODUCTID;

-------------------------------------------------------------------------------------------------------------------------------------
--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
--Question:
--Which customers have made orders, and include customers even if they have never placed an order.
--Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity


SELECT 
    B.CUSTOMERID,
    B.CUSTOMERNAME,
    B.COUNTRY,
    A.ORDERID,
    A.ORDERDATE,
    A.PRODUCTID,
    A.QUANTITY
FROM ORDERS_LARGE_DATASET AS A
RIGHT JOIN CUSTOMER_LARGE_DATASET AS B
    ON A.CUSTOMERID = B.CUSTOMERID;

-----------------------------------------------------------------------------------------------------------------------------------------

--7. FULL OUTER JOIN: All Customers and All Orders
--Question:
--List all customers and orders, showing NULLs where customers have not ordered or where ordders have no customer info.
--Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT A.CUSTOMERID,
       A.CUSTOMERNAME,
       A.COUNTRY,
       B.ORDERID,
       B.ORDERDATE,
       B.PRODUCTID,
       B.QUANTITY
FROM CUSTOMER_LARGE_DATASET AS A
FULL OUTER JOIN ORDERS_LARGE_DATASET AS B
ON A.CUSTOMERID = B.CUSTOMERID

------------------------------------------------------------------------------------------------------------------------------------------

---8. FULL OUTER JOIN: All Products and Orders
---Question:
---List all products and orders, showing NULLs where products were never ordered or orders are missing product info
---Expected Output Columns:
--- ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT A.PRODUCTID,
       A.PRODUCTNAME,
       A.PRICE,
       B.ORDERID,
       B.ORDERDATE,
       B.CUSTOMERID,
       B.QUANTITY
FROM PRODUCT_LARGE_DATASET AS A
FULL OUTER JOIN ORDERS_LARGE_DATASET AS B
ON A.PRODUCTID = B.PRODUCTID;

-------------------------------------------------------------------------------------------------------------------------------------------
       
