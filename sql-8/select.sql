CREATE TABLE product
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100),
    category VARCHAR(50),
    price    NUMERIC(10, 2),
    quantity INTEGER
);

INSERT INTO product (name, category, price, quantity)
VALUES ('Phone', 'Electronics', 15000, 50),
       ('Laptop', 'Electronics', 40000, 30),
       ('Book', 'Literature', 300, 100),
       ('TV', 'Electronics', 20000, 5),
       ('Shampoo', 'Cosmetics', 120, 50),
       ('Lipstick', 'Cosmetics', 250, 15);

SELECT *
FROM product;

SELECT name, price
FROM product;

SELECT *
FROM product
WHERE price > 1000;

SELECT *
FROM product
WHERE name LIKE 'L%';

SELECT *
FROM product
WHERE category = 'Electronics'
  AND price > 20000;

SELECT *
FROM product
WHERE (price > 1000 OR category = 'Cosmetics');

SELECT *
FROM product
WHERE NOT category = 'Cosmetics';

SELECT *
FROM product
WHERE (quantity > 10 OR price < 500);

SELECT t.name, t.price
FROM product as t
WHERE t.category = 'Literature';

SELECT *
FROM product
WHERE category IN ('Electronics', 'Literature', 'Cosmetics');

SELECT *
FROM product
WHERE category NOT IN ('Electronics', 'Literature');

SELECT *
FROM product
WHERE price < ANY (ARRAY[1000, 2000, 3000]);

SELECT *
FROM product
WHERE price IS NULL;

SELECT *
FROM product
WHERE price IS NOT NULL;

SELECT *
FROM product
WHERE price BETWEEN 1000 AND 20000;