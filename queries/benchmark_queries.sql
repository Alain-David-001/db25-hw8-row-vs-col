-- Query 1: Count trips by payment type
SELECT payment_type, COUNT(*) 
FROM yellow_tripdata_2025_01 
GROUP BY payment_type
ORDER BY COUNT(*) DESC;

-- Query 2: Average trip distance for trips with 2+ passengers
SELECT AVG(trip_distance) 
FROM yellow_tripdata_2025_01 
WHERE passenger_count >= 2;
