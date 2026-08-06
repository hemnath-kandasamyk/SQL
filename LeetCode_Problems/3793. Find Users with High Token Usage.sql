SELECT
user_id,
COUNT(*) AS prompt_count,
ROUND(AVG(tokens),2) AS avg_tokens
FROM
prompts
GROUP BY
user_id
HAVING MAX(tokens)>AVG(tokens) AND COUNT(*)>=3
ORDER BY
avg_tokens DESC;
