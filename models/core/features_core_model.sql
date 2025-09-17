MODEL (
  name core.features,
  kind VIEW,
  audits (
    not_null(columns := (id, name))
  )
);

SELECT
	feature_id AS id,
	feature_name AS name,
	feature_description AS description,
	feature_category AS category
FROM stg.features;