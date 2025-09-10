CREATE OR REPLACE TABLE plans AS SELECT * FROM './data/plans.csv';
CREATE OR REPLACE TABLE features AS SELECT * FROM './data/features.csv';
CREATE OR REPLACE TABLE customers AS SELECT * FROM './data/customers.csv';
CREATE OR REPLACE TABLE plan_features AS SELECT * FROM './data/plan_features.csv';
CREATE OR REPLACE TABLE subscriptions AS SELECT * FROM './data/subscriptions.csv';