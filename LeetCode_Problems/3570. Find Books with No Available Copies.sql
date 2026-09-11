# 3570. Find Books with No Available Copies
SELECT
    l.book_id,
    l.title,
    l.author,
    l.genre,
    l.publication_year,
    t.sm AS current_borrowers
FROM
    library_books l
LEFT JOIN
    (
        SELECT
            book_id,
            SUM(CASE WHEN return_date IS NULL THEN 1 ELSE 0 END) AS sm
        FROM
        borrowing_records
        GROUP BY book_id
    )t
ON 
    l.book_id = t.book_id
WHERE 
    (l.total_copies-t.sm)=0
ORDER BY
    t.sm DESC,l.title
