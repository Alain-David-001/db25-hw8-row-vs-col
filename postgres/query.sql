-- Count trips per payment_type
SELECT payment_type, COUNT(*) 
FROM yellow_tripdata_2025_01 
GROUP BY payment_type
ORDER BY COUNT(*) DESC;
