# Financial Transactions Database

This project establishes a robust database system for managing financial transactions within a bank. The system encompasses tables for customers, accounts, transactions, loans, and credit cards, incorporating various features such as user authentication and authorization, data validation, backup and recovery strategies, performance optimizations, and reporting capabilities.

## Features

1. **User Authentication and Authorization**
    - Users table with hashed passwords and assigned roles (admin, manager, teller).
  
2. **Data Validation and Integrity**
    - Implementation of constraints and checks on data fields to ensure data quality.
    - Maintenance of referential integrity through foreign keys.

3. **Backup and Recovery**
    - Recommendations for regular database backups and recovery strategies via external tools and cron jobs.

4. **Performance Optimization**
    - Utilization of indexes on frequently queried columns to enhance performance.
    - Creation of views for simplified and optimized data access.
    - Implementation of stored procedures for common operations.
    - Utilization of triggers for automatic logging.

5. **Reporting and Analytics**
    - Provision of views for aggregated and formatted data.
    - Example queries catered to common reporting needs.

## Tables

1. **Customers**
    - `CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`, `DateOfBirth`, `CreatedAt`

2. **Accounts**
    - `AccountID`, `CustomerID`, `AccountType`, `Balance`, `CreatedAt`

3. **Transactions**
    - `TransactionID`, `AccountID`, `TransactionType`, `Amount`, `TransactionDate`

4. **Loans**
    - `LoanID`, `CustomerID`, `LoanType`, `LoanAmount`, `InterestRate`, `StartDate`, `EndDate`, `Balance`, `CreatedAt`

5. **CreditCards**
    - `CreditCardID`, `CustomerID`, `CardNumber`, `CardType`, `CreditLimit`, `Balance`, `ExpiryDate`, `CreatedAt`

6. **Users**
    - `UserID`, `Username`, `PasswordHash`, `Role`, `CreatedAt`

7. **AccountChanges**
    - `ChangeID`, `AccountID`, `OldBalance`, `NewBalance`, `ChangeDate`

## Sample Data

The script includes sample data for:
- Names and addresses.
- Accounts linked to customers.
- Transactions for each account.
- Loans and credit cards linked to customers.
- Users for authentication.

## Stored Procedures and Triggers

### Stored Procedures

- `GetCustomerAccounts`: Retrieves all accounts for a specific customer.
- `GetAccountTransactions`: Retrieves all transactions for a specific account.
- `SafeInsertAccount`: Safely inserts a new account with error handling.

### Triggers

- `AfterAccountUpdate`: Logs changes to account balances.

## Views

- `CustomerSummary`: Provides a summary of customer account balances.
- `LoanStatus`: Displays the status of loans (active or overdue).

# Database Setup Guide

## Setup
1. **Create Database and Tables**
   - Execute the script to create the database and tables.

2. **Insert Sample Data**
   - Utilize the provided commands to insert sample data into the tables.

3. **Create Stored Procedures and Triggers**
   - Set up stored procedures for common tasks and triggers for logging changes.

4. **Optimize Performance**
   - Indexes are created on frequently queried columns to enhance performance.

## Run Sample Queries
- Employ the provided sample queries to retrieve data and generate reports.

## Reporting and Analytics Queries
- Utilize provided Reporting and Analytics Queries.

## Notes
- **Backup and Recovery**: Implement strategies using external tools and schedule via cron jobs or similar mechanisms.
- **Regular Monitoring and Optimization**: Recommended to maintain performance as the dataset grows.
- **Secure Handling of Sensitive Data**: Especially user passwords.

## Contributing
- Contributions are welcome! Please feel free to submit a pull request or open an issue to discuss improvements or bug fixes.

© 2024 Financial Transactions Database. All rights reserved.
