/*
## PostgreSQL in Docker:
### Create a docker container from Docker image (map to port "5401"):
    $ docker run --name postgresql -p 5401:5432 -e POSTGRES_PASSWORD=Adam123456 -d postgres:14.8
*/

-- clean up --
DROP TABLE IF EXISTS db_schema.merchants;
DROP TABLE IF EXISTS db_schema.transactions;
DROP TABLE IF EXISTS db_schema.refunds;
DROP TABLE IF EXISTS db_schema.currency_exchange_rates;
DROP SCHEMA IF EXISTS db_schema;
--DROP DATABASE IF EXISTS db;

-- set up --
--CREATE DATABASE db;
CREATE SCHEMA db_schema;

CREATE TABLE db_schema.merchants(
    merchant_id BIGINT NOT NULL PRIMARY KEY,
    merchant_name TEXT NOT NULL,
    settlement_currency CHAR(3) NOT NULL
);

CREATE TABLE db_schema.transactions(
    transaction_id BIGINT NOT NULL PRIMARY KEY,
    merchant_id BIGINT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    currency CHAR(3) NOT NULL
);

CREATE TABLE db_schema.refunds(
    refund_id BIGINT NOT NULL PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE db_schema.currency_exchange_rates(
    from_currency CHAR(3) NOT NULL,
    to_currency CHAR(3) NOT NULL,
    rate DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (from_currency, to_currency)
);

INSERT INTO db_schema.merchants VALUES
    (1, 'Merchant A', 'USD'),
    (2, 'Merchant B', 'CAD'),
    (3, 'Merchant C', 'EUR')
;

INSERT INTO db_schema.transactions VALUES
    (1, 1, 10, 'USD'),
    (2, 2, 10, 'CAD'),
    (3, 3, 10, 'EUR'),
    (4, 1, 10, 'USD'),
    (5, 2, 10, 'CAD'),
    (6, 3, 10, 'EUR'),
    (7, 1, 10, 'US1')
;

INSERT INTO db_schema.refunds VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 2, 2),
    (4, 7, 5)
;

INSERT INTO db_schema.currency_exchange_rates VALUES
    ('USD', 'USD', 1),
    ('CAD', 'CAD', 1),
    ('EUR', 'EUR', 1),
    ('US1', 'USD', 0.5),
    ('US2', 'USD', 2.0),
    ('CA1', 'CAD', 0.5),
    ('CA2', 'CAD', 2.0),
    ('EU1', 'EUR', 0.5),
    ('EU2', 'EUR', 2.0)
;
