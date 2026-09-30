-- # 3642. Find Books with Polarized Opinions
SELECT
    r.book_id,
    title,
    author,
    genre,
    pages,
    MAX(session_rating) - MIN(session_rating) AS rating_spread,
    ROUND(AVG(session_rating<=2 OR session_rating>=4),2) AS polarization_score
FROM
    reading_sessions r
LEFT JOIN
    books b
ON
    r.book_id = b.book_id
GROUP by
    book_id
HAVING
    MIN(session_rating)<=2 
    AND MAX(session_rating)>=4
    AND COUNT(*)>=5
    AND  polarization_score>=0.6
ORDER BY
    polarization_score DESC,
    title DESC
