import pandas as pd

df = pd.read_parquet("data/yellow_tripdata_2025-01.parquet")
df.to_csv("data/yellow_tripdata_2025-01.csv", index=False)
