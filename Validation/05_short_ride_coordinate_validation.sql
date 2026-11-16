/*Counts rides under 1 minute by rider type, checking for identical start/end coordinates and missing coordinate values*/
SELECT
	member_casual,
	count(*) AS total_short_rides,
	sum(Case When start_lat = end_lat
	AND start_lng = end_lng
	THEN 1
	ELSE 0 
	End) AS matching_coordinates,
	sum(Case When start_lat IS NULL OR trim(start_lat) = ''
	OR start_lng IS NULL OR trim(start_lng) = ''
	OR end_lat IS NULL OR trim(end_lat) = ''
	OR end_lng IS NULL OR trim(end_lng) = ''
	THEN 1
	ELSE 0
	END) AS missing_coordinates
FROM
	rides_2025_10
WHERE	
	(julianday(ended_at) - julianday(started_at)) * 1440 < 1
Group by
	member_casual