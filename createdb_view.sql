CREATE SCHEMA presentation

CREATE TABLE presentation.data_gmv (
  "created_at"          DATE NOT NULL,
  "business_date"       DATE NOT NULL,
  "category_name"       VARCHAR(100) NOT NULL,
  "category_gmv"        BIGINT NOT NULL
);

COPY presentation.data_gmv ("created_at", "business_date", "category_name", "category_gmv") FROM '/var/lib/postgresql/data_example/data_gmv_example.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE presentation.client_gmv (
  "created_at"            DATE NOT NULL,
  "customer_id"           VARCHAR(100) NOT NULL,
  "customer_gmv"          BIGINT NOT NULL,
  "customer_category"     VARCHAR(100) NOT NULL
);

COPY presentation.client_gmv  ("created_at", "customer_id", "customer_gmv", "customer_category") FROM '/var/lib/postgresql/data_example/data_client_example.csv' DELIMITER ',' CSV HEADER;
