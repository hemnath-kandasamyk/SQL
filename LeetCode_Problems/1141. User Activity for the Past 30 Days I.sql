# 1141. User Activity for the Past 30 Days I

SELECT
activity_date AS day,
count(*) AS active_users
FROM
(
    SELECT
    activity_date,
    user_id
    FROM  Activity
    WHERE activity_date<='2019-07-27' AND activity_date>='2019-06-28'
    GROUP BY activity_date,user_id
)t
GROUP BY activity_date;
