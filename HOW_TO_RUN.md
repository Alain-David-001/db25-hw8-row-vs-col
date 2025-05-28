# HOW TO RUN

Instructions for downloading the dataset, setting up both databases, importing the data, running benchmark queries, and collecting results.

---

## 🔐 1. Prerequisites

- Python 3
- PostgreSQL (CLI access via `psql`)
- Docker Desktop (for ClickHouse)
- Required Python packages:

```bash
pip install pandas pyarrow
```

---

## ⬇️ 2. Download the Dataset

Visit: [https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

- Download **Yellow Trip Data** for **January 2025** in `.parquet` format
- Place the file in the `data/` folder

Optional: Convert `.parquet` to `.csv` for easier import:

```bash
python convert.py
```

This will generate `yellow_tripdata_2025-01.csv` in the same folder.

---

## 🚀 3. PostgreSQL Setup

### Start psql and create a new database:

```bash
psql -U postgres
```

```sql
CREATE DATABASE hw8;
\c hw8
\i postgres/setup.sql
\COPY yellow_tripdata_2025_01 FROM 'data/yellow_tripdata_2025-01.csv' DELIMITER ',' CSV HEADER;
\i postgres/query.sql
```

View timings using `\timing` before running queries.

---

## 🛠️ 4. ClickHouse Setup (via Docker)

```bash
docker run -d --name clickhouse-server --ulimit nofile=262144:262144 -p 8123:8123 -p 9000:9000 clickhouse/clickhouse-server
```

### Copy and execute schema:

```bash
docker cp clickhouse/setup.sql clickhouse-server:/setup.sql
docker exec -i clickhouse-server bash -c "clickhouse-client --multiquery" < clickhouse/setup.sql
```

### Copy and import the dataset:

```bash
docker cp data/yellow_tripdata_2025-01.csv clickhouse-server:/yellow_tripdata_2025-01.csv
docker exec -i clickhouse-server clickhouse-client --query="INSERT INTO yellow_tripdata_2025_01 FORMAT CSVWithNames" < data/yellow_tripdata_2025-01.csv
```

### Run the queries:

```bash
docker exec -it clickhouse-server clickhouse-client < clickhouse/query.sql
```

---

## 📈 5. Compare Results

Query timings should be saved in:

- `postgres/results.txt`
- `clickhouse/results.txt`

See `notes.md` for interpretations and conclusions.
