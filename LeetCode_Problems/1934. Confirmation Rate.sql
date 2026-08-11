#1934. Confirmation Rate
SELECT A.user_id,
round(
    SUM(case 
    when B.action = 'confirmed' then 1
      else 0 end)
      /count(A.user_id) ,2)
      as confirmation_rate
FROM Signups A
LEFT JOIN Confirmations B
ON A.user_id = B.user_id
group by A.user_id;
