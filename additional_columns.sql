   # extracting 2 extra columns 
   SELECT   T.* ,
     CASE EXTRACT(DAYOFWEEK FROM started_at)
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
  END AS DAY_OF_WEEK,
  case EXTRACT(month FROM started_at)
  WHEN 1 then 'January' 
  WHEN 2 then 'February' 
  WHEN 3 then 'March' 
  WHEN 4 then 'April' 
  WHEN 5 then 'May' 
  WHEN 6 then 'June' 
  WHEN 7 then 'July' 
  WHEN 8 then 'August' 
  WHEN 9 then 'September' 
  WHEN 10 then 'October' 
  WHEN 11 then 'Novemeber' 
  WHEN 12 then 'December' 
  
END as Month_Name , 
     TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length_s,
     round(sqrt(pow(end_lng-start_lng,2) + pow(end_lat-start_lat,2))*1000,2) as distance
     
      FROM `cyclisticdataset-414911.cyclistic_TripData.TripData2023` T
--where EXTRACT(MONTH FROM T.started_at) = 12
order by started_at desc
  -- LIMIT 1000 ;

# next step is to add new table , and add new columns as part of this table, NOTE : CANNOT execute DML queries with existing sandbox account 


CREATE TABLE `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
AS 
select ride_id , rideable_type, started_at, 
 CASE EXTRACT(DAYOFWEEK FROM started_at)
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
  END AS DAY_OF_WEEK,
  case EXTRACT(month FROM started_at)
  WHEN 1 then 'January' 
  WHEN 2 then 'February' 
  WHEN 3 then 'March' 
  WHEN 4 then 'April' 
  WHEN 5 then 'May' 
  WHEN 6 then 'June' 
  WHEN 7 then 'July' 
  WHEN 8 then 'August' 
  WHEN 9 then 'September' 
  WHEN 10 then 'October' 
  WHEN 11 then 'November' 
  WHEN 12 then 'December' 
  
END as Month_Name , ended_at , 
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length_s,
  start_station_name, start_station_id, end_station_name,end_station_id,start_lat,start_lng,end_lat,end_lng, member_casual , 
   round(sqrt(pow(end_lng-start_lng,2) + pow(end_lat-start_lat,2))*1000,2) as distance
     from 
`cyclisticdataset-414911.cyclistic_TripData.TripData2023` 
