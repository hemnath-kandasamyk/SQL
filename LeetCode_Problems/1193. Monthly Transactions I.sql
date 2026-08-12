#1193. Monthly Transactions I
SELECT 
DATE_FORMAT(trans_date,'%Y-%m') AS month,
country,
count(*) as trans_count,
sum(CASE WHEN STATE = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN STATE = 'approved' THEN amount ELSE 0 END ) AS approved_total_amount
 FROM
Transactions A
GROUP BY month,country;
