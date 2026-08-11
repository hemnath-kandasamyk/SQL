#1280. Students and Examinations
SELECT T.student_id,
T.student_name,
T.subject_name,
COUNT(B.subject_name) AS attended_exams
FROM(SELECT * FROM Students A
join Subjects B)T
LEFT JOIN 
Examinations B
ON T.student_id = B.student_id AND T.subject_name = B.subject_name
GROUP BY T.student_id,T.subject_name
ORDER BY T.student_id;
