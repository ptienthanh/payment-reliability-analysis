-- 1. Check duplicate transaction_id
SELECT 
    transaction_id,
    COUNT(*) AS duplicate_count
FROM payment_project.transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- 2. Check failed/timeout transactions without failure_reason
SELECT *
FROM payment_project.transactions
WHERE transaction_status IN ('failed', 'timeout')
  AND (failure_reason IS NULL OR failure_reason = '');

-- 3. Check missing completed_at by transaction status
SELECT 
    transaction_status,
    COUNT(*) AS total_missing_completed_at
FROM payment_project.transactions
WHERE completed_at IS NULL
GROUP BY transaction_status;

-- 4. Check standardized transaction status values
SELECT DISTINCT transaction_status
FROM payment_project.transactions;

-- 5. Check retry_flag values
SELECT DISTINCT retry_flag
FROM payment_project.transactions;

-- 6. Check standardized payment methods
SELECT DISTINCT payment_method
FROM payment_project.payments;
