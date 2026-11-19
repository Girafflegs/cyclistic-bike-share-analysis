-- Ridership by bike type and membership
SELECT
	member_casual,
	rideable_type,
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by 
	member_casual, rideable_type
ORDER by
	member_casual, rideable_type;
	
-- Short rides by bike type 
SELECT
	rideable_type,
	count(*) AS total_rides
FROM
	rides_cleaned
WHERE 
	(julianday(ended_at) - julianday(started_at)) * 86400 < 60
GROUP by
	rideable_type
ORDER by 
	rideable_type;
