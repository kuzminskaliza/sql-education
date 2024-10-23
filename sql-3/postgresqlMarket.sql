CREATE TABLE market
(
    id                  INT,
    product_name        VARCHAR(255),
    product_description TEXT,
    price               NUMERIC(10, 2),
    quantity            INTEGER,
    is_available        BOOLEAN,
    created_at          TIMESTAMP,
    expiration_date     DATE,
    product_code        CHAR(8),
    weight              REAL,
    product_rating      SMALLINT
);
INSERT INTO market (id,
                    product_name,
                    product_description,
                    price,
                    quantity,
                    is_available,
                    created_at,
                    expiration_date,
                    product_code,
                    weight,
                    product_rating)

VALUES (1,
        'iPhone 16',
        'The iPhone 16 features a bezel-less, full-edge screen with no visible borders, 6.1 inches in size.',
        799.99,
        500,
        TRUE,
        '2024-10-22 11:23:32',
        '2025-10-25',
        'IP16PL12',
        0.176,
        5);