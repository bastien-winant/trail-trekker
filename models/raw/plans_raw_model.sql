MODEL (
  name raw.plans,
  kind SEED (
    path '$root/seeds/plans.csv'
  ),
	columns (
		plan_id VARCHAR(10),
		plan_name VARCHAR(20),
		plan_level INTEGER,
		price DECIMAL(5, 2),
		max_hikes_per_month INTEGER,
		photo_storage_gb INTEGER,
		description TEXT,
		created_at DATE
	),
  grain (plan_id)
);