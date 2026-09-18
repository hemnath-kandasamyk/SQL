# 3421. Find Students Who Improved
  
WITH CTE1 AS
(
    SELECT
        student_id,
        subject,
        FIRST_VALUE(score) OVER(PARTITION BY student_id,subject ORDER BY exam_date) first_score,
        FIRST_VALUE(score) OVER(PARTITION BY student_id,subject ORDER BY exam_date DESC) latest_score
    FROM
        Scores    
)
SELECT
     *
FROM
    CTE1
WHERE
    first_score<latest_score
GROUP BY
    student_id,subject
