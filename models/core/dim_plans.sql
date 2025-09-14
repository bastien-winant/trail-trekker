MODEL (
      name core.plans,
      kind INCREMENTAL_BY_UNIQUE_KEY (
      	unique_key plan_id
      )
);

SELECT *
FROM staging.plans;