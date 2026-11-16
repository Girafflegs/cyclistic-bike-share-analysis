/* Selects rides lasting less than 1 munute with start/end coordinates converted to numeric values. Prepares the data for geographic distance analysis in Python */
SELECT
	ride_id,
	member_casual,
	started_at,
	ended_at,
	CAST(start_lat AS REAL) AS start_lat,
	CAST(start_lng AS REAL) AS start_lng,
	CAST(end_lat AS REAL) AS end_lat,
	CAST(end_lng AS REAL) AS end_lng
FROM
	rides_2025_10
WHERE
	(julianday(ended_at) - julianday(started_at)) * 1440 < 1
	