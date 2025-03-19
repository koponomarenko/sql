/*
 ## PostgreSQL in Docker:

 ### Create a docker container from Docker image (map to port "5401"):
 $ docker run --name postgresql -p 5401:5432 -e POSTGRES_PASSWORD=Adam123456 -d postgres:14.8

 ## MS SQLServer in Docker:

 ### Create a docker container from Docker image (map to port "1401"):
 $ docker run --name sqlserver2019-kineteco -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=Adam123456" -e "MSSQL_PID=Express" \
    -p 1401:1433 -d mcr.microsoft.com/mssql/server:2019-latest
 */

--SELECT * FROM sys.databases; -- sql-server
--SELECT * FROM pg_database; -- postgresql

-- Remove existing database objects if they're present
-- This resets the database to an empty state
DROP TABLE IF EXISTS products_schema.products;
DROP TABLE IF EXISTS products_schema.categories;
DROP SCHEMA IF EXISTS products_schema;
DROP DATABASE IF EXISTS two_trees;

CREATE DATABASE two_trees;

CREATE SCHEMA products_schema;
--CREATE SCHEMA sales;

CREATE TABLE products_schema.products(
    sku CHAR(7) NOT NULL PRIMARY KEY,
    product_name CHAR(50) NOT NULL,
    category_id INT,
    size INT,
    price DECIMAL(5,2) NOT NULL
);

CREATE TABLE products_schema.categories(
    category_id INT NOT NULL PRIMARY KEY,
    category_description CHAR(50)
);

-- Add one more column
ALTER TABLE products_schema.categories
ADD product_line CHAR(25);

