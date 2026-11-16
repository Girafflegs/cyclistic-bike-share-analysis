-- Check start/end station name/ID consistency
SELECT 
	sum((start_station_name IS NULL OR TRIM(start_station_name) = '')
    !=
    (start_station_id IS NULL OR TRIM(start_station_id) = '')) AS mismatched_start_stations,
	sum((end_station_name is NULL or trim(end_station_name) = '') 
	!= 
	(end_station_id Is NULL or trim(end_station_id) = '')) AS mismatched_end_stations
FROM 
	rides_2025_10

    

	
	
