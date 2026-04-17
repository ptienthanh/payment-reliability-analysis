## Failure Analysis by Time

### Objective

To identify whether transaction failures are concentrated during specific hours of the day, which may indicate time-based load issues or external dependency constraints.

### SQL Query

```sql
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
```

### Visualization

![Failure Rate by Hour](dashboard/charts/failure_rate_by_hour.png)

### Key Insight

The failure rate varies significantly by hour, ranging from roughly **8.4% to 15.9%**.
This indicates that transaction failures are **not random**, but follow a time-based pattern.

Two notable peak periods appear around:

* **05:00–06:00**
* **18:00–20:00**

These periods show the highest failure rates, suggesting possible:

* higher transaction load
* external system latency
* bank/gateway processing constraints during peak traffic windows

### Business Implication

This finding suggests that transaction reliability is partially influenced by hourly system conditions rather than only by isolated transaction-level issues.

It supports the earlier pain point analysis around:

* long waiting time
* unclear payment status
* delayed response from external systems
