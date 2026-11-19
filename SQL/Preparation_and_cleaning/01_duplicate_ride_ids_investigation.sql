-- Find duplicate ride ID's
SELECT 
	ride_id,
	count(*) as occurences
FROM
	rides_combined
GROUP by
	ride_id
HAVING count(*) > 1;
-- Examine the duplicated records
SELECT
	ride_id,
	started_at,
	ended_at,
	member_casual
FROM
	rides_combined
WHERE ride_id in (
	SELECT ride_id
	FROM rides_combined
	GROUP by ride_id
	HAVING count(*) > 1
	)
ORDER by ride_id, started_at;
/* Check for differences across all 13 columns. Zero rows returned confirms all duplicates are identical. */
SELECT *
FROM
	rides_combined
WHERE
	ride_id in (
	SELECT ride_id
	FROM rides_combined
	GROUP by ride_id
	HAVING count(*) > 1
	)
GROUP by
	ride_id,
	rideable_type,
	started_at,
	ended_at,
	start_station_name,
	start_station_id,
	end_station_name,
	end_station_id,
	start_lat,
	start_lng,
	end_lat,
	end_lng,
	member_casual
HAVING count(*) = 1;
