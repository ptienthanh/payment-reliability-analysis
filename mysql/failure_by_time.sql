-- ANALYSIS: FAILURE RATE BY HOUR
-- Purpose: Identify time-based patterns in transaction failures

SELECT 
    HOUR(initiated_at) AS hour_of_day,
    COUNT(*) AS total_transactions,
    SUM(CASE 
        WHEN transaction_status = 'failed' THEN 1 
        ELSE 0 
    END) AS failed_transactions,
    ROUND(
        SUM(CASE 
            WHEN transaction_status = 'failed' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
    2) AS failure_rate_percentage
FROM payment_project.transactions
GROUP BY HOUR(initiated_at)
ORDER BY hour_of_day;

-- Notes:
-- - Based on transaction initiation time
-- - Helps identify peak failure periods
-- - Supports system load and performance analysis
