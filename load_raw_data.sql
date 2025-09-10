CREATE OR REPLACE TABLE plans AS SELECT * FROM 'https://raw.githubusercontent.com/schottma/trail_trekker/refs/heads/main/plans.csv';
CREATE OR REPLACE TABLE features AS SELECT * FROM 'https://raw.githubusercontent.com/schottma/trail_trekker/refs/heads/main/features.csv';
CREATE OR REPLACE TABLE customers AS SELECT * FROM 'https://raw.githubusercontent.com/schottma/trail_trekker/refs/heads/main/customers.csv';
CREATE OR REPLACE TABLE plan_features AS SELECT * FROM 'https://raw.githubusercontent.com/schottma/trail_trekker/refs/heads/main/plan_features.csv';
CREATE OR REPLACE TABLE subscriptions AS SELECT * FROM 'https://raw.githubusercontent.com/schottma/trail_trekker/refs/heads/main/subscriptions.csv';