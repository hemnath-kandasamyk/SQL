CREATE DATABASE SQLPractice;

USE SQLPractice;

CREATE TABLE Products (
    productId INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    units INT NOT NULL DEFAULT 0 CHECK (units >= 0)
);

INSERT INTO Products (productName, price, units)
VALUES
('Laptop', 75000.00, 10),
('Mobile Phone', 35000.00, 25),
('Keyboard', 1500.00, 50),
('Mouse', 800.00, 75),
('Monitor', 12000.00, 20),
('Headphones', 2500.00, 40),
('Tablet', 28000.00, 15),
('Smart Watch', 5000.00, 30),
('Printer', 15000.00, 12),
('Webcam', 3000.00, 35);


-- SQL Ranking Window Functions
 
/*
RANK 

SYNTAX :

rank() over (
  partition by
    productId
  order by
    sales
)

*/

/*
ROW_NUMBER()

SYNTAX : 

ROW NUMBER () OVER (
  ORDER BY
    Sales DESC
)

*/

select
  *,
  row_number() over (
    order by
      sales desc
  ) SalesRank_row
from
  sales;
  
  
select
  productId,
  row_number() over (
    order by
      productId
  ) rowno,
  rank() over (
    order by
      productId
  ) rankno,
  dense_rank() over (
    order by
      productId
  ) denserankno
from
  Sales;

  
-- Top N Analysis 

select
  *
from
  (
    SELECT
      OrderID,
      ProductID,
      Sales,
      ROW_NUMBER() OVER (
        PARTITION BY
          ProductID
        ORDER BY
          Sales DESC
      ) RankByProduct
    FROM
      Sales
  ) t
where
  RankByProduct = 1;
 
 
-- Bottom N Analysis 

-- Reverse the above query to find the answer 

/* NTILE()

ntile (2) over (
  order by
    sales desc
)

*/


SELECT
OrderID,
Sales,
NTILE(1) OVER (ORDER BY Sales DESC) OneBucket,
NTILE(2) OVER (ORDER BY Sales DESC) TwoBucket,
NTILE(3) OVER (ORDER BY Sales DESC) ThreeBucket,
NTILE(4) OVER (ORDER BY Sales DESC) FourBucket
FROM Sales;


-- Segment all orders into 3 categories: high , medium and low sales.

SELECT
  *,
  CASE
    WHEN bucket = 1 then 'High'
    when bucket = 2 then 'Medium'
    when bucket = 3 then 'Low'
  end SalesSegmentation
FROM
  (
    SELECT
      OrderId,
      Sales,
      NTILE (3) OVER (
        ORDER BY
          Sales DESC
      ) bucket
    FROM
      sales
  ) t


-- percentage based ranking functions 

/*
CUME_DIST

CUME_DIST() OVER (ORDER BY Sales DESC)

PERCENT_RANK

PERCENT_RANK () OVER (ORDER BY Sales DESC)

*/

select
  *,
  CONCAT (distrank * 100, '%') DistRank,
  CONCAT (percentrank * 100, '%') PercentRank
from
  (
    select
      *,
      CUME_DIST() OVER (
        ORDER BY
          price DESC
      ) distrank,
      ROUND(
        PERCENT_RANK() OVER (
          ORDER BY
            price DESC
        ),
        2
      ) percentrank
    from
      Products
  ) t;
