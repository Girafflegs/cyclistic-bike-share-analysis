-- Counts rides lasting less than 1 minute, grouped by rider type
SELECT
	member_casual,
	count(*)
FROM
	rides_2025_10
WHERE	
	(julianday(ended_at) - julianday(started_at)) * 1440 < 1
Group by
	member_casual