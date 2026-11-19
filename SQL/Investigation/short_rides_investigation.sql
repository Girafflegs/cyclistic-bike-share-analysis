/* Investigates rides lasting less than 60 seconds,
   comparing their frequency across membership types
   and bike types to assess patterns in unusually short trips. */

-- Total rides by membership type
SELECT
	member_casual,
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by 
	member_casual;
	
-- Short rides by membership type
SELECT 
	member_casual,
	count(*) as short_rides
FROM
	rides_cleaned
WHERE
	(julianday(ended_at) - julianday(started_at)) * 86400 < 60
GROUP by
	member_casual;
	
--Total and short ebike rides by membership type
SELECT 
	member_casual,
	count(*) as total_ebike_rides,
	sum(
		(julianday(ended_at) - julianday(started_at)) * 86400 < 60) AS short_ebike_rides
FROM
	rides_cleaned
WHERE
	rideable_type = "electric_bike"
GROUP by
	member_casual;
	
-- Total short rides by bike type
SELECT 
	rideable_type,
	count(*) as total_rides,
	sum(
		(julianday(ended_at) - julianday(started_at)) * 86400 < 60) AS short_rides
FROM
	rides_cleaned
GROUP by
	rideable_type;
