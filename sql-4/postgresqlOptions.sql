CREATE TABLE market
(
    id                  SERIAL PRIMARY KEY,
    product_name        VARCHAR(255) NOT NULL,
    product_description TEXT         NOT NULL,
    price               NUMERIC(10, 2) CHECK ( price > 0 ),
    quantity            INTEGER CHECK ( quantity > 0 ),
    is_available        BOOLEAN DEFAULT TRUE,
    created_at          TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    expiration_date     DATE,
    product_code        CHAR(8) UNIQUE,
    weight              REAL CHECK ( weight > 0 ),
    product_rating      SMALLINT CHECK ( product_rating >= 0 and product_rating <= 5),
    product_image       bytea,
    product_uuid        uuid,
    available_color     TEXT[] DEFAULT '{"Black", "Blue", "Green"}',
    discount            NUMERIC(5, 2) CHECK ( discount >= 0 ),
    product_year        INTEGER CHECK ( product_year >= 2000 ),
    warranty_period     SMALLINT  DEFAULT 12,
    large_stock         BIGINT CHECK ( large_stock >= 0 ),
    precision_value     DOUBLE PRECISION,
    currency_value      MONEY,
    last_ordered_at     TIMESTAMPTZ,
    opening_time        TIME WITHOUT TIME ZONE,
    closing_time        TIME WITH TIME ZONE,
    shipping_interval   INTERVAL,
    allowed_ips         CIDR,
    customer_ip         INET,
    device_mac          MACADDR
);
INSERT INTO market (product_name,
                    product_description,
                    price,
                    quantity,
                    is_available,
                    created_at,
                    expiration_date,
                    product_code,
                    weight,
                    product_rating,
                    product_image,
                    product_uuid,
                    available_color,
                    discount,
                    product_year,
                    warranty_period,
                    large_stock,
                    precision_value,
                    currency_value,
                    last_ordered_at,
                    opening_time,
                    closing_time,
                    shipping_interval,
                    allowed_ips,
                    customer_ip,
                    device_mac)

VALUES ('iPhone 16',
        'The iPhone 16 features a bezel-less, full-edge screen with no visible borders, 6.1 inches in size.',
        799.99,
        500,
        TRUE,
        '2024-10-22 11:23:32',
        '2025-10-25',
        'IP16PL12',
        0.176,
        5,
        NULL,
        '550e8400-e29b-41d4-a716-446655440000',
        '{"black", "blue"}',
        10.50,
        2024,
        12,
        10000,
        0.178,
        799.99,
        '2024-10-21 14:32:00+00',
        '09:00:00',
        '18:00:00+00',
        '2 days',
        '192.168.0.0/24',
        '192.168.0.10',
        '00:1B:44:11:3A:B7');