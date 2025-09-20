MODEL (
  name stg.features,
  kind FULL,
  cron '@daily',
  grain id,
  audits (
    not_null(columns := (id, name)),
    unique_values(columns := (id, name))
  )
);

SELECT
  feature_id AS id,
	feature_name AS name,
	feature_description AS description,
	feature_category category
FROM
  raw.features;