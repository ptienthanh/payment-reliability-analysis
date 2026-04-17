CREATE DATABASE IF NOT EXISTS payment_project;
USE payment_project;

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY,
    registration_date DATE,
    user_type VARCHAR(20),
    account_status VARCHAR(20)
);

CREATE TABLE payments (
    payment_id VARCHAR(10) PRIMARY KEY,
    payment_method VARCHAR(50),
    gateway_name VARCHAR(50),
    bank_name VARCHAR(50),
    payment_channel VARCHAR(20)
);

CREATE TABLE transactions (
    transaction_id VARCHAR(12) PRIMARY KEY,
    user_id VARCHAR(10),
    payment_id VARCHAR(10),
    order_id VARCHAR(12),
    amount DECIMAL(12,2),
    transaction_status VARCHAR(20),
    failure_reason VARCHAR(50),
    initiated_at DATETIME,
    completed_at DATETIME NULL,
    retry_flag BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);

SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM transactions;
