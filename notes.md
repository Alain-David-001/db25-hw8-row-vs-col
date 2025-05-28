# Observations: PostgreSQL vs ClickHouse

## ✅ Summary

This benchmark compares PostgreSQL (row-oriented) and ClickHouse (column-oriented) using 4 focused analytical queries designed to highlight the performance differences between the two systems.

---

## 📊 Query Breakdown

| Query | Description                          | PostgreSQL Duration | ClickHouse Duration | Winner        |
|-------|--------------------------------------|----------------------|----------------------|---------------|
| Q1    | Trips per hour (aggregation)         | 907 ms               | 25 ms                | ✅ ClickHouse |
| Q2    | Top 10 revenue zones (group + sort)  | 322 ms               | 28 ms                | ✅ ClickHouse |
| Q3    | Exact trip lookup                    | 178 ms               | 224 ms               | ✅ PostgreSQL |
| Q4    | Multi-condition filtered scan        | 234 ms               | 238 ms               | 🤝 Nearly Even |

---

## 🧠 Detailed Observations

### Q1: Count trips per hour
- **ClickHouse** handled the group-by + sort across millions of rows effortlessly, thanks to its vectorized execution and columnar access.
- **PostgreSQL** struggled here, taking almost 1 second, showing the limitations of row-store designs for aggregation-heavy tasks.

### Q2: Top 10 revenue pickup zones
- Again, **ClickHouse** outpaced PostgreSQL by an order of magnitude.
- The top-N pattern benefits from ClickHouse’s in-memory efficiency and partial aggregation optimization.

### Q3: Exact trip lookup
- **PostgreSQL** wins this one — expected due to index-friendly layout and row-based retrieval.
- **ClickHouse** does fine but is not built for fast point lookups.

### Q4: Multi-condition filtered scan
- Surprisingly close! This was expected to lean toward PostgreSQL due to complex filtering, but **ClickHouse matched it almost exactly**.
- Suggests ClickHouse’s general-purpose filter performance is stronger than anticipated.

---

## 🧪 Overall Takeaways

- **ClickHouse dominates aggregation, grouping, and scanning** — true to its OLAP roots.
- **PostgreSQL’s only clear win is point lookup**, validating its OLTP strengths.
- Even on logic-heavy filters (Q4), **ClickHouse competes well**, making it viable beyond just “big scans”.
