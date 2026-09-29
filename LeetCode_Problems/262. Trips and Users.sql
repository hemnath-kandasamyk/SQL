# 262. Trips and Users Direct select 
SELECT
    request_at as `Day`,
    round(avg(if(t.status = 'completed',0,1)),2) `Cancellation Rate`
from
    Trips t
where
    driver_id in (select users_id from Users where banned = 'No')
    and
    client_id in (select users_id from Users where banned = 'No')
    and 
    request_at in('2013-10-01','2013-10-02','2013-10-03')
group by
    request_at;
_____________________________________________________________________________
# 262. Trips and Users using Join 
SELECT
    request_at as `Day`,
    round(avg(t.status <> 'completed'),2) `Cancellation Rate`
from
    Trips t
join
    users u on t.client_id = u.users_id and u.banned = 'No'
join 
    users v on t.driver_id = v.users_id and v.banned = 'No'
where 
    request_at between '2013-10-01' and '2013-10-03'
group by
    request_at

