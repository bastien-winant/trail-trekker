import duckdb

with duckdb.connect("./trail_trekker.db") as con:
	con.sql("CREATE OR REPLACE TABLE subscriptions AS SELECT * FROM './data/subscriptions.csv'")
	con.sql("CREATE OR REPLACE TABLE plan_features AS SELECT * FROM './data/plan_features.csv'")
	con.sql("CREATE OR REPLACE TABLE customers AS SELECT * FROM './data/customers.csv'")
	con.sql("CREATE OR REPLACE TABLE features AS SELECT * FROM './data/features.csv'")
	con.sql("CREATE OR REPLACE TABLE plans AS SELECT * FROM './data/plans.csv'")