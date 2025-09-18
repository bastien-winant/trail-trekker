MODEL (
  name stg.features,
  kind VIEW,
  audits (
    not_null(columns := id),
    unique_values(columns := (id, name))
  ),
  description 'Details for each plan feature'
);

SELECT
	feature_id AS id,
	feature_name AS name,
	feature_description AS description,
	feature_category AS category
FROM raw.features;