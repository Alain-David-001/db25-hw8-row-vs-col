CREATE TABLE yellow_tripdata_2025_01 (
    VendorID Float32,
    tpep_pickup_datetime DateTime,
    tpep_dropoff_datetime DateTime,
    passenger_count Float32,
    trip_distance Float32,
    RatecodeID Float32,
    store_and_fwd_flag String,
    PULocationID Float32,
    DOLocationID Float32,
    payment_type Float32,
    fare_amount Float32,
    extra Float32,
    mta_tax Float32,
    tip_amount Float32,
    tolls_amount Float32,
    improvement_surcharge Float32,
    total_amount Float32,
    congestion_surcharge Float32,
    Airport_fee Float32,
    cbd_congestion_fee Float32
) ENGINE = MergeTree()
ORDER BY tpep_pickup_datetime;