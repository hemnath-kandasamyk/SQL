# 608. Tree Node 
SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        ELSE
            CASE 
                WHEN id IN(SELECT p_id FROM Tree) THEN 'Inner'
                ELSE 'Leaf'
            END
        END
    AS type            
FROM Tree
