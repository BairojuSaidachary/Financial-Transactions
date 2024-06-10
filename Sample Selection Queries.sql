-- Sample Selection Queries

-- Select all customers
SELECT * FROM Customers;

-- Select all accounts for a specific customer

SELECT * FROM Accounts WHERE CustomerID = 1;

--  Select all transactions for a specific account

SELECT * FROM Transactions WHERE AccountID = 1;

--  Select all loans for a specific customer

SELECT * FROM Loans WHERE CustomerID = 1;

--  Select all credit cards for a specific customer

SELECT * FROM CreditCards WHERE CustomerID = 1;

--  Select account balance for a specific customer

SELECT c.FirstName, c.LastName, a.AccountType, a.Balance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
WHERE c.CustomerID = 1;

--  Select total loan balance for all customers

SELECT c.FirstName, c.LastName, SUM(l.Balance) AS TotalLoanBalance
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
GROUP BY c.CustomerID;

--  Select all transactions between specific dates

SELECT * FROM Transactions WHERE TransactionDate BETWEEN '2023-01-01' AND '2023-12-31';

-- Select all credit cards expiring in the next year

SELECT * FROM CreditCards WHERE ExpiryDate BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 YEAR);

-- Select all customers with overdue loans

SELECT c.FirstName, c.LastName, l.LoanType, l.Balance, l.EndDate
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
WHERE l.EndDate < NOW() AND l.Balance > 0;

-- Select all customers with overdue loans using a view

SELECT * FROM LoanStatus WHERE LoanStatus = 'Overdue';
