MODEL (
 	name raw.plans,
	kind SEED (
		path '$root/seeds/plans.csv'
	),
  start '2021-03-15',
	columns (
		plan_id VARCHAR(10),
    plan_name VARCHAR(50),
		plan_level INTEGER,
		price REAL,
		max_hikes_per_month INTEGER,
		photo_storage_gb INTEGER,
		description TEXT,
		created_at DATE
	),
  grain (plan_id)
)