DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS orders_items CASCADE;

CREATE TABLE "items" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar(50),
  "description" varchar(250),
  "price" decimal,
  "rating" int,
  "img_url" varchar(250),
  "img_alt" varchar(250),
  "active" boolean,
  "time" int
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(250),
  "email" varchar(250),
  "password" varchar(250),
  "phone_number" bigint,
  "is_owner" boolean
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "paid" boolean,
  "start_date" TIMESTAMP,
  "end_date" TIMESTAMP,
  "time" int
);

CREATE TABLE "orders_items" (
  "id" SERIAL PRIMARY KEY,
  "item_id" int,
  "order_id" int,
  "quantity" int
);

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "orders_items" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");
ALTER TABLE "orders_items" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

