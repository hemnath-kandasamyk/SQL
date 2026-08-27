# 601. Human Traffic of Stadium
SELECT
  id,
  visit_date,
  people
FROM (
  SELECT
    *,
    LEAD(people, 2) OVER () pre2,
    LEAD(people) OVER () pre,
    LAG(people) OVER () post,
    LAG(people, 2) OVER () post2
  FROM Stadium
) t
WHERE people >= 100
  AND (pre >= 100 OR post2 >= 100)
  AND (post >= 100 OR pre2 >= 100)
  AND (pre >= 100 OR post >= 100);
