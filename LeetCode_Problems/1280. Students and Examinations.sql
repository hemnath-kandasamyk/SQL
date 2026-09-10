#1280. Students and Examinations
  
SELECT 
    c.student_id,
    c.student_name,
    c.subject_name,
    IFNULL(e.cnt,0) AS attended_exams    
FROM
    (
        SELECT
            student_id,
            subject_name,
            COUNT(*) cnt
        FROM Examinations 
        GROUP BY student_id,subject_name
    )e
RIGHT JOIN
    (
        SELECT *
        FROM Students
        JOIN 
        Subjects
    )c
ON 
    c.student_id = e.student_id
    AND c.subject_name = e.subject_name
ORDER BY c.student_id,c.subject_name 
