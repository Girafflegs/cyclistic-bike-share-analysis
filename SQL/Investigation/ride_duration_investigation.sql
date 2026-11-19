/* Investigates ride duration patterns and unusually long trips.
   Includes average ride duration by membership type and queries
   examining rides exceeding 25 hours and the longest e-bike rides. */

-- 1. Average ride duration by member type
SELECT 
	member_casual,
	round(avg((julianday(ended_at) - julianday(started_at)) * 1440), 2) AS avg_minutes 
FROM
	rides_cleaned
GROUP by
	member_casual;
	
-- 2. Count rides over 25 hours
SELECT
	count(*) AS rides_over_25_hours
FROM
	rides_cleaned
WHERE
	(julianday(ended_at) - julianday(started_at)) * 24 > 25;
	
-- 3. Examine individual rides exceeding 25 hours
SELECT
	ride_id,
	member_casual,
	rideable_type,
	started_at,
	ended_at,
	round((julianday(ended_at) - julianday(started_at)) * 24, 2) AS duration_hours
FROM
	rides_cleaned
WHERE
	(julianday(ended_at) - julianday(started_at)) * 24 > 25
ORDER by
	duration_hours DESC;
	
-- 4. Examine the 10 longest ebike rides
SELECT
	ride_id,
	member_casual,
	rideable_type,
	started_at,
	ended_at,
	round((julianday(ended_at) - julianday(started_at)) * 24, 2) AS duration_hours
FROM
	rides_cleaned
WHERE
	rideable_type = 'electric_bike'
ORDER by
	duration_hours DESC
LIMIT 10;
	
