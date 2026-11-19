/* Average ride duration by membership type and bike type excluding rides under 1 minute or over 25 hours */
SELECT
	member_casual,
	rideable_type,
	round(avg((julianday(ended_at) - julianday(started_at)) * 1440), 2) AS avg_minutes
FROM
	rides_cleaned
WHERE 
	(julianday(ended_at) - julianday(started_at)) * 1440
	BETWEEN 1 AND 1500
GROUP by 
	member_casual, rideable_type
ORDER by
	member_casual, rideable_type
