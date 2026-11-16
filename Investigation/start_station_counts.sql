-- Count rides by start station, member type, and bike type 
SELECT
	start_station_name,
	member_casual,
	rideable_type,
	count(*) AS ride_count
FROM
	rides_cleaned
WHERE
	start_station_name is NOT NULL AND Trim(start_station_name) != '' AND started_at >= '2025-10-01' AND started_at < '2026-10-01'
GROUP by
	start_station_name, member_casual, rideable_type
ORDER by
	ride_count DESC, member_casual DESC 