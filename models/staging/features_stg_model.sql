MODEL (
  name stg.features,
  kind VIEW,
  grain id,
  audits (
    NOT_NULL(columns := (id, name)),
    UNIQUE_VALUES(columns = (name))
  )
);

SELECT
	feature_id AS id,
	feature_name AS name,
	feature_description AS description,
	feature_category AS category
FROM raw.features;