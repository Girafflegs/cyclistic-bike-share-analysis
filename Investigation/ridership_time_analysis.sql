/* Examines ridership patterns by membership type across days of the week, hours of the day, and months.
   Includes a combined day-of-week and hour-of-day analysis used to develop the ridership heat map. */

-- Total rides by day of week and membership type
SELECT
	member_casual,
	strftime('%w', started_at) AS day_of_week,
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by
	member_casual, day_of_week
ORDER by 
	member_casual, day_of_week;
	
-- Total rides by hour of day and membership type
SELECT
	member_casual,
	strftime('%H', started_at) AS hour_of_day, 
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by 
	member_casual, hour_of_day
ORDER by 
	member_casual, hour_of_day;
	
-- Total rides by membership type, day of week, and hour of day
SELECT
	member_casual,
	strftime('%w', started_at) AS day_of_week, 
	strftime('%H', started_at) AS hour_of_day, 
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by 
	member_casual, day_of_week, hour_of_day
ORDER by
	member_casual, day_of_week, hour_of_day;
	
-- Total rides by month and membership type 
SELECT
	strftime('%Y-%m', started_at) AS ride_month, 
	member_casual,
	count(*) AS total_rides
FROM
	rides_cleaned
WHERE -- which rows to include (filter)
	started_at >= '2025-10-01' AND started_at < '2026-10-01'
GROUP by 
	ride_month, member_casual
ORDER by 
	ride_month, member_casual;
