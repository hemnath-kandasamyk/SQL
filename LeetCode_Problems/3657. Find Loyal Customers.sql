# 3657. Find Loyal Customers 
SELECT
    customer_id
FROM 
    customer_transactions
GROUP BY 
    customer_id
HAVING
    COUNT(*)>=3 
    AND
    DATEDIFF(MAX(transaction_date),MIN(transaction_date)) >=30
    AND
    (SUM(transaction_type ='refund')/COUNT(*) *100)<20 
ORDER BY 
    customer_id
