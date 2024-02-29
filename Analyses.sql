# number of rides driven by casual vs member
select member_casual , count(*) as Number_of_rides 
from `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
where ride_length_s > 0 
group by member_casual 
order by member_casual ;

# average ride time of casual vs member 
select member_casual, round(avg(ride_length_s)/60,2) as Avg_ride_length_min 
from `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
where ride_length_s > 0 
#where start_station_name is not null 
#and end_station_name is not null
group by member_casual
order by member_casual; 

# number of types of bikes driven by casual vs member

select member_casual , rideable_type , count(*) as Count 
from `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
where ride_length_s > 0 
group by member_casual , rideable_type
order by member_casual  ;

# number of days driven by by casual vs member


select member_casual , DAY_OF_WEEK as Day , count(*) as Count 
from `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
where ride_length_s > 0 
group by member_casual , Day_of_week
order by member_casual ,
case Day_of_week
  when 'Monday' then 1
  when 'Tuesday' then 2
  when 'Wednesday' then 3
  when 'Thursday' then 4
  when 'Friday' then 5
  when 'Saturday' then 6
  when 'Sunday' then 7
  END;

# number of stations for member vs casual 
select member_casual , count(distinct(end_station_name)) as Distinct_Stations
from `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
where ride_length_s > 0 
#where start_station_name is not null 
#and end_station_name is not null
group by member_casual
order by member_casual; 

# distance of member vs casual 
 select member_casual, avg(distance) as Avg_distance
from `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
where ride_length_s > 0 
#where start_station_name is not null 
#and end_station_name is not null
group by member_casual
order by member_casual; 

# month wise for member vs casual 

with first_table as (
select member_casual , Month_Name , 

count(*) as Count ,
from `cyclisticdataset-414911.cyclistic_TripData.TripData2023_extra` 
where ride_length_s > 0 
group by member_casual , Month_Name
order by member_casual ,
case  Month_Name 
  when 'January' then 1
  when 'February' then 2
  when 'March' then 3
  when 'April' then 4
  when 'May' then 5
  when 'June' then 6
  when 'July' then 7
  when 'August' then 8
  when 'September' then 9
  when 'October' then 10
  when 'November' then 11
  when 'December' then 12
  END 
  )
  select FT.*, Lag(FT.Count) OVER (PARTITION by FT.member_casual order by case  Month_Name 
  when 'January' then 1
  when 'February' then 2
  when 'March' then 3
  when 'April' then 4
  when 'May' then 5
  when 'June' then 6
  when 'July' then 7
  when 'August' then 8
  when 'September' then 9
  when 'October' then 10
  when 'November' then 11
  when 'December' then 12
  END ) as Lagg , 

  ROUND((100*(Count - (Lag(FT.Count) OVER (PARTITION by FT.member_casual order by case  Month_Name 
  when 'January' then 1
  when 'February' then 2
  when 'March' then 3
  when 'April' then 4
  when 'May' then 5
  when 'June' then 6
  when 'July' then 7
  when 'August' then 8
  when 'September' then 9
  when 'October' then 10
  when 'November' then 11
  when 'December' then 12
  END ))))/Count,2) as Percentage_Change

   from first_table FT;






