MODEL (
	name stg.plan_features,
	kind VIEW,
	grain id,
	audits (
		NOT_NULL(columns := (id, plan_id, feature_id))
	)
);

SELECT
	plan_feature_id AS id,
	plan_id,
	feature_id,
	included
FROM raw.plan_features;