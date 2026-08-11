#1661. Average Time of Process per Machine
SELECT A.machine_id,
 ROUND((sum(B.timestamp)-sum(A.timestamp))/count(A.process_id),3) as processing_time
 FROM Activity A 
 LEFT JOIN Activity B
 On A.activity_type = 'start' and B.activity_type = 'end' 
 AND A.machine_id = B.machine_id
 AND A.process_id = B.process_id
 where B.timestamp is not null
 GROUP BY A.machine_id;
