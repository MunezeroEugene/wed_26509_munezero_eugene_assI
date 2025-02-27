CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR2(100),
    LastName VARCHAR2(100),
    Email VARCHAR2(100),
    PhoneNumber VARCHAR2(15),
    JoinDate DATE
);
select * from members;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR2(255),
    Genre VARCHAR2(100),
    PublicationYear INT,
    ISBN VARCHAR2(13),
    AvailableCopies INT
);
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR2(100),
    LastName VARCHAR2(100),
    Nationality VARCHAR2(50)
);
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    TransactionDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber, JoinDate)
VALUES
(5, 'Charlie', 'Brown', 'brown@example.com', '0787574123', TO_DATE('2021-08-20', 'YYYY-MM-DD'));


INSERT INTO Books (BookID, Title, Genre, PublicationYear, ISBN, AvailableCopies)
VALUES (5, 'Pride and Prejudice', 'Romance', 1813, '349', 6);

INSERT INTO Authors (AuthorID, FirstName, LastName, Nationality)
VALUES (5, 'Judith', 'Aust', 'British');


INSERT INTO Transactions (TransactionID, MemberID, BookID, TransactionDate, ReturnDate)
VALUES
(2, 2, 2, TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-03-15', 'YYYY-MM-DD'));

INSERT INTO BookAuthors (BookID, AuthorID)
VALUES
(5, 5);


select * from Transactions;



UPDATE Books SET AvailableCopies = AvailableCopies - 1 WHERE BookID = 1;






DELETE FROM Transactions WHERE TransactionID = 1;


SELECT m.FirstName, m.LastName, b.Title, t.TransactionDate, t.ReturnDate
FROM Members m
JOIN Transactions t ON m.MemberID = t.MemberID
JOIN Books b ON t.BookID = b.BookID;

SELECT Title FROM Books
WHERE BookID IN (
    SELECT BookID FROM Transactions
    WHERE MemberID = (SELECT MemberID FROM Members WHERE bookID = 3)
);
SELECT * FROM Transactions
WHERE TransactionDate < SYSDATE - 7;


SELECT b.Title, COUNT(t.TransactionID) AS BorrowCount
FROM Books b
JOIN Transactions t ON b.BookID = t.BookID
GROUP BY b.Title
ORDER BY BorrowCount DESC
FETCH FIRST 5 ROWS ONLY;

SELECT MemberID
FROM Transactions
GROUP BY MemberID
HAVING COUNT(TransactionID) > 3;





select * from Members;

select owner , table_name from dba_tables

SELECT * from Members;

