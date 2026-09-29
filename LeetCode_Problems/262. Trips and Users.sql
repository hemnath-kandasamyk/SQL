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
    request_at
