-- Count missing start station names by member type 
SELECT
	strftime('%Y-%m', started_at) AS ride_month, 
	member_casual,
	sum(start_station_name IS NULL OR TRIM(start_station_name) = '') AS missing_start_station,
	count(*) AS total_rides
FROM
	rides_cleaned
WHERE 
	started_at >= '2025-10-01' AND started_at < '2026-10-01'
GROUP by 
	ride_month, member_casual
ORDER by  
	ride_month, member_casual;
	
-- Count missing start station name by bike type 
SELECT
	strftime('%Y-%m', started_at) AS ride_month, 
	rideable_type,
	sum(start_station_name IS NULL OR TRIM(start_station_name) = '') AS missing_start_station,
	count(*) AS total_rides
FROM
	rides_cleaned
WHERE
	started_at >= '2025-10-01' AND started_at < '2026-10-01'
GROUP by
	ride_month, rideable_type
ORDER by 
	ride_month, rideable_type;
	
-- Count missing end station names by bike type
SELECT
	strftime('%Y-%m', started_at) AS ride_month,
	rideable_type,
	sum(end_station_name IS NULL OR TRIM(end_station_name) = '') AS missing_end_station,
	count(*) AS total_rides
FROM
	rides_cleaned
WHERE 
	started_at >= '2025-10-01' AND started_at < '2026-10-01'
GROUP by
	ride_month, rideable_type
ORDER by
	ride_month, rideable_type;
	
-- Count missing start and end station names by ebike type 
SELECT 
	strftime('%Y-%m', started_at) AS ride_month,
	sum(
	(start_station_name IS NULL OR TRIM(start_station_name) = '') 
	AND
    (end_station_name is NULL or trim(end_station_name) = '')) AS missing_both_stations 
FROM 
	rides_cleaned
WHERE
	rideable_type = 'electric_bike' AND started_at >= '2025-10-01' AND started_at < '2026-10-01' 
GROUP by 
	ride_month;
	
