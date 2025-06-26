
-- LibraryManagementSystem database 

CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL
);

-- Publishers Table
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Loans Table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    IssueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Sample SELECTS
SELECT * FROM Authors;
SELECT * FROM Publishers;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Loans;

-- Authors
INSERT INTO Authors (Name, Country) VALUES 
('Dr.Charles', 'USA'),
('K.John', 'Africa'),
('George', 'Japan');

-- Publishers
INSERT INTO Publishers (Name, Country) VALUES 
('Eagle', 'USA'),
('Collins', 'Africa'),
('Bliss', 'Japan');

-- Books
INSERT INTO Books (Title, Genre, ISBN, AuthorID, PublisherID) VALUES 
('Human Evolution', 'Study about Humans', '9788129104595', 1, 1),
('Computer Basics', 'Computer science', '9780747532699', 2, 3),
('Sea Creatures', 'Zoology', '9780451524935', 3, 2);

-- Members
INSERT INTO Members (Name, JoinDate, Email) VALUES 
('Jai', '2024-05-5', 'jai@123.com'),
('Vardha', '2024-06-7', 'vardha@457.com');

-- Loans
INSERT INTO Loans (BookID, MemberID, IssueDate, ReturnDate) VALUES 
(1, 1, '2025-06-01', '2025-06-5'),
(2, 2, '2025-06-05', NULL);

-- UPDATE 

-- Update a member's email
UPDATE Members 
SET Email = 'jai@123.com' 
WHERE MemberID = 1;

-- Update a book's genre
UPDATE Books 
SET Genre = 'Underwater creatures' 
WHERE Title = 'Sea Creatures';

-- DELETE 

-- Delete a loan record that has been returned
DELETE FROM Loans 
WHERE ReturnDate IS NOT NULL;

-- Delete a member who has not borrowed any books
DELETE FROM Members 
WHERE MemberID NOT IN (SELECT DISTINCT MemberID FROM Loans);

-- SELECT to verify

SELECT * FROM Authors;
SELECT * FROM Publishers;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Loans;

-- EXTRA SELECTS USING WHERE, AND, OR, LIKE, BETWEEN

-- WHERE + AND
SELECT Books.Title, Authors.Name, Books.Genre 
FROM Books 
JOIN Authors ON Books.AuthorID = Authors.AuthorID
WHERE Authors.Country = 'USA' AND Books.Genre = 'Computer science';

-- WHERE + OR
SELECT * FROM Members
WHERE JoinDate = '2024-05-05' OR Email LIKE '%457%';

-- LIKE
SELECT * FROM Books
WHERE Title LIKE '%Computer%';

-- BETWEEN
SELECT * FROM Loans
WHERE IssueDate BETWEEN '2025-06-01' AND '2025-06-10';

-- ORDER BY Examples

-- Sort books by Title
SELECT * FROM Books
ORDER BY Title ASC;

-- Sort members by JoinDate
SELECT * FROM Members
ORDER BY JoinDate DESC;

-- Sort loans by ReturnDate with NULLs last
SELECT * FROM Loans
ORDER BY ReturnDate IS NULL, ReturnDate ASC;

-- Sort authors by Country, then Name
SELECT * FROM Authors
ORDER BY Country ASC, Name ASC;
