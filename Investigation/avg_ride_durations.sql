/* Average ride duration by membership type, excluding rides under 1 minute or over 25 hours */
SELECT
	member_casual,
	round(avg((julianday(ended_at) - julianday(started_at)) * 1440), 2) AS avg_minutes
FROM
	rides_cleaned
WHERE -- keep only rows where the condition is true (filter the data)
	(julianday(ended_at) - julianday(started_at)) * 1440
	BETWEEN 1 AND 1500
GROUP by -- which rows to count together	
	member_casual
	