-- Add data to the table - add a row to the table
INSERT INTO products_schema.products VALUES
    ('ALB008', 'Delicate', 1, 8, 10.99),
    ('ALB032', 'Delicate', 1, 32, 18.99),
    ('ALB064', 'Delicate', 1, 64, 22.99),
    ('ALB128', 'Delicate', 1, 128, 26.99),
    ('EV008', 'Extra Virgin', 1, 8, 8.99),
    ('EV016', 'Extra Virgin', 1, 16, 12.99),
    ('EV032', 'Extra Virgin', 1, 32, 16.99),
    ('EV064', 'Extra Virgin', 1, 64, 20.99),
    ('EV128', 'Extra Virgin', 1, 128, 24.99),
    ('FCP008', 'First Cold Press', 1, 8, 8.99),
    ('FCP016', 'First Cold Press', 1, 16, 12.99),
    ('FCP032', 'First Cold Press', 1, 32, 16.99),
    ('FCP064', 'First Cold Press', 1, 64, 20.99),
    ('FCP128', 'First Cold Press', 1, 128, 24.99),
    ('FR008', 'Frantoio', 1, 8, 10.99),
    ('FR016', 'Frantoio', 1, 16, 14.99),
    ('FR032', 'Frantoio', 1, 32, 18.99),
    ('FR064', 'Frantoio', 1, 64, 22.99),
    ('FR128', 'Frantoio', 1, 128, 26.99),
    ('HOJ008', 'Bold', 1, 8, 11.99),
    ('HOJ016', 'Bold', 1, 16, 15.99),
    ('HOJ032', 'Bold', 1, 32, 19.99),
    ('HOJ064', 'Bold', 1, 64, 23.99),
    ('HOJ128', 'Bold', 1, 128, 27.99),
    ('KRN008', 'Koroneiki', 1, 8, 10.99),
    ('KRN016', 'Koroneiki', 1, 16, 14.99),
    ('KRN032', 'Koroneiki', 1, 32, 18.99),
    ('KRN064', 'Koroneiki', 1, 64, 22.99),
    ('KRN128', 'Koroneiki', 1, 128, 26.99),
    ('LEC008', 'Leccino', 1, 8, 10.99),
    ('LEC016', 'Leccino', 1, 16, 14.99),
    ('LEC032', 'Leccino', 1, 32, 18.99),
    ('LEC064', 'Leccino', 1, 64, 22.99),
    ('LEC128', 'Leccino', 1, 128, 26.99),
    ('LGT008', 'Light', 1, 8, 8.99),
    ('LGT016', 'Light', 1, 16, 12.99),
    ('LGT032', 'Light', 1, 32, 16.99),
    ('LGT064', 'Light', 1, 64, 20.99),
    ('LGT128', 'Light', 1, 128, 24.99),
    ('MAN008', 'Manzanilla', 1, 8, 10.99),
    ('MAN016', 'Manzanilla', 1, 16, 14.99),
    ('MAN032', 'Manzanilla', 1, 32, 18.99),
    ('MAN064', 'Manzanilla', 1, 64, 22.99),
    ('MAN128', 'Manzanilla', 1, 128, 26.99),
    ('MIS008', 'Mission', 1, 8, 10.99),
    ('MIS016', 'Mission', 1, 16, 14.99),
    ('MIS032', 'Mission', 1, 32, 18.99),
    ('MIS064', 'Mission', 1, 64, 22.99),
    ('MIS128', 'Mission', 1, 128, 26.99),
    ('MOR008', 'Moraiolo', 1, 8, 10.99),
    ('MOR016', 'Moraiolo', 1, 16, 14.99),
    ('MOR032', 'Moraiolo', 1, 32, 18.99),
    ('MOR064', 'Moraiolo', 1, 64, 22.99),
    ('MOR128', 'Moraiolo', 1, 128, 26.99),
    ('OBL008', 'Oblica', 1, 8, 11.99),
    ('OBL016', 'Oblica', 1, 16, 15.99),
    ('OBL032', 'Oblica', 1, 32, 19.99),
    ('OBL064', 'Oblica', 1, 64, 22.99),
    ('OBL128', 'Oblica', 1, 128, 27.99),
    ('PEN008', 'Pendolino', 1, 8, 10.99),
    ('PEN016', 'Pendolino', 1, 16, 14.99),
    ('PEN032', 'Pendolino', 1, 32, 18.99),
    ('PEN064', 'Pendolino', 1, 64, 22.99),
    ('PEN128', 'Pendolino', 1, 128, 26.99),
    ('PCH008', 'Picholine', 1, 8, 11.99),
    ('PCH016', 'Picholine', 1, 16, 15.99),
    ('PCH032', 'Picholine', 1, 32, 19.99),
    ('PCH064', 'Picholine', 1, 64, 23.99),
    ('PCH128', 'Picholine', 1, 128, 27.99),
    ('PIC008', 'Picual', 1, 8, 10.99),
    ('PIC016', 'Picual', 1, 16, 14.99),
    ('PIC032', 'Picual', 1, 32, 18.99),
    ('PIC064', 'Picual', 1, 64, 22.99),
    ('PIC128', 'Picual', 1, 128, 26.99),
    ('PUR008', 'Pure', 1, 8, 8.99),
    ('PUR016', 'Pure', 1, 16, 12.99),
    ('PUR032', 'Pure', 1, 32, 16.99),
    ('PUR064', 'Pure', 1, 64, 20.99),
    ('PUR128', 'Pure', 1, 128, 24.99),
    ('REF008', 'Refined', 1, 8, 8.99),
    ('REF016', 'Refined', 1, 16, 12.99),
    ('REF032', 'Refined', 1, 32, 16.99),
    ('REF064', 'Refined', 1, 64, 20.99),
    ('REF128', 'Refined', 1, 128, 24.99),
    ('V008', 'Virgin', 1, 8, 8.99),
    ('V016', 'Virgin', 1, 16, 12.99),
    ('V032', 'Virgin', 1, 32, 16.99),
    ('V064', 'Virgin', 1, 64, 20.99),
    ('V128', 'Virgin', 1, 128, 24.99),
    ('MI008', 'Mandarin-Infused EVO', 2, 8, 8.99),
    ('MI016', 'Mandarin-Infused EVO', 2, 16, 12.99),
    ('MI032', 'Mandarin-Infused EVO', 2, 32, 16.99),
    ('LI008', 'Lemon-Infused EVO', 2, 8, 8.99),
    ('LI016', 'Lemon-Infused EVO', 2, 16, 12.99),
    ('LI032', 'Lemon-Infused EVO', 2, 32, 16.99),
    ('BI008', 'Basil-Infused EVO', 2, 8, 10.99),
    ('BI016', 'Basil-Infused EVO', 2, 16, 14.99),
    ('BI032', 'Basil-Infused EVO', 2, 32, 18.99),
    ('RI008', 'Rosemary-Infused EVO', 2, 8, 10.99),
    ('RI016', 'Rosemary-Infused EVO', 2, 16, 14.99),
    ('RI032', 'Rosemary-Infused EVO', 2, 32, 18.99),
    ('GI008', 'Garlic-Infused EVO', 2, 8, 11.99),
    ('GI016', 'Garlic-Infused EVO', 2, 16, 15.99),
    ('GI032', 'Garlic-Infused EVO', 2, 32, 19.99),
    ('JI008', 'Chili-Infused EVO', 2, 8, 11.99),
    ('JI016', 'Chili-Infused EVO', 2, 16, 15.99),
    ('JI032', 'Chili-Infused EVO', 2, 32, 19.99),
    ('OGFL006', 'Olive Glow face lotion', 3, 6, 14.99),
    ('OGBL012', 'Olive Glow body lotion', 3, 12, 12.99),
    ('OGFT006', 'Olive Glow foot treatment', 3, 6, 7.99),
    ('OGNR004', 'Olive Glow night repair', 3, 4, 21.99),
    ('OGBG016', 'Olive Glow bath gel', 3, 16, 9.99),
    ('OGHS006', 'Olive Glow hand soap', 3, 6, 6.99),

    ('GI017', 'Garlic-Infused EVO2', 2, 17, 16.99)
