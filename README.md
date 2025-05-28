# db25-hw8-row-vs-col

A benchmark project comparing **PostgreSQL** (row-oriented) and **ClickHouse** (column-oriented) using the same NYC taxi trip dataset and a balanced set of analytical queries.

> **HW8** — Bonus multiplier: **3**

---

## 📌 Objective

Evaluate and compare the strengths and weaknesses of two DBMS architectures by:

- Running equivalent analytical queries on both systems
- Measuring execution time
- Documenting observations

---

## ⚙️ Systems Compared

| System      | Storage Model  | Strengths                       |
|-------------|----------------|---------------------------------|
| PostgreSQL  | Row-oriented   | Point lookups, filters, logic   |
| ClickHouse  | Column-oriented| Scans, grouping, aggregations   |

---

## 📁 Project Structure

```
db25-hw8-row-vs-col/
├── data/                   # Raw dataset files (CSV, Parquet) [ignored in git]
├── postgres/
│   ├── setup.sql           # Table schema for PostgreSQL
│   ├── query.sql           # PostgreSQL-optimized queries
│   └── results.txt         # Timings for each query
├── clickhouse/
│   ├── setup.sql           # Table schema for ClickHouse
│   ├── query.sql           # ClickHouse-optimized queries
│   └── results.txt         # Timings for each query
├── notes.md                # Comparison and interpretation
├── convert.py              # Script to convert Parquet to CSV
├── HOW_TO_RUN.md           # Setup and benchmarking instructions
├── .gitignore
└── README.md
```

---

## ▶️ Example Queries

All queries operate on the same dataset (`yellow_tripdata_2025_01`) and include:

- Trip count per hour
- Top 10 revenue zones
- Exact-match lookups
- Complex multi-condition filters

Queries are tailored to test:
- Full-table scans
- Indexed lookups
- Numeric aggregation
- Conditional logic

---

## 📈 Results Summary

| Query | Focus                        | Winner        |
|-------|------------------------------|---------------|
| Q1    | Trips per hour               | ✅ ClickHouse |
| Q2    | Top revenue zones            | ✅ ClickHouse |
| Q3    | Exact trip lookup            | ✅ PostgreSQL |
| Q4    | Complex filter scan          | 🤝 Nearly Even |

See [`notes.md`](./notes.md) for details.

---

## 🧠 Observations

- ClickHouse is vastly superior for wide scans and grouped aggregations.
- PostgreSQL remains better for point lookups and index-driven queries.
- Even logic-heavy filters are handled impressively well by ClickHouse.

---

## 📝 Reproduce the Benchmarks

See [`HOW_TO_RUN.md`](./HOW_TO_RUN.md) for full setup and execution instructions.

---

## 🧑‍💻 Author

**Alain David Escarrá García**  
2nd-year Software, Data, and Technology student  
Constructor University, Spring 2025
