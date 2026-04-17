# Fintech Payment Reliability Analysis

## 📌 Project Overview

This project analyzes transaction failures in a digital wallet payment system to identify key reliability issues and propose data-driven improvements.

The objective is to:

* Improve transaction success rate
* Enhance user experience during payment
* Reduce potential revenue loss caused by failed transactions

---

## 🚨 Problem Statement

Users experience a relatively high transaction failure rate (~12%), leading to:

* Frustration during payment
* Reduced trust in the platform
* Increased risk of revenue loss due to abandoned transactions

The problem is not only technical but also related to system feedback and retry handling.

---

## 🎯 Key Objectives

* Measure and analyze transaction success vs failure
* Identify patterns of failure by time and payment method
* Understand root causes of transaction failures
* Provide insights to improve system reliability

---

## 🗂️ Data Structure

The dataset is structured into 3 main tables:

### 1. Transactions

* transaction_id
* user_id
* payment_id
* order_id
* amount
* transaction_status (success, failed, timeout, pending)
* failure_reason
* initiated_at
* completed_at
* retry_flag

### 2. Users

* user_id
* registration_date
* user_type
* account_status

### 3. Payments

* payment_id
* payment_method
* gateway_name
* bank_name
* payment_channel

---

## 📊 Data Analysis

### 1. Failure Rate Calculation

```sql
SELECT 
    COUNT(CASE WHEN transaction_status = 'failed' THEN 1 END) * 100.0 
    / COUNT(*) AS failure_rate_percentage
FROM transactions;
```

---

### 2. Failure Distribution by Status

```sql
SELECT 
    transaction_status,
    COUNT(*) AS total
FROM transactions
GROUP BY transaction_status
ORDER BY total DESC;
```

---

### 3. Failure Reasons Analysis

```sql
SELECT 
    failure_reason,
    COUNT(*) AS total
FROM transactions
WHERE transaction_status IN ('failed', 'timeout')
GROUP BY failure_reason
ORDER BY total DESC;
```

---

## 📊 Transaction Failure Rate by Hour

This chart shows how transaction failure rate varies across different hours of the day.

![Failure Rate by Hour](dashboard/failure_rate_by_hour.png)

## 💳 Failure Rate by Payment Method

![Failure by Method](dashboard/failure_rate_by_method.png)

### Key Insight

Failure rates vary across payment methods, indicating that some channels are less reliable.

Higher failure rates may be associated with:
- External bank system issues
- Payment gateway instability
- Method-specific transaction limits or security checks
  
---

## 🔍 Key Insights

* Failure rate fluctuates significantly by hour (~8% → ~16%)
* Two peak failure periods observed:

  * **05:00 – 06:00**
  * **18:00 – 20:00**
* Possible causes:

  * High transaction load during peak hours
  * External system latency (bank/gateway)
* Retry attempts exist but are not highly effective

---

## 🧠 Key Findings

From both system flow and data analysis:

* Lack of real-time status feedback causes user uncertainty
* External bank delays contribute significantly to failures
* Error messages are unclear → users don’t know what to do next
* No structured retry mechanism → low recovery rate

---

## 💡 Recommendations

* Implement real-time transaction status updates
* Improve error message clarity with actionable guidance
* Introduce structured retry mechanism
* Monitor peak-hour system performance and optimize capacity

---

## 🛠️ Tech Stack

* SQL (MySQL) → Data extraction & analysis
* Python (Pandas, Matplotlib) → Data visualization
* GitHub → Project version control & documentation

---

## 📁 Project Structure

```
payment-reliability-analysis/
├── Python/
├── mysql/
├── dashboard/
│   └── failure_rate_by_hour.png
├── README.md
```

---

## 👤 Author

**Phạm Tiến Thành**
Business Analyst / Data Analyst (Intern Level)

---
