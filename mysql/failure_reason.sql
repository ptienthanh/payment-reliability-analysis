SELECT 
    failure_reason,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM transactions WHERE status = 'failed'), 2) AS percentage
FROM transactions
WHERE status = 'failed'
GROUP BY failure_reason
ORDER BY total DESC;
