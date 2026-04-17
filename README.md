# 📊 Fintech Payment Reliability Analysis

## 📌 Project Overview

This project analyzes transaction failures in a digital wallet payment system to identify key reliability issues and propose data-driven improvements.

The goal is to:
- Improve transaction success rate
- Enhance user experience
- Reduce potential revenue loss caused by failed payments

---

## ❗ Problem Statement

Users experience a relatively high transaction failure rate (~12%), leading to:
- Frustration and uncertainty
- Reduced trust in the system
- Potential drop in conversion and revenue

The project aims to uncover **why transactions fail** and **how to improve system reliability**.

---

## 🧠 Approach

The project follows a structured end-to-end analysis process:

### 1. Business Analysis (BA)
- Defined problem and KPIs
- Mapped payment flow
- Identified pain points across:
  - UX
  - System
  - External dependencies

### 2. Data Analysis (DA)
- Designed data schema (transactions, users, payments)
- Explored and cleaned dataset using SQL
- Built key metrics:
  - Failure Rate
  - Timeout Rate
  - Retry Rate
- Analyzed failure patterns:
  - By time
  - By payment method

### 3. Visualization
- Used Python (Pandas, Matplotlib) to create analytical charts

---

## 📊 Key Metrics

- **Total Transactions:** ~19,566  
- **Failure Rate:** ~12%  
- **Retry Rate:** ~5–6%  

👉 Indicates a significant system reliability issue.

---

## ⏰ Failure Pattern by Time

![Failure by Time](dashboard/failure_rate_by_hour.png)

### 🔍 Insight

- Failure rate varies significantly throughout the day (~8% → ~16%)
- Peak failure periods:
  - **05:00 – 06:00**
  - **18:00 – 20:00**

### 🧠 Interpretation

- High traffic during peak hours increases system load
- External systems (banks, gateways) may respond slower → timeout risk

---

## 💳 Failure by Payment Method

![Failure by Method](dashboard/failure_rate_by_method.png)

### 🔍 Insight

- **Bank card:** highest failure (~14%)
- **E-wallet:** high (~13%)
- **Linked bank:** moderate (~12%)
- **Wallet balance:** lowest (~8%)

### 🧠 Interpretation

- Payment methods relying on **external systems** are less reliable
- Internal wallet balance is the most stable option

---

## 🔍 Root Cause Analysis

Transaction failures are mainly driven by:

### 1. External System Dependency
- Bank response delays
- Payment gateway instability

### 2. Time-based Load Issues
- Peak hours → higher failure rates

### 3. Lack of Retry Mechanism
- Low retry success rate
- No structured retry flow

### 4. Poor User Experience
- No real-time status feedback
- Unclear failure messages

---

## 🚀 Business Impact

- Lower payment success rate  
- Increased user frustration  
- Potential revenue loss  

---

## 💡 Recommendations

### 🔹 Improve System Reliability
- Optimize integration with bank APIs
- Monitor and improve gateway performance

### 🔹 Implement Smart Retry Mechanism
- Auto-retry for timeout transactions
- Suggest alternative payment methods

### 🔹 Enhance User Experience
- Provide real-time transaction status
- Show clear and actionable error messages

### 🔹 Optimize for Peak Hours
- Scale system capacity during high-load periods

---

## 📂 Project Structure
payment-reliability-analysis/
│
├── dashboard/ # Charts
├── docs/ # Detailed analysis (by task)
├── mysql/ # SQL scripts
├── python/ # Python visualization scripts
├── README.md


---

## 🛠️ Tools & Technologies

- **SQL (MySQL)** – Data analysis
- **Python (Pandas, Matplotlib)** – Visualization
- **GitHub** – Version control & project showcase

---

## 🧠 Final Conclusion

> Transaction failures are not random — they are driven by system design limitations, external dependencies, and peak-hour load.

Improving reliability requires a combination of:
- System optimization
- Better UX design
- Smart retry strategies

---

## 📎 Detailed Analysis

- [Task 10 – Data Exploration](docs/task_10_data_exploration.md)
- [Task 12 – Failure Rate](docs/task_12_failure_rate.md)
- [Task 13 – Failure by Time](docs/task_13_failure_by_time.md)
- [Task 14 – Failure by Method](docs/task_14_failure_by_method.md)
- [Task 15 – Dashboard Summary](docs/task_15_dashboard_summary.md)
