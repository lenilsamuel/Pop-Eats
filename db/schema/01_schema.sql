DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS items CASCADE;

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar(250) NOT NULL,
  "email" varchar(250) NOT NULL,
  "password" varchar(250) NOT NULL,
  "phone_number" bigint NOT NULL,
  "is_owner" boolean NOT NULL
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "user_id" INTEGER NOT NULL,
  "item_id" INTEGER NOT NULL,
  "quantity" INTEGER NOT NULL
);

CREATE TABLE "items" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar(250),
  "description" varchar(250),
  "price" INTEGER NOT NULL,
  "rating" INTEGER NOT NULL
);

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "items" ADD FOREIGN KEY ("id") REFERENCES "orders" ("item_id");

