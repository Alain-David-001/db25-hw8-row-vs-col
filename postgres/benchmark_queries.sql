-- Query 1: Count trips per hour
SELECT date_trunc('hour', tpep_pickup_datetime) AS hour, COUNT(*) AS trips
FROM yellow_tripdata_2025_01
GROUP BY hour
ORDER BY hour;

-- Query 2: Top 10 pickup zones by revenue
SELECT PULocationID, SUM(total_amount) AS revenue
FROM yellow_tripdata_2025_01
GROUP BY PULocationID
ORDER BY revenue DESC
LIMIT 10;

-- Query 3: Exact trip lookup (indexed)
SELECT *
FROM yellow_tripdata_2025_01
WHERE VendorID = 2 AND trip_distance = 3.5;

-- Query 4: Filtered scan with multiple conditions
SELECT *
FROM yellow_tripdata_2025_01
WHERE passenger_count = 1
  AND trip_distance BETWEEN 5 AND 10
  AND tip_amount > 3
  AND fare_amount < 30
  AND payment_type = 1;
