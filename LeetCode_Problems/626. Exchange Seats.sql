# 626. Exchange Seats
SELECT
  id,
  ifnull(CASE WHEN id % 2 = 0 THEN ename ELSE oname END, student) AS student
FROM (
  SELECT
    *,
    LEAD(student) OVER () oname,
    LAG(student) OVER () ename
  FROM Seat
) t;
