import duckdb
import yaml

with open("index.yml", "r") as f:
	data = yaml.safe_load(f)

data_files = data['data_files']

with duckdb.connect("trail_trekker.db") as con:
	con.sql("CREATE SCHEMA IF NOT EXISTS raw;")

	for table_name, file_path in data_files.items():
		con.sql(f"CREATE TABLE raw.{table_name} AS SELECT * FROM '{file_path}';")
