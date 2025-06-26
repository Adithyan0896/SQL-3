README: Library Management System – SQL Query Usage

Overview
This SQL script sets up a sample Library Management System database, including schema creation, data insertion, and demonstration of various SQL operations for querying and managing library data.

This document specifically highlights the usage of the following SQL clauses:

WHERE

AND, OR

LIKE

BETWEEN

ORDER BY

Clause Demonstrations
1. WHERE Clause
Used to filter rows that meet specific criteria.

Example: Retrieve members who joined on a specific date:

SELECT * FROM Members
WHERE JoinDate = '2024-05-05';

2. AND / OR Operators
Combine multiple conditions in a query.

AND Example: Books written by USA authors in the "Computer science" genre:

SELECT Books.Title, Authors.Name, Books.Genre 
FROM Books 
JOIN Authors ON Books.AuthorID = Authors.AuthorID
WHERE Authors.Country = 'USA' AND Books.Genre = 'Computer science';

OR Example: Members who joined on a specific date or have an email containing ‘457’:

SELECT * FROM Members
WHERE JoinDate = '2024-05-05' OR Email LIKE '%457%';

3. LIKE Operator

Used for pattern matching within string columns.

Example: Fetch books whose titles include the word “Computer”:

SELECT * FROM Books
WHERE Title LIKE '%Computer%';

4. BETWEEN Operator
Used to filter results within a specific range (inclusive).

Example: Fetch loans issued between June 1 and June 10, 2025:

SELECT * FROM Loans
WHERE IssueDate BETWEEN '2025-06-01' AND '2025-06-10';

5. ORDER BY Clause
Used to sort query results by one or more columns.

a. Sort Books by Title (Ascending):

SELECT * FROM Books
ORDER BY Title ASC;

b. Sort Members by Join Date (Descending):

SELECT * FROM Members
ORDER BY JoinDate DESC;

c. Sort Loans by Return Date (show NULLs last):

SELECT * FROM Loans
ORDER BY ReturnDate IS NULL, ReturnDate ASC;

d. Sort Authors by Country, then by Name:

SELECT * FROM Authors
ORDER BY Country ASC, Name ASC;

Purpose

These queries serve as a reference to understand how conditional filtering and sorting can be performed on structured data. They are especially helpful for:

Reporting and dashboards

Data exploration and analysis

Building backend logic for applications
