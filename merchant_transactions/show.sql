SELECT
    m.merchant_name,
    SUM((t.amount - COALESCE(r.total_refund, 0)) *
        CASE
            WHEN t.currency = m.settlement_currency THEN 1
            ELSE cer.rate
        END
    ) AS balance,
    m.settlement_currency
    ,SUM(t.amount) AS total_amount
FROM db.db_schema.transactions t
JOIN
    db_schema.merchants m
    ON t.merchant_id = m.merchant_id
LEFT JOIN
    db_schema.currency_exchange_rates cer
    ON t.currency = cer.from_currency
    AND m.settlement_currency = cer.to_currency
LEFT JOIN (
    SELECT
        transaction_id,
        SUM(amount) AS total_refund
    FROM db_schema.refunds
    GROUP BY transaction_id
) r
    ON t.transaction_id = r.transaction_id

GROUP BY merchant_name, settlement_currency
ORDER BY merchant_name;
