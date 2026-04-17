SELECT 
    p.payment_method,
    COUNT(*) AS total_transactions,
    
    SUM(CASE 
        WHEN t.transaction_status = 'failed' THEN 1 
        ELSE 0 
    END) AS failed_transactions,

    ROUND(
        SUM(CASE 
            WHEN t.transaction_status = 'failed' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
    2) AS failure_rate_percentage

FROM payment_project.transactions t
JOIN payment_project.payments p 
    ON t.payment_id = p.payment_id

GROUP BY p.payment_method
ORDER BY failure_rate_percentage DESC;
