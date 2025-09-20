MODEL (
  name sqlmesh_example.incremental_model,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column change_date
  ),
  start '2022-01-01',
  cron '@daily',
  grain (subscription_id, change_date)
);

WITH lead_subscriptions AS (
	SELECT
		id AS subscription_id,
		customer_id,
		plan_id,
		start_date,
		end_date,
		status,
		LEAD(id) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_subscription_id,
		LEAD(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan_id,
		LEAD(start_date) OVER (PARTITION BY customer_id ORDER BY start_date) AS next_plan_start_date
	FROM stg.subscriptions
	WHERE end_date between @start_date and @end_date
),
subscription_changes AS (
	SELECT
		subscription_id,
		customer_id,
		CASE
			WHEN subscription_id = next_subscription_id THEN 'switch'
			ELSE 'cancellation'
		END AS change_type,
		end_date AS change_date,
		plan_id,
		CASE
			WHEN subscription_id = next_subscription_id THEN next_plan_id
		END AS next_plan_id
	FROM lead_subscriptions
	WHERE status = 'cancelled'
)
SELECT * FROM subscription_changes
ORDER BY subscription_id;