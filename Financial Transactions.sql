-- Create Database
CREATE DATABASE FinancialTransactions;
USE FinancialTransactions;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    DateOfBirth DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_phone CHECK (Phone REGEXP '^91[0-9]{8,10}$')
);

-- Create Accounts Table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(15, 2),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    TransactionType VARCHAR(20),
    Amount DECIMAL(15, 2),
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

-- Create Loans Table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    LoanType VARCHAR(50),
    LoanAmount DECIMAL(15, 2),
    InterestRate DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    Balance DECIMAL(15, 2),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create CreditCards Table
CREATE TABLE CreditCards (
    CreditCardID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    CardNumber VARCHAR(16) UNIQUE,
    CardType VARCHAR(20),
    CreditLimit DECIMAL(15, 2),
    Balance DECIMAL(15, 2),
    ExpiryDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Users Table for Authentication and Authorization
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE,
    PasswordHash VARCHAR(255),
    Role VARCHAR(20),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Sample Data into Customers Table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, DateOfBirth) VALUES
('Aarav', 'Patel', 'aarav.patel@example.com', '919876543210', '123 MG Road, Mumbai, Maharashtra', '1990-05-15'),
('Vivaan', 'Sharma', 'vivaan.sharma@example.com', '919876543211', '456 N S Road, Delhi, Delhi', '1985-08-25'),
('Aditya', 'Iyer', 'aditya.iyer@example.com', '919876543212', '789 L B Road, Chennai, Tamil Nadu', '1992-01-30'),
('Sai', 'Reddy', 'sai.reddy@example.com', '919876543213', '321 Ameerpet, Hyderabad, Telangana', '1987-12-20'),
('Arjun', 'Gupta', 'arjun.gupta@example.com', '919876543214', '654 G T Road, Kolkata, West Bengal', '1995-07-05'),
('Krishna', 'Menon', 'krishna.menon@example.com', '919876543215', '987 M G Road, Bangalore, Karnataka', '1991-11-12'),
('Rohan', 'Singh', 'rohan.singh@example.com', '919876543216', '159 N H Road, Jaipur, Rajasthan', '1989-03-14'),
('Ananya', 'Nair', 'ananya.nair@example.com', '919876543217', '753 M G Road, Kochi, Kerala', '1993-06-22'),
('Aisha', 'Kapoor', 'aisha.kapoor@example.com', '919876543218', '852 Connaught Place, New Delhi, Delhi', '1990-09-18'),
('Diya', 'Chauhan', 'diya.chauhan@example.com', '919876543219', '951 Residency Road, Lucknow, Uttar Pradesh', '1988-02-27'),
('Ishaan', 'Joshi', 'ishaan.joshi@example.com', '919876543220', '111 College Road, Pune, Maharashtra', '1994-04-09'),
('Kabir', 'Rana', 'kabir.rana@example.com', '919876543221', '222 Civil Lines, Bhopal, Madhya Pradesh', '1991-07-29'),
('Mira', 'Thakur', 'mira.thakur@example.com', '919876543222', '333 Club Road, Chandigarh, Chandigarh', '1993-10-01'),
('Nina', 'Saxena', 'nina.saxena@example.com', '919876543223', '444 Nehru Road, Indore, Madhya Pradesh', '1985-12-15'),
('Omar', 'Khan', 'omar.khan@example.com', '919876543224', '555 Residency Road, Srinagar, Jammu and Kashmir', '1990-03-23'),
('Priya', 'Desai', 'priya.desai@example.com', '919876543225', '666 Park Street, Surat, Gujarat', '1989-05-30'),
('Rahul', 'Jain', 'rahul.jain@example.com', '919876543226', '777 Circular Road, Patna, Bihar', '1992-08-12'),
('Sneha', 'Agarwal', 'sneha.agarwal@example.com', '919876543227', '888 Ring Road, Ranchi, Jharkhand', '1991-11-08'),
('Tanvi', 'Shah', 'tanvi.shah@example.com', '919876543228', '999 Ashram Road, Ahmedabad, Gujarat', '1994-01-19'),
('Usha', 'Verma', 'usha.verma@example.com', '919876543229', '101 Gandhi Road, Bhubaneswar, Odisha', '1987-04-14'),
('Vikram', 'Pandey', 'vikram.pandey@example.com', '919876543230', '202 Circular Road, Kanpur, Uttar Pradesh', '1995-09-09'),
('Yash', 'Sethi', 'yash.sethi@example.com', '919876543231', '303 Mall Road, Dehradun, Uttarakhand', '1988-06-06'),
('Zara', 'Malhotra', 'zara.malhotra@example.com', '919876543232', '404 M G Road, Varanasi, Uttar Pradesh', '1991-02-16'),
('Anil', 'Kumar', 'anil.kumar@example.com', '919876543233', '505 J N Road, Guwahati, Assam', '1993-08-08'),
('Bhavna', 'Goyal', 'bhavna.goyal@example.com', '919876543234', '606 Central Avenue, Nagpur, Maharashtra', '1990-11-11');

-- Insert Sample Data into Accounts Table
INSERT INTO Accounts (CustomerID, AccountType, Balance) VALUES
(1, 'Savings', 15000.00),
(2, 'Current', 25000.00),
(3, 'Savings', 18000.00),
(4, 'Current', 30000.00),
(5, 'Savings', 12000.00),
(6, 'Current', 22000.00),
(7, 'Savings', 21000.00),
(8, 'Current', 19000.00),
(9, 'Savings', 27000.00),
(10, 'Current', 16000.00),
(11, 'Savings', 20000.00),
(12, 'Current', 24000.00),
(13, 'Savings', 14000.00),
(14, 'Current', 26000.00),
(15, 'Savings', 23000.00),
(16, 'Current', 25000.00),
(17, 'Savings', 13000.00),
(18, 'Current', 17000.00),
(19, 'Savings', 28000.00),
(20, 'Current', 22000.00),
(21, 'Savings', 26000.00),
(22, 'Current', 24000.00),
(23, 'Savings', 20000.00),
(24, 'Current', 15000.00),
(25, 'Savings', 21000.00);

