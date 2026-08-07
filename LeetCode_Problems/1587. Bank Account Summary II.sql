#1587. Bank Account Summary II
SELECT
A.name,
SUM(amount) AS BALANCE
FROM
Users A
LEFT JOIN
Transactions B
ON 
A.account = B.account
GROUP BY
A.account
HAVING balance>10000;
