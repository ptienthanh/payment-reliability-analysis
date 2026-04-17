# 💳 Payment Reliability Analysis

## 📌 Project Overview

This project analyzes **transaction failures in a digital wallet system** to identify key issues affecting payment reliability and user experience.

The goal is to:

* Understand why transactions fail
* Quantify business impact
* Provide actionable recommendations to improve system performance

---

## ⚡ Executive Summary

* **Failure rate:** ~12% of total transactions
* **Peak failure periods:** 05:00–06:00 and 18:00–20:00
* **High-risk methods:** Bank Transfer, QR Payment
* **Core issue:** Lack of structured retry mechanism + poor real-time feedback

### 💼 Business Impact

* Reduced conversion rate
* Poor user experience → increased drop-off
* Potential revenue loss

### 🎯 Key Actions (Priority Order)

1. Implement smart retry mechanism
2. Improve real-time transaction status
3. Optimize system during peak hours
4. Monitor and evaluate payment partners

---

## 🧠 Problem Statement

Digital payment systems must ensure **high success rates and fast processing**.

However, transaction failures can:

* Frustrate users
* Reduce trust in the platform
* Directly impact revenue

This project investigates:

> **Why do transactions fail, and how can we improve payment reliability?**

---

## 📊 Data Overview

### Main Tables

* **transactions**

  * transaction_id
  * user_id
  * status (success / failed / pending)
  * retry_flag
  * failure_reason
  * initiated_at
  * completed_at

* **payments**

  * payment_id
  * transaction_id
  * payment_method
  * gateway_name
  * bank_name

---

## 🔍 Analysis Approach

### 1. Data Exploration

* Row counts, missing values, duplicates
* Status distribution
* Retry behavior

### 2. Data Cleaning

* Remove inconsistencies
* Validate transaction timestamps
* Standardize status values

### 3. KPI Definition

* **Failure Rate**
* **Retry Rate**
* **Failure by Time**
* **Failure by Payment Method**

---

## 📈 Key Insights

### 1. Failure Rate is Significant (~12%)

* Indicates a major reliability issue
* Impacts both revenue and user trust

---

### 2. Peak Failure Occurs at Specific Hours

![Failure by Hour](dashboard/failure_rate_by_hour.png)

* High failure during:

  * Early morning (05–06h)
  * Evening peak (18–20h)

👉 Suggests:

* System overload
* External service latency

---

### 3. Payment Method Matters

![Failure by Method](dashboard/failure_rate_by_method.png)

* Bank Transfer and QR Payment have higher failure rates
* Wallet balance shows better performance

👉 Suggests:

* External dependencies (banks/gateways)
* Integration instability

---

### 4. Retry Mechanism is Underutilized

* Low retry rate compared to failure rate
* Many failed transactions are not recovered

👉 Suggests:

* Missing or ineffective retry logic

---

## 💰 Business Impact Analysis

### Assumptions

* Daily transactions: 10,000
* Average order value: $20

### Estimated Revenue at Risk

* Daily: **$24,000**
* Monthly: **~$720,000**

> Note: Not all failures lead to permanent loss, but poor retry handling reduces recovery rate.

### Operational Impact

* Increased support workload
* Lower user trust
* Higher checkout abandonment

---

## 🛠️ Recommended Actions

| Issue                | Evidence                  | Impact                    | Priority  | Owner       | Action                |
| -------------------- | ------------------------- | ------------------------- | --------- | ----------- | --------------------- |
| Peak-hour failures   | High failure rate by hour | Revenue loss              | 🔴 High   | Backend     | Scale system capacity |
| Weak retry handling  | Low retry rate            | Lost recovery opportunity | 🔴 High   | Engineering | Implement smart retry |
| Poor user feedback   | No real-time status       | UX drop-off               | 🟡 Medium | Product     | Improve UI feedback   |
| External instability | High failure in bank/QR   | Dependency risk           | 🟡 Medium | Ops         | Monitor partners      |

---

## 🧩 Technical Implementation

### SQL Analysis

Located in `/mysql/`

* `kpi_failure_rate.sql`
* `failure_by_time.sql`
* `failure_by_method.sql`
* `explore_data.sql`
* `clean_data.sql`

---

### Python Visualization

Located in `/python/`

* Generate charts for:

  * Failure by hour
  * Failure by method

---

### Dashboard

Located in `/dashboard/`

* Failure Rate by Hour
* Failure Rate by Payment Method

---

## ▶️ How to Run This Project

1. Load dataset into MySQL

2. Run SQL scripts in order:

   ```
   create_tables.sql
   explore_data.sql
   clean_data.sql
   kpi_failure_rate.sql
   failure_by_time.sql
   failure_by_method.sql
   ```

3. Run Python scripts:

   ```
   python failure_rate_by_hour.py
   python failure_rate_by_method.py
   ```

4. View output charts in `/dashboard`

---

## 📌 Key Takeaways

* Payment reliability is a **critical business metric**

* Failures are driven by both:

  * Internal system limitations
  * External dependencies

* Improving retry logic and system performance can:

  * Increase success rate
  * Recover lost revenue
  * Improve user trust

---

## 🚀 Future Improvements

* Add failure reason analysis
* Implement retry success tracking
* Analyze latency and timeout issues
* Build interactive dashboard (Tableau / Power BI)
* Simulate real-time monitoring system

---

## 👤 Author

Thanh Pham
Aspiring Business Analyst / Data Analyst
