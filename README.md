# Fintech Payment Reliability Analysis

## 📌 Project Overview

This project analyzes transaction failures in a digital wallet payment system to identify key reliability issues and propose data-driven solutions.

The goal is to improve transaction success rate, enhance user experience, and reduce revenue loss caused by failed payments.

---

## 🚨 Problem Statement

Users experience a high transaction failure rate (~12%), leading to frustration, reduced trust, and potential revenue loss.

---

## 💰 Business Impact

Assumptions:

* Daily transactions: 10,000
* Failure rate: 15%
* Average order value: $20

Estimated revenue loss:

* $30,000/day
* ~$900,000/month

---

## 🎯 Objectives & KPIs

* Transaction Success Rate ≥ 98%
* Processing Time ≤ 3 seconds
* Failure Rate ≤ 2%
* Refund Time ≤ 1 minute

---

## 🧩 Project Structure

* **Business Analysis**

  * Stakeholders & Use Cases
  * User Journey Mapping
  * System Flow (As-is)
  * Pain Point Analysis

* **Data Analysis**

  * Data Schema Design
  * SQL Data Exploration
  * Failure Analysis (time, method, reason)
  * Dashboard visualization

---

## 🗂 Dataset

Synthetic dataset including:

* 3,000 users
* 12 payment methods
* 19,566 transactions

---

## 📊 Key Findings

* ~12% of transactions fail → significant reliability issue
* 1,116 retry transactions → users actively attempt recovery
* Top failure causes:

  * Insufficient funds
  * Bank rejection
  * Network errors

---

## 💡 Insights

Transaction failures are driven by:

* External systems (bank delays, rejection)
* System limitations (no retry mechanism)
* UX issues (unclear error messages, lack of guidance)

---

## 🛠 Tools Used

* MySQL (Data analysis)
* Python (optional visualization)
* Draw.io (system diagrams)
* Figma (UI/UX)

---

## 🚀 Next Steps

* Implement structured retry mechanism
* Improve real-time status feedback
* Enhance error messaging
* Optimize system performance

---

## 📎 Author

Thanh Pham
Business Analyst / Data Analyst (Fintech-focused)
