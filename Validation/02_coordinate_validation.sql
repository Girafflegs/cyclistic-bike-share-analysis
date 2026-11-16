SELECT
	count(*) AS invalid_coordinates
FROM
	rides_2025_10
WHERE
	CAST(start_lat AS REAL) NOT BETWEEN -90 AND 90
	OR CAST(end_lat AS REAL) NOT BETWEEN -90 AND 90
	or CAST(start_lng AS REAL) NOT BETWEEN -180 AND 180
	Or CAST(end_lng AS REAL) NOT BETWEEN -180 AND 180
