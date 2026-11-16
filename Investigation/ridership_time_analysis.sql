-- Total rides by day of week and membership type
SELECT
	member_casual,
	strftime('%w', started_at) AS day_of_week, -- extracts day of week (0=Sun,6=Sat,etc)
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by -- which rows to count together
	member_casual, day_of_week
ORDER by --how to arrange the results (sort)
	member_casual, day_of_week;
	
-- Total rides by hour of day and membership type
SELECT
	member_casual,
	strftime('%H', started_at) AS hour_of_day, --extracts hour of day(24hr format)
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by -- which rows to count together
	member_casual, hour_of_day
ORDER by -- how to arrange the results (sort)
	member_casual, hour_of_day;
	
-- Total rides by membership type, day of week, and hour of day
SELECT
	member_casual,
	strftime('%w', started_at) AS day_of_week, -- extracts day of week
	strftime('%H', started_at) AS hour_of_day, -- extracts hour of day
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by -- which rows to count together
	member_casual, day_of_week, hour_of_day
ORDER by-- how to arrange the results (sort)
	member_casual, day_of_week, hour_of_day;
	
-- Total rides by month and membership type 
SELECT
	strftime('%Y-%m', started_at) AS ride_month, -- extracts year and month
	member_casual,
	count(*) AS total_rides
FROM
	rides_cleaned
WHERE -- which rows to include (filter)
	started_at >= '2025-10-01' AND started_at < '2026-10-01'
GROUP by --which rows to count together
	ride_month, member_casual
ORDER by -- how to arrange the results (sort) 
	ride_month, member_casual;