-- Insert Sample Data into Transactions Table
INSERT INTO Transactions (AccountID, TransactionType, Amount) VALUES
(1, 'debit', 1000.00),
(2, 'credit', 2000.00),
(3, 'debit', 1500.00),
(4, 'credit', 2500.00),
(5, 'debit', 500.00),
(6, 'credit', 3000.00),
(7, 'debit', 2000.00),
(8, 'credit', 4000.00),
(9, 'debit', 1000.00),
(10, 'credit', 1500.00),
(11, 'debit', 2500.00),
(12, 'credit', 2000.00),
(13, 'debit', 3000.00),
(14, 'credit', 1000.00),
(15, 'debit', 2000.00),
(16, 'credit', 1500.00),
(17, 'debit', 2500.00),
(18, 'credit', 2000.00),
(19, 'debit', 1000.00),
(20, 'credit', 3000.00),
(21, 'debit', 2000.00),
(22, 'credit', 2500.00),
(23, 'debit', 1500.00),
(24, 'credit', 2000.00),
(25, 'debit', 1000.00);

-- Insert Sample Data into Loans Table
INSERT INTO Loans (CustomerID, LoanType, LoanAmount, InterestRate, StartDate, EndDate, Balance) VALUES
(1, 'Home', 500000.00, 6.5, '2022-01-01', '2032-01-01', 480000.00),
(2, 'Car', 200000.00, 7.0, '2021-05-01', '2026-05-01', 180000.00),
(3, 'Personal', 100000.00, 8.5, '2020-03-01', '2025-03-01', 90000.00),
(4, 'Education', 300000.00, 6.0, '2023-06-01', '2028-06-01', 270000.00),
(5, 'Home', 400000.00, 6.5, '2022-11-01', '2032-11-01', 380000.00);

-- Insert Sample Data into CreditCards Table
INSERT INTO CreditCards (CustomerID, CardNumber, CardType, CreditLimit, Balance, ExpiryDate) VALUES
(1, '1234567812345678', 'Visa', 100000.00, 5000.00, '2026-12-01'),
(2, '8765432187654321', 'MasterCard', 150000.00, 10000.00, '2025-11-01'),
(3, '4321876543218765', 'Amex', 200000.00, 15000.00, '2024-10-01'),
(4, '5678123456781234', 'Visa', 250000.00, 20000.00, '2026-09-01'),
(5, '7812345678123456', 'MasterCard', 300000.00, 25000.00, '2025-08-01');

-- Insert Sample Data into Users Table for Authentication and Authorization
INSERT INTO Users (Username, PasswordHash, Role) VALUES
('admin', SHA2('admin_password', 256), 'admin'),
('manager', SHA2('manager_password', 256), 'manager'),
('teller', SHA2('teller_password', 256), 'teller');

-- Performance Optimization: Add Indexes
CREATE INDEX idx_customer_email ON Customers(Email);
CREATE INDEX idx_account_customerid ON Accounts(CustomerID);
CREATE INDEX idx_transaction_accountid ON Transactions(AccountID);
CREATE INDEX idx_loan_customerid ON Loans(CustomerID);
CREATE INDEX idx_creditcard_customerid ON CreditCards(CustomerID);

-- Stored Procedures for Common Tasks
DELIMITER //
CREATE PROCEDURE GetCustomerAccounts (IN custID INT)
BEGIN
    SELECT * FROM Accounts WHERE CustomerID = custID;
END//
CREATE PROCEDURE GetAccountTransactions (IN accID INT)
BEGIN
    SELECT * FROM Transactions WHERE AccountID = accID;
END//
DELIMITER ;

-- Triggers for Logging Changes
CREATE TABLE AccountChanges (
    ChangeID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    OldBalance DECIMAL(15, 2),
    NewBalance DECIMAL(15, 2),
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER AfterAccountUpdate
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO AccountChanges (AccountID, OldBalance, NewBalance)
    VALUES (OLD.AccountID, OLD.Balance, NEW.Balance);
END//
DELIMITER ;

-- Views for User-Friendly Outputs

CREATE VIEW CustomerSummary AS
    SELECT 
        c.CustomerID,
        c.FirstName,
        c.LastName,
        a.AccountType,
        a.Balance
    FROM
        Customers c
            JOIN
        Accounts a ON c.CustomerID = a.CustomerID;

CREATE VIEW LoanStatus AS
SELECT c.FirstName, c.LastName, l.LoanType, l.LoanAmount, l.Balance, l.EndDate,
CASE
    WHEN l.EndDate < CURDATE() AND l.Balance > 0 THEN 'Overdue'
    ELSE 'Active'
END AS LoanStatus
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID;

-- Error Handling in Stored Procedures
DELIMITER //
CREATE PROCEDURE SafeInsertAccount (IN custID INT, IN accType VARCHAR(20), IN initBalance DECIMAL(15, 2))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'An error occurred. Please try again.' AS ErrorMessage;
    END;

    START TRANSACTION;
    INSERT INTO Accounts (CustomerID, AccountType, Balance) VALUES (custID, accType, initBalance);
    COMMIT;
END//
DELIMITER ;


