CREATE DATABASE SQLPractice;

USE SQLPractice;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Score INT
);


INSERT INTO Customers
(CustomerID, FirstName, LastName, Country, Score)
VALUES
(1, 'John', 'Smith', 'USA', 85),
(2, 'Emma', 'Johnson', 'UK', 92),
(3, 'Michael', 'Brown', 'Canada', 78),
(4, 'Sophia', 'Williams', 'USA', 95),
(5, 'Daniel', 'Jones', 'Australia', 67),
(6, 'Olivia', 'Davis', 'India', 88),
(7, 'James', 'Wilson', 'Germany', 73);


SELECT * FROM Customers;

-- Aggregate Window functions - Count
SELECT 
   CustomerId,
   country,
   count(*) OVER() Total
FROM Customers;

SELECT
    *,
    (SELECT COUNT(DISTINCT Country) FROM Customers)  AS TotalCountry
FROM Customers;


-- Aggregate Window functions - Sum


CREATE TABLE Sales (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Sales DECIMAL(10,2),
    ProductID INT
);


INSERT INTO Sales (OrderID, OrderDate, Sales, ProductID)
VALUES
(1001, '2026-01-05', 1250.50, 101),
(1002, '2026-01-08', 850.00, 102),
(1003, '2026-01-12', 2100.75, 103),
(1004, '2026-01-15', 450.25, 104),
(1005, '2026-01-20', 1750.00, 101),
(1006, '2026-02-03', 920.50, 105),
(1007, '2026-02-10', 3200.00, 103),
(1008, '2026-02-14', 680.75, 102),
(1009, '2026-02-20', 1450.00, 106),
(1010, '2026-03-01', 2750.25, 104);

-- for null value classification

INSERT INTO Sales(OrderID, OrderDate, ProductID) 
values (1011, '2026-03-01', 104);


SELECT * FROM Sales;


select 
    *,
    sum(sales) over() TotalSales,
    sum(sales) over(partition by productId) TotalSalesPerProductID
from Sales;


-- comparision Analysis
-- Find the percentage contribution of each product's sales to the total sale


SELECT
  *,
  sum(sales) OVER() TotalSales,
  ROUND(sales / sum(sales) OVER() * 100, 2) percentage
FROM
  sales;  


-- Average avg() aggeregate window function 

SELECT
  *,
  avg(sales) OVER() avgsales,
  avg(coalesce(sales, 0)) OVER() avgsalesincldenull
FROM
  sales;


-- Find all orders where sales are higher than the average sales across all orders.


SELECT
  *
FROM
  (
    SELECT
      orderId,
      productId,
      sales,
      avg(coalesce(sales, 0)) OVER() avgsales
    FROM
      sales
  ) t
WHERE
  sales >= avgsales;


-- Min/Max in window functions 


SELECT
  *,
  min(coalesce(sales, 0)) OVER(
    PARTITION BY
      productId
  ) LowestSales,
  max(coalesce(sales, 0)) OVER(
    PARTITION BY
      productId
  ) HighestSales
FROM
  sales;
  
  --  Show the record with the highest sales
  
SELECT
  *
FROM
  (
    SELECT
      *,
      max(sales) OVER() HighestSales
    FROM
      sales
  ) t
WHERE
  sales = HighestSales;


-- find the deviation of each sales form the minimum sales and maximum sales amount
  
  SELECT
  *,
  max(coalesce(sales, 0)) OVER() highestSales,
  min(coalesce(sales, 0)) OVER() Lowesales,
  coalesce(sales, 0) - min(coalesce(sales, 0)) OVER() deviationformin,
  max(coalesce(sales, 0)) OVER() - coalesce(sales, 0)  deviationformax
FROM
  sales;


-- Running & Rolling Total by using Frame Clause

SELECT
  *,
  sum(productId) OVER(
    ORDER BY
      productId ROWS BETWEEN unbounded preceding
      AND current row
  ) runningSum,
  sum(productId) OVER(
    ORDER BY
      productId ROWS BETWEEN 2 preceding
      AND current row
  ) rollingSum
FROM
  Sales;

-- Moving Average 

SELECT
  OrderID,
  ProductID,
  OrderDate,
  Sales,
  AVG(Sales) OVER(
    PARTITION BY
      ProductID
  ) AvgByProduct,
  AVG(Sales) OVER(
    PARTITION BY
      ProductID
    ORDER BY
      OrderDate
  ) MovingAvg
FROM
  Sales;
  
-- current order and next order by custom frame clause

SELECT
  OrderID,
  ProductID,
  OrderDate,
  Sales,
  AVG(Sales) OVER(
    PARTITION BY
      ProductID
  ) AvgByProduct,
  AVG(Sales) OVER(
    PARTITION BY
      ProductID
    ORDER BY
      OrderDate
  ) MovingAvg,
  AVG(coalesce(Sales, 0)) OVER(
    PARTITION BY
      ProductID
    ORDER BY
      OrderDate ROWS BETWEEN current row
      AND 1 following
  ) RollingAvg
FROM
  Sales;

