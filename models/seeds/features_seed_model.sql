MODEL (
	name raw.features,
	kind SEED (
		path: '$/seeds/features.csv'
	),
	columns (
		feature_id VARCHAR(10),
		feature_name VARCHAR(50),
		feature_description TEXT,
		feature_category VARCHAR(50)
	),
	grain (feature_id)
)