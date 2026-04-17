USE payment_project;

SELECT COUNT(*) FROM payment_project.users;
SELECT COUNT(*) FROM payment_project.payments;
SELECT COUNT(*) FROM payment_project.transactions;

-- Check row count
SELECT COUNT(*) AS total_users FROM payment_project.users;
SELECT COUNT(*) AS total_payments FROM payment_project.payments;
SELECT COUNT(*) AS total_transactions FROM payment_project.transactions;

-- Check sample data
SELECT * FROM payment_project.users LIMIT 5;
SELECT * FROM payment_project.payments LIMIT 5;
SELECT * FROM payment_project.transactions LIMIT 5;

-- Check transaction status distribution
SELECT 
    transaction_status,
    COUNT(*) AS total
FROM payment_project.transactions
GROUP BY transaction_status
ORDER BY total DESC;

-- Check null values trong transactions
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS null_transaction_id,
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
    SUM(CASE WHEN payment_id IS NULL THEN 1 ELSE 0 END) AS null_payment_id,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS null_amount,
    SUM(CASE WHEN transaction_status IS NULL THEN 1 ELSE 0 END) AS null_status,
    SUM(CASE WHEN failure_reason IS NULL OR failure_reason = '' THEN 1 ELSE 0 END) AS null_or_blank_failure_reason,
    SUM(CASE WHEN initiated_at IS NULL THEN 1 ELSE 0 END) AS null_initiated_at,
    SUM(CASE WHEN completed_at IS NULL THEN 1 ELSE 0 END) AS null_completed_at,
    SUM(CASE WHEN retry_flag IS NULL THEN 1 ELSE 0 END) AS null_retry_flag
FROM payment_project.transactions;

-- Check duplicate transaction_id
SELECT 
    transaction_id,
    COUNT(*) AS duplicate_count
FROM payment_project.transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;
 
-- Check payment method distribution
SELECT 
    p.payment_method,
    COUNT(*) AS total_transactions
FROM payment_project.transactions t
JOIN payment_project.payments p
    ON t.payment_id = p.payment_id
GROUP BY p.payment_method
ORDER BY total_transactions DESC; 

-- Check retry distribution
SELECT 
    retry_flag,
    COUNT(*) AS total
FROM payment_project.transactions
GROUP BY retry_flag;

-- Check failure reasons
SELECT 
    failure_reason,
    COUNT(*) AS total
FROM payment_project.transactions
WHERE transaction_status IN ('failed', 'timeout')
GROUP BY failure_reason
ORDER BY total DESC;

-- Check time range
SELECT 
    MIN(initiated_at) AS first_transaction,
    MAX(initiated_at) AS last_transaction
FROM payment_project.transactions;

-- Check processing time stats
SELECT
    COUNT(*) AS total_completed_transactions,
    ROUND(AVG(TIMESTAMPDIFF(SECOND, initiated_at, completed_at)), 2) AS avg_processing_seconds,
    MIN(TIMESTAMPDIFF(SECOND, initiated_at, completed_at)) AS min_processing_seconds,
    MAX(TIMESTAMPDIFF(SECOND, initiated_at, completed_at)) AS max_processing_seconds
FROM payment_project.transactions
WHERE completed_at IS NOT NULL;
