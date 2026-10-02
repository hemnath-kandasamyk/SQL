-- Top Earners
select 
    (months * salary) mnth,
    count(*)  from Employee
group by 
    mnth
order by 
    mnth DESC
limit 1
