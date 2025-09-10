import duckdb

with duckdb.connect("./trail_trekker.db") as con:
	con.sql("CREATE OR REPLACE SCHEMA raw;")
	con.sql("CREATE OR REPLACE TABLE raw.subscriptions AS SELECT * FROM './data/subscriptions.csv'")
	con.sql("CREATE OR REPLACE TABLE raw.plan_features AS SELECT * FROM './data/plan_features.csv'")
	con.sql("CREATE OR REPLACE TABLE raw.customers AS SELECT * FROM './data/customers.csv'")
	con.sql("CREATE OR REPLACE TABLE raw.features AS SELECT * FROM './data/features.csv'")
	con.sql("CREATE OR REPLACE TABLE raw.plans AS SELECT * FROM './data/plans.csv'")