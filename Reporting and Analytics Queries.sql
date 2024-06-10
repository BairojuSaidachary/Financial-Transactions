-- Reporting and Analytics Queries

-- Total Balance per Customer

SELECT c.FirstName, c.LastName, SUM(a.Balance) AS TotalBalance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID;

-- Monthly Transactions Report

SELECT DATE_FORMAT(TransactionDate, '%Y-%m') AS Month, COUNT(*) AS TransactionCount, SUM(Amount) AS TotalAmount
FROM Transactions
GROUP BY Month
ORDER BY Month DESC;

-- Loan Status Report

SELECT c.FirstName, c.LastName, l.LoanType, l.LoanAmount, l.Balance, l.EndDate,
CASE
    WHEN l.EndDate < CURDATE() AND l.Balance > 0 THEN 'Overdue'
    ELSE 'Active'
END AS LoanStatus
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID;

-- Loan Status Report using a view
SELECT * FROM LoanStatus;