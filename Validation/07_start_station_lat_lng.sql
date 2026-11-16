SELECT
	count(*) as total_rides,
	sum(
		CASE
			WHEN start_lat is NULL
				or start_lng is NULL
			THEN 1
			ELSE 0
		END) AS missing_coordinates
FROM
	rides_cleaned
WHERE
	start_station_name is NOT NULL AND trim(start_station_name) <> '' AND started_at >= '2025-10-01' AND started_at < '2026-10-01'