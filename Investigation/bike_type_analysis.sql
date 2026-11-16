-- Ridership by bike type and membership
SELECT
	member_casual,
	rideable_type,
	count(*) AS total_rides
FROM
	rides_cleaned
GROUP by -- which things to count together (make the piles)
	member_casual, rideable_type
ORDER by -- how to arrange the results (arrange the results)
	member_casual, rideable_type;
	
-- Short rides by bike type 
SELECT
	rideable_type,
	count(*) AS total_rides
FROM
	rides_cleaned
WHERE --keep only rows where the condition is true (filter the data)
	(julianday(ended_at) - julianday(started_at)) * 86400 < 60
GROUP by -- which rows to count together (make the piles)
	rideable_type
ORDER by -- how to arrange the results (sort)
	rideable_type;