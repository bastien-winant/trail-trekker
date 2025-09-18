MODEL (
  name raw.features,
  kind SEED (
    path '$root/seeds/features.csv'
  ),
	columns (
		feature_id VARCHAR(10),
		feature_name VARCHAR(20),
		feature_description TEXT,
		feature_category VARCHAR(10)
	),
  grain feature_id
);