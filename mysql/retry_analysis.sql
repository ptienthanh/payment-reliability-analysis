SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN retry_flag = 1 THEN 1 ELSE 0 END) AS retry_count,
    ROUND(SUM(CASE WHEN retry_flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS retry_rate
FROM transactions;
