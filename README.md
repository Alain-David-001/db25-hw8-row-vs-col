# DB25 HW8: Row vs Column DB Comparison

This project contains the implementation and results of Homework 8 for the DB25 course. The goal is to compare the performance of a row-oriented database (PostgreSQL) and a column-oriented database (ClickHouse) when executing the same analytical query on the same dataset.

## 📂 Project Structure

```text
.
├── data/                   # Raw and processed dataset files
├── postgres/
│   ├── setup.sql           # SQL scripts to create tables and indexes in PostgreSQL
│   ├── query.sql           # The analytical query run on PostgreSQL
│   └── results.txt         # Execution time and output snapshot (to be added)
├── clickhouse/
│   ├── setup.sql           # SQL scripts to create tables and indexes in ClickHouse
│   ├── query.sql           # The analytical query run on ClickHouse
│   └── results.txt         # Execution time and output snapshot (to be added)
├── notes.md                # Observations, performance comparison, and explanations
└── README.md               # This file
```

## 📋 Task Summary

1. Launch one row-oriented (PostgreSQL) and one column-oriented (ClickHouse) database instance.
2. Download and import the same dataset from [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page).
3. Create indexes as needed.
4. Write and execute a logically equivalent analytical query on both systems.
5. Measure execution time and compare the results.
6. Document and explain observations.

## 🧠 Goals

- Understand the performance trade-offs between row- and column-oriented databases
- Practice working with large datasets and DBMS setup
- Learn about query planning, indexing, and optimization in different systems

## ✅ Status

- [ ] Dataset downloaded and preprocessed
- [ ] PostgreSQL setup complete
- [ ] ClickHouse setup complete
- [ ] Analytical query written
- [ ] Execution results collected
- [ ] Comparison documented
