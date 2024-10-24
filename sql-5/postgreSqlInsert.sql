CREATE TABLE market
(
    id           SERIAL PRIMARY KEY,
    product_name VARCHAR(100) UNIQUE,
    price        NUMERIC NOT NULL,
    stock        INT DEFAULT 0,
    description  TEXT
);

INSERT INTO market (product_name, price, description)
VALUES ('laptop', 1500, 'High-performance laptop'),
       ('Phone', 700, 'Smartphone with 5G support'),
       ('Smartwatch', 400, 'Waterproof smartwatch') RETURNING id;

INSERT INTO market (product_name, price, description)
VALUES ('Laptop', 1200, 'Update model') ON CONFLICT (product_name) DO
UPDATE
    SET price = excluded.price,
    description = excluded.description;

INSERT INTO market (product_name, price)
VALUES ('Tablet', '400'::NUMERIC);