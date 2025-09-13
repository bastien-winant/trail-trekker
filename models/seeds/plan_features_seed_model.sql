MODEL (
	name raw.plan_features,
	kind SEED (
		path '$root/seeds/plan_features.csv'
	),
	columns (
		plan_feature_id VARCHAR(10),
		plan_id VARCHAR(10),
		feature_id VARCHAR(10),
		included BOOLEAN
  ),
  grain (plan_feature_id)
);