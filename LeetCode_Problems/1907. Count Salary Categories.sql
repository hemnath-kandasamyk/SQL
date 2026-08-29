# 1907. Count Salary Categories

SELECT 'Low Salary' AS category,
       accounts_count
FROM   (SELECT 'Low Salary',
               (SELECT Count(*)
                FROM   accounts
                WHERE  income < 20000)accounts_count)t
UNION
SELECT 'Average Salary',
       (SELECT Count(*)
        FROM   accounts
        WHERE  income >= 20000
               AND income <= 50000)accounts_count
UNION
SELECT 'High Salary',
       (SELECT Count(*)
        FROM   accounts
        WHERE  income > 50000)accounts_count
ORDER  BY accounts_count DESC; 
