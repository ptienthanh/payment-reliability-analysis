-- KPI CALCULATION: FAILURE RATE

SELECT 
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
FROM payment_project.transactions;


-- ============================================
-- Notes:
-- - Includes all transactions (dataset has no pending state)
-- - Uses CASE WHEN for scalability
-- - Result used for KPI comparison in business analysis
-- ============================================
