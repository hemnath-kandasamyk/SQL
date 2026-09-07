# 1341. Movie Rating

(
    select
    title as results 
    from
    (
        select
        mr.movie_id,
        m.title,
        mr.rating,
        mr.created_at
        from MovieRating mr
        left join Movies m
        on mr.movie_id = m.movie_id
        )t
    where created_at>='2020-02-01' and created_at<'2020-03-01'
    group by movie_id
    order by avg(rating) desc,title
    limit 1
)

union all 

(
    select
    name as results
    from 
    (
        select 
        u.name,
        mr.rating
        from MovieRating mr
        left join Users u
        on mr.user_id = u.user_id
    )t
    group by name
    order by count(1) desc, name
    limit 1
)
