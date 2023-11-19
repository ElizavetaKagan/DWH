CREATE TABLE public.manufacturers (
  "manufacturer_id"          SERIAL PRIMARY KEY,
  "manufacturer_name"        VARCHAR(100) NOT NULL
);


CREATE TABLE public.categories (
  "category_id"          SERIAL PRIMARY KEY,
  "category_name"        VARCHAR(100) NOT NULL
);


CREATE TABLE public.customers (
  "customer_id"       SERIAL PRIMARY KEY,
  "customer_fname"    VARCHAR(100) NOT NULL,
  "customer_lname"    VARCHAR(100) NOT NULL
);


CREATE TABLE public.stores (
  "store_id"          SERIAL PRIMARY KEY,
  "store_name"        VARCHAR(255) NOT NULL
);


CREATE TABLE public.price_change (
  "product_id"         BIGINT NOT NULL PRIMARY KEY,
  "price_change_ts"    TIMESTAMP NOT NULL,
  "new_price"          NUMERIC(9, 2) NOT NULL
);


CREATE TABLE public.products (
  "category_id"          BIGINT REFERENCES public.categories("category_id"),
  "manufacturer_id"      BIGINT REFERENCES public.manufacturers("manufacturer_id"),
  "product_id"           SERIAL PRIMARY KEY,
  "product_name"         VARCHAR(255) NOT NULL
);


CREATE TABLE public.purchases (
  "store_id"            BIGINT NOT NULL REFERENCES public.stores("store_id"),
  "customer_id"         BIGINT NOT NULL REFERENCES public.customers("customer_id"),
  "purchase_id"         SERIAL PRIMARY KEY,
  "purchase_date"       DATE NOT NULL
);


CREATE TABLE public.deliveries (
  "store_id"            BIGINT REFERENCES public.stores("store_id"),
  "product_id"          BIGINT NOT NULL REFERENCES public.price_change("product_id"),
  "delivery_date"       DATE NOT NULL,
  "product_count"       INTEGER NOT NULL
);


CREATE TABLE public.purchase_items (
  "product_id"          BIGINT NOT NULL REFERENCES public.products("product_id"),
  "purchase_id"         BIGINT NOT NULL REFERENCES public.purchases("purchase_id"),
  "product_count"       BIGINT NOT NULL,
  "pruduct_price"       NUMERIC(9, 2) NOT NULL
);