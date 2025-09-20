MODEL (
  name stg.plan_features,
  kind FULL,
  cron '@daily',
  grain id,
  audits (
    not_null(columns := (id, plan_id, feature_id)),
    unique_values(columns := id)
  )
);

SELECT
  plan_feature_id AS id,
  plan_id,
  feature_id,
  included
FROM
  raw.plan_features;