;

INSERT INTO products_schema.categories
    (category_id, category_description, product_line)
VALUES
    (1, 'Olive Oils', 'Gourmet Chef'),
    (2, 'Flavor Infused Oils', 'Gourmet Chef'),
    (3, 'Bath and Beauty', 'Cosmetics')
;

-- Add a row with only specific cells
INSERT INTO products_schema.products
    (sku, product_name, price)
VALUES
    ('OGEC004','Olive Glow Eye Cream',18.99)
;

-- Modify a row with a specific Key
UPDATE products_schema.products
SET category_id = 3,
    size = 4
WHERE sku = 'OGEC004';

-- Delete a row
DELETE FROM products_schema.products
WHERE sku = 'GI017';

-- Review the data
SELECT * FROM products_schema.products;
SELECT * FROM products_schema.categories;

-- Data retrieval.
-- Get from two tables, filter, order, limit.
SELECT
    products.sku,
    products.product_name,
    categories.category_description,
    products.price,
    products.size
FROM products_schema.products
    JOIN products_schema.categories
        ON products.category_id = categories.category_id
WHERE category_description = 'Olive' OR categories.category_description LIKE '%Olive%'
ORDER BY size ASC
LIMIT 4
;

-- Data manipulation
-- Aliases "AS", and column name alias. The "AS" keyword is optional.
SELECT
    p.product_name AS "Product Name",
    p.size AS "Size (Ounces)",
    p.sku AS "Product SKU",
    p.price AS "Price (USD)",
    c.category_description AS "Category Description",
    c.product_line AS "Product Line"
FROM products_schema.products AS p
    JOIN products_schema.categories AS c
        ON p.category_id = c.category_id
;

-- Illustrates a trick, asking for a server to return a single value, not a column of date.
-- Also, we can give this data an alias in the result.
SELECT 'Adam' AS "Name";

-- Calculation on data during query - Mathematical operations.
-- Benefits: no additional data is stored, always up-to-date results.
SELECT
    p.sku,
    p.product_name,
    p.category_id,
    p.size,
    p.price,
    '8.5%' as tax_rate,
    p.price * 0.085  as tax,
    p.price + (p.price * 0.085) as total_price
FROM products_schema.products p;

-- Using built-in functions
-- View statistical information about pricing
SELECT
    MAX(price) AS "Max Price",
    MIN(price) AS "Min Price",
    ROUND(AVG(price), 2) AS "Average Price"
FROM products_schema.products;

-- Select product with the maximum price, Max is always updated on each query.
SELECT product_name, size, price
FROM products_schema.products
WHERE price = (SELECT MAX(price)
               FROM products_schema.products)
;

-- All build-in functions: https://www.postgresql.org/docs/current/functions.html

-- Group data based on common attribute values
SELECT
    category_description,
    COUNT(sku) AS "Number of SKUs",
    MIN(price) AS "Min Price",
    MAX(price) AS "Max Price",
    ROUND(AVG(price), 2) AS "Average Price"
FROM products_schema.products
    JOIN products_schema.categories
        ON products.category_id = categories.category_id
GROUP BY category_description
ORDER BY COUNT(sku) DESC
;

-- Filter groups with HAVING
-- WHERE - only applies to rows
-- HAVING - only applies to groups
SELECT
    category_description,
    COUNT(sku) AS "Number of SKUs"
FROM products_schema.products
    JOIN products_schema.categories
        ON products.category_id = categories.category_id
WHERE price > 15
GROUP BY category_description
--HAVING category_description = 'Olive Oils'
--HAVING NOT category_description = 'Olive Oils'
HAVING COUNT(sku) > 10
ORDER BY COUNT(sku) DESC
;

-- What are the sizes in milliliters? 1 ounce is 29.57353 ml.
SELECT
    p.product_name AS "Product Name",
    p.size AS "Size (Ounces)",
    -- convert ounces to milliliters:
    ROUND(p.size * 29.57353) AS "Size (Milliliters)",
    p.sku AS "Product SKU",
    p.price AS "Price (USD)",
    c.category_description AS "Category Description",
    c.product_line AS "Product Line"
FROM products_schema.products AS p
    JOIN products_schema.categories AS c
        ON p.category_id = c.category_id
;

-- How many different product SKUs are available in each size?
SELECT
    p.size AS "Size (Ounces)",
    COUNT(p.sku) AS "Product SKUs"
FROM products_schema.products AS p
    JOIN products_schema.categories AS c
        ON p.category_id = c.category_id
GROUP BY p.size
ORDER BY p.size DESC
;

-- What is the highest priced product in "Cosmetics" product line?
-- "Cosmetics" product line has "category_id = 3".
SELECT
    sku,
    product_name,
    category_id,
    size,
    price
FROM products_schema.products
WHERE price =
      (SELECT MAX(price)
       FROM products_schema.products
       WHERE category_id = 3)
       AND category_id = 3
;
