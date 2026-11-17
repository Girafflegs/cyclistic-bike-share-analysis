/* Check for missing or empty values across all 13 columns
   in the October 2025 trip dataset. */
SELECT
	sum(Case When ride_id IS NULL or Trim(ride_id) = '' Then 1 Else 0 End) AS missing_ride_id,
	sum(Case When rideable_type IS NULL or Trim(rideable_type) = '' Then 1 Else 0 End) AS missing_rideable_type,
	sum(Case When started_at IS NULL or Trim(started_at) = '' Then 1 Else 0 End) AS missing_started_at,
	sum(Case When ended_at IS NULL or Trim(ended_at) = '' Then 1 Else 0 End) AS missing_ended_at,
	sum(Case When start_station_name IS NULL or Trim(start_station_name) = '' Then 1 Else 0 End) AS missing_start_station_name,
	sum(Case When start_station_id IS NULL or Trim(start_station_id) = '' Then 1 Else 0 End) AS missing_start_station_id,
	sum(Case When end_station_name IS NULL or Trim(end_station_name) = '' Then 1 Else 0 End) AS missing_end_station_name,
	sum(Case When end_station_id IS NULL or Trim(end_station_id) = '' Then 1 Else 0 End) AS missing_end_station_id,
	sum(Case When start_lat IS NULL or Trim(start_lat) = '' Then 1 Else 0 End) AS missing_start_lat,
	sum(Case When start_lng IS NULL or Trim(start_lng) = '' Then 1 Else 0 End) AS missing_start_lng,
	sum(Case When end_lat IS NULL or Trim(end_lat) = '' Then 1 Else 0 End) AS missing_end_lat,
	sum(Case When end_lng IS NULL or Trim(end_lng) = '' Then 1 Else 0 End) AS missing_end_lng,
	sum(Case When member_casual IS NULL or Trim(member_casual) = '' Then 1 Else 0 End) AS missing_member_casual	
	
FROM
	rides_2025_10;


/* Identify records with latitude or longitude values
   outside valid geographic coordinate ranges. */
SELECT
	count(*) AS invalid_coordinates
FROM
	rides_2025_10
WHERE
	CAST(start_lat AS REAL) NOT BETWEEN -90 AND 90
	OR CAST(end_lat AS REAL) NOT BETWEEN -90 AND 90
	or CAST(start_lng AS REAL) NOT BETWEEN -180 AND 180
	Or CAST(end_lng AS REAL) NOT BETWEEN -180 AND 180;


