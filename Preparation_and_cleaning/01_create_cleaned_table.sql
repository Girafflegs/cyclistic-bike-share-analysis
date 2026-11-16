/* Create working table from combined dataset. Remove 35 exact duplicate records across all 13 columns. Preserve original combined dataset. */
CREATE TABLE rides_cleaned AS
SELECT DISTINCT *
FROM
	rides_combined