CREATE TABLE market
(
    id                  SMALLINT UNSIGNED ZEROFILL AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique product identifier',
    product_name        VARCHAR(255) NOT NULL COMMENT 'Product name',
    product_description TEXT NOT NULL COMMENT 'Product description',
    price               DECIMAL(10, 2) NOT NULL CHECK (price > 0) COMMENT 'Product price (must be greater than 0)',
    quantity            MEDIUMINT UNSIGNED NOT NULL CHECK (quantity >= 0) COMMENT 'Stock quantity (cannot be negative)',
    is_available        BOOLEAN DEFAULT TRUE COMMENT 'Product availability',
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Record creation date',
    expiration_date     DATE COMMENT 'Expiration date',
    product_code        CHAR(10) UNIQUE COMMENT 'Unique product code',
    weight              FLOAT UNSIGNED COMMENT 'Product weight',
    discount            DOUBLE CHECK (discount >= 0) COMMENT 'Product discount',
    product_rating      INTEGER CHECK (product_rating >= 0 AND product_rating <= 5) COMMENT 'Product rating from 0 to 5',
    color               ENUM('black', 'purple', 'green') NOT NULL COMMENT 'Main product color',
    total_sold          BIGINT UNSIGNED DEFAULT 0 COMMENT 'Total units sold',
    product_image       BLOB COMMENT 'Product image',
    product_uuid        CHAR(36) NOT NULL COMMENT 'Unique product identifier (UUID)',
    available_colors    SET('black', 'purple', 'green', 'blue', 'red') COMMENT 'Available product colors',
    production_year     YEAR NOT NULL COMMENT 'Year of production',
    production_time     TIME COMMENT 'Production time',
    small_flag          TINYINT UNSIGNED DEFAULT 0 COMMENT 'Flag for additional information (0 or 1)',
    additional_info     MEDIUMTEXT COMMENT 'Additional product information',
    extended_info       LONGTEXT COMMENT 'Extended product information',
    last_update         DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of the last record update'
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = 'Product market table';

INSERT INTO market (product_name,
                    product_description,
                    price,
                    quantity,
                    is_available,
                    created_at,
                    expiration_date,
                    product_code,
                    weight,
                    discount,
                    product_rating,
                    color,
                    total_sold,
                    product_image,
                    product_uuid,
                    available_colors,
                    production_year,
                    production_time,
                    small_flag,
                    additional_info,
                    extended_info,
                    last_update)
VALUES ('Iphone 16',
        'The iPhone 16 and iPhone 16 Plus retain their screen sizes of 6.1 inches and 6.7 inches, respectively. They feature a bezel-less, full-edge screen design with no visible borders.',
        799,
        320,
        TRUE,
        '2024-10-22 10:40:03',
        '2025-10-25',
        'IP16PL1234',
        0.174,
        10.5,
        5,
        'black',
        120000,
        NULL,
        '550e8400-e29b-41d4-a716-446655440000',
        'black,blue',
        2024,
        '15:20:32',
        1,
        'Limited edition product with special packaging.',
        'This product includes a warranty for 1 year, with a possibility of extension up to 3 years. It also supports fast charging and wireless charging. Full technical specifications are available on the official website.',
        '2024-10-22 12:30:45');
