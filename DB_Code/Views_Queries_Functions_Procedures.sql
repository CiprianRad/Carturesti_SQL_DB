USE Library;

SELECT * FROM AuthorAwards;
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Books_Series;
SELECT * FROM BooksAuthors;
SELECT * FROM BooksIllustrators;
SELECT * FROM BooksTranslators;
SELECT * FROM Categories;
SELECT * FROM Collections;
SELECT * FROM Genre;
SELECT * FROM IllustratorAwards;
SELECT * FROM Illustrators;
SELECT * FROM Interests;
SELECT * FROM Ordered_Books;
SELECT * FROM Orders;
SELECT * FROM Publishing_Houses;
SELECT * FROM Rating;
SELECT * FROM Review;
SELECT * FROM Series;
SELECT * FROM TranslatorAwards;
SELECT * FROM Translators;
SELECT * FROM User_Interests;
SELECT * FROM Users;    
SELECT * FROM Wishlist;


INSERT INTO Authors (Name, Nationality, Year_of_birth, Biography)
VALUES 
('Mircea Eliade', 'Romanian', 1907, 'Romanian historian of religions, writer, and philosopher.'),
('Gabriel Garcia Marquez', 'Colombian', 1927, 'Colombian novelist, Nobel Prize winner.'),
('J.K. Rowling', 'British', 1965, 'British author of the Harry Potter series.'),
('Haruki Murakami', 'Japanese', 1949, 'Contemporary Japanese novelist.');


INSERT INTO Translators (Name, Nationality, Year_of_birth, Biography)
VALUES 
('John Popescu', 'Romanian', 1975, 'Literary translator.'),
('Maria Toth', 'Hungarian', 1980, 'Translator of English literature.'),
('John Smith', 'British', 1960, 'Professional translator.');


INSERT INTO Illustrators (Name, Nationality, Year_of_birth, Biography)
VALUES 
('Anna Johnson', 'Romanian', 1985, 'Illustrator of children''s books.'),
('Taro Yamada', 'Japanese', 1972, 'Manga artist and illustrator.'),
('Claire Dupont', 'French', 1990, 'Comic book illustrator.');


INSERT INTO Publishing_Houses (Name, Country, City, Street_name, Street_number)
VALUES
('Humanitas', 'Romania', 'Bucharest', 'Nicolae Balcescu', 10),
('Penguin Books', 'UK', 'London', 'High Street', 12),
('Shinchosha', 'Japan', 'Tokyo', 'Shibuya', 3);


INSERT INTO Collections (Publisher_id, Name, Year_of_establishment)
VALUES
(1, 'Romanian Classics', 1995),
(2, 'Modern Literature', 2000),
(3, 'Contemporary Japan', 2010);


INSERT INTO Series (Name, Description)
VALUES
('Harry Potter', 'The fantasy series written by J.K. Rowling.'),
('One Hundred Years of Solitude', 'A series celebrating Latin American literature.'),
('Kafka on the Shore', 'Novels by Haruki Murakami.');


INSERT INTO Categories (Title, Description)
VALUES
('Fiction', 'Fictional literary works.'),
('Fantasy', 'Magical and adventure stories.'),
('Philosophy', 'Books about thought and reflection.');

INSERT INTO Books (ISBN, Title, Length, Breadth, Depth, Weight, Publishing_year, Language,
Number_of_pages, Price, Availability, Limited_edition, At_offer, Cover, Description, 
Publisher_id, Collection_name, Collection_Year_of_establishment)
VALUES
('9780000000001', 'Maitreyi', 21, 14, 3, 0.5, 1933, 'Romanian', 250, 45, 'In stock', 0, 1, 'Paperback', 'Novel inspired by Eliade''s Indian experience.', 1, 'Romanian Classics', 1995),
('9780000000002', 'One Hundred Years of Solitude', 22, 15, 3, 0.6, 1967, 'English', 350, 70, 'Limited Stock', 1, 0, 'Hardback', 'Masterpiece of magical realism.', 2, 'Modern Literature', 2000),
('9780000000003', 'Harry Potter and the Philosopher''s Stone', 23, 15, 3, 0.7, 1997, 'English', 320, 80, 'In stock', 0, 1, 'Hardback', 'The first book in the Harry Potter series.', 2, 'Modern Literature', 2000),
('9780000000004', 'Kafka on the Shore', 20, 13, 3, 0.5, 2002, 'English', 400, 65, 'Supplier Stock', 0, 0, 'Paperback', 'A surrealist Japanese novel.', 3, 'Contemporary Japan', 2010);


INSERT INTO BooksAuthors (ISBN, Author_id)
VALUES
('9780000000001', 1),
('9780000000002', 2),
('9780000000003', 3),
('9780000000004', 4);


INSERT INTO BooksTranslators (ISBN, Translator_id)
VALUES
('9780000000001', 2),
('9780000000002', 3),
('9780000000003', 4),
('9780000000004', 5);


INSERT INTO BooksIllustrators (ISBN, Illustrator_id)
VALUES
('9780000000001', 1),
('9780000000002', 3),
('9780000000003', 3),
('9780000000004', 2);


INSERT INTO Books_Series (ISBN, Series_id)
VALUES
('9780000000002', 2),
('9780000000003', 1),
('9780000000004', 3);


INSERT INTO Genre (Description, ISBN, Category_id)
VALUES
('Romantic novel', '9780000000001', 1),
('Magical realism', '9780000000002', 1),
('Fantasy and magic', '9780000000003', 2),
('Philosophical novel', '9780000000004', 3);


INSERT INTO Users (First_name, Last_name, Telephone, Sex, Date_of_birth, Country, City, Street_name, Street_number, Zip_code, Subscribed, Fidelity_card, Fidelity_card_number, Type_of_person, Email)
VALUES
('Andrew', 'Parker', '0712345678', 'Masculine', '1995-05-10', 'Romania', 'Bucharest', 'Victory Avenue', 20, 10010, 1, 1, '1234567890123', 'Natural', 'andrew@gmail.com'),
('Mary', 'Johnson', '0722334455', 'Feminine', '1988-07-21', 'Romania', 'Cluj', 'Heroes Street', 15, 40010, 1, 0, NULL, 'Natural', 'mary@yahoo.com'),
('John', 'Doe', '0744556677', 'Masculine', '1990-01-01', 'UK', 'London', 'King Street', 5, 50010, 0, 0, NULL, 'Natural', 'john@gmail.com');


INSERT INTO User_Interests (User_id, Interest_id)
VALUES
(1, 2),
(1, 1),
(2, 2),
(3, 3);


INSERT INTO Orders (User_id, Status, Type_of_payment, Gift_packed, Total_price)
VALUES
(1, 'Finalized', 'Bank Card', 1, 160.50),
(2, 'Processed', 'On Delivery', 0, 70.00),
(3, 'Finalized', 'Online Card', 0, 130.00);


INSERT INTO Ordered_Books (User_id, Order_id, ISBN, Quantity, Book_status)
VALUES
(1, 1, '9780000000003', 1, 'Delivered'),
(1, 1, '9780000000004', 1, 'Delivered'),
(2, 2, '9780000000001', 1, 'Processed'),
(3, 3, '9780000000002', 1, 'Delivered');


INSERT INTO Wishlist (Name, User_id, ISBN)
VALUES
('Fantasy', 1, '9780000000003'),
('Classics', 2, '9780000000001'),
('Modern', 3, '9780000000004');


INSERT INTO Review (User_id, ISBN, Description)
VALUES
(1, '9780000000003', 'An excellent book for young readers.'),
(2, '9780000000001', 'A deep and thought-provoking story.'),
(3, '9780000000002', 'A masterpiece of Latin American literature.');


INSERT INTO Rating (ISBN, User_id, Grade)
VALUES
('9780000000003', 1, 9.5),
('9780000000001', 2, 8.2),
('9780000000002', 3, 9.8);



SELECT BooksAuthors.Author_id FROM
BooksAuthors INNER JOIN Authors 
ON BooksAuthors.Author_id = Authors.Author_id

SELECT BooksAuthors.Author_id FROM
BooksAuthors
UNION 
SELECT Authors.Author_id FROM
Authors

SELECT BooksIllustrators.Illustrator_id FROM
BooksIllustrators
INTERSECT 
SELECT Illustrators.Illustrator_id FROM
Illustrators


SELECT Translators.Translator_id 
FROM
Translators
EXCEPT
SELECT BooksTranslators.Translator_id 
FROM
BooksTranslators

SELECT Books.Title, Books_Series.Series_id
FROM Books 
INNER JOIN
Books_Series
ON Books.ISBN = Books_Series.ISBN

SELECT Publishing_Houses.Name, Collections.Name 
FROM
Publishing_Houses 
INNER JOIN
Collections
ON
Publishing_Houses.Publisher_id = Collections.Publisher_id


SELECT Interests.Interest_name, User_Interests.User_id
FROM 
Interests
FULL OUTER JOIN
User_Interests
ON
Interests.Interest_id = User_Interests.Interest_id

SELECT Interests.Interest_name, User_Interests.User_id
FROM 
Interests
LEFT OUTER JOIN
User_Interests
ON
Interests.Interest_id = User_Interests.Interest_id

SELECT Interests.Interest_name, User_Interests.User_id
FROM 
Interests
RIGHT OUTER JOIN
User_Interests
ON
Interests.Interest_id = User_Interests.Interest_id

SELECT Interests.Interest_name, User_Interests.User_id
FROM 
Interests
INNER JOIN
User_Interests
ON
Interests.Interest_id = User_Interests.Interest_id

SELECT Wishlist.Name, COUNT(Wishlist.ISBN) AS number_of_books FROM Wishlist
GROUP BY Wishlist.Name
HAVING COUNT(Wishlist.ISBN) = 1
ORDER BY number_of_books DESC



SELECT DISTINCT Nationality, Name AS Person
FROM Authors
WHERE Nationality IS NOT NULL
UNION
SELECT DISTINCT Nationality, Name
FROM Translators
WHERE Nationality IS NOT NULL;

SELECT 
    b.Title AS Book,
    s.Name AS Series,
    s.Description AS Series_Description
FROM Books b
LEFT JOIN Books_Series bs ON b.ISBN = bs.ISBN
LEFT JOIN Series s ON bs.Series_id = s.Series_id;

SELECT 
    p.Name AS Publishing_House,
    COUNT(b.ISBN) AS Number_of_Books,
    AVG(b.Price) AS Price_Mean
FROM Books b
INNER JOIN Publishing_Houses p ON b.Publisher_id = p.Publisher_id
GROUP BY p.Name
ORDER BY Price_Mean DESC;

--Authors that have published more than one book and their last book published
SELECT 
    a.Name AS Author,
    COUNT(b.ISBN) AS Number_Of_Books,
    MAX(b.Publishing_year) AS Last_Publishing_Year
FROM Authors a
INNER JOIN BooksAuthors ba ON a.Author_id = ba.Author_id
INNER JOIN Books b ON ba.ISBN = b.ISBN
GROUP BY a.Name
HAVING COUNT(b.ISBN) > 1;

--Total price paid by Users on their orders
SELECT 
    u.First_name + ' ' + u.Last_name AS Person,
    SUM(o.Total_price) AS Total_Sum,
    MIN(o.Placed_at) AS First_Order
FROM Users u
INNER JOIN Orders o ON u.User_id = o.User_id
GROUP BY u.First_name, u.Last_name
ORDER BY Total_Sum DESC;


--The books found in the wishlists of the users from Romania or with an active Subscription
SELECT DISTINCT b.Title AS Book, b.Price, w.User_id
FROM Books b
INNER JOIN Wishlist w ON b.ISBN = w.ISBN
WHERE w.User_id IN (
    SELECT u.User_id
    FROM Users u
    WHERE (u.Country = 'Romania' AND u.Subscribed = 1)
       OR (u.Country = 'Romania' AND u.Fidelity_card = 1)
);


--Find all books written by authors whose books have been ordered by users from Romania.
SELECT DISTINCT b.Title AS Book_Title
FROM Books b
INNER JOIN BooksAuthors ba ON b.ISBN = ba.ISBN
INNER JOIN Authors a ON ba.Author_id = a.Author_id
WHERE a.Author_id IN (
    SELECT DISTINCT ba2.Author_id
    FROM BooksAuthors ba2
    INNER JOIN Ordered_Books ob ON ba2.ISBN = ob.ISBN
    INNER JOIN Orders o ON ob.User_id = o.User_id
    INNER JOIN Users u ON o.User_id = u.User_id
    WHERE u.Country = 'Romania'
);

--Find translators who translated at least one book that has reviews written by users from the UK.
SELECT DISTINCT t.Name AS Translator_Name
FROM Translators t
INNER JOIN BooksTranslators bt ON t.Translator_id = bt.Translator_id
WHERE EXISTS (
    SELECT 1
    FROM Review r
    INNER JOIN Users u ON r.User_id = u.User_id
    WHERE r.ISBN = bt.ISBN
      AND u.Country = 'UK'
);

--List all books that belong to categories of books that have at least one rating greater than 9.
SELECT DISTINCT b.Title AS Book_Title, c.Title AS Category
FROM Books b
INNER JOIN Genre g ON b.ISBN = g.ISBN
INNER JOIN Categories c ON g.Category_id = c.Category_id
WHERE g.Category_id IN (
    SELECT DISTINCT g2.Category_id
    FROM Genre g2
    INNER JOIN Rating r ON g2.ISBN = r.ISBN
    WHERE r.Grade > 9
);


--Find all authors who have at least one book on any user s wishlist.
SELECT DISTINCT a.Name AS Author_Name
FROM Authors a
INNER JOIN BooksAuthors ba ON a.Author_id = ba.Author_id
WHERE EXISTS (
    SELECT 1
    FROM Wishlist w
    WHERE w.ISBN = ba.ISBN
);

--Find all users who have ordered at least one book translated by a Romanian translator.
SELECT DISTINCT u.First_name + ' ' + u.Last_name AS User_Name
FROM Users u
WHERE u.User_id IN (
    SELECT DISTINCT o.User_id
    FROM Orders o
    INNER JOIN Ordered_Books ob ON o.Order_id = ob.Order_id
    WHERE ob.ISBN IN (
        SELECT bt.ISBN
        FROM BooksTranslators bt
        INNER JOIN Translators t ON bt.Translator_id = t.Translator_id
        WHERE t.Nationality = 'Romanian'
    )
);


ALTER PROCEDURE Insert_Author (
    @Name NVARCHAR (300), @Nationality NVARCHAR(100), @Year_of_birth INT,
    @Year_of_death INT, @Biography NVARCHAR(MAX))

AS
BEGIN

    IF dbo.IsValidString(@Name) = 0
    THROW 50001, 'Invalid Name.' ,1;

    IF dbo.IsValidString(@Nationality) = 0
    THROW 50001, 'Invalid Nationality', 1;

    IF dbo.IsValidYear(@Year_of_death) = 0
    THROW 50001 , 'Invalid year of death',1;

    IF dbo.IsValidYear(@Year_of_birth) = 0
    THROW 50001, 'Invalid year of birth.', 1;

    IF dbo.IsValidString (@Biography) = 0
    THROW 50001, 'Invalid Biography',1;
    
    INSERT INTO Authors (Name, Nationality, Year_of_birth, Year_of_death, Biography)
    VALUES (@Name, @Nationality, @Year_of_birth, @Year_of_death, @Biography)
END
GO

Insert_Author 'Gyr', 'Romanian', 1933, 1970, 'Philosopher and essayst'

CREATE FUNCTION dbo.IsValidYear (@Year INT)
RETURNS BIT
AS
BEGIN
    IF @Year BETWEEN 0 AND YEAR(GETDATE())
        RETURN 1;
    RETURN 0;
END
GO

CREATE FUNCTION dbo.IsValidString (@String NVARCHAR(300))
RETURNS BIT
AS
BEGIN
    If LTRIM(RTRIM(@String)) = '' OR @String = NULL 
        RETURN 0  
    RETURN 1
END
GO

CREATE PROCEDURE Insert_Books_Series 
    (@ISBN CHAR(13), @Series_id INT)

AS 
BEGIN

    IF dbo.Is_Valid_ISBN(@ISBN) = 0 
        THROW 50002, 'Invalid ISBN' , 1
    IF @Series_id NOT IN (SELECT Series_id FROM Series)
        THROW 50002, 'Series ID not in Series Table', 1
    IF @ISBN NOT IN (SELECT ISBN FROM Books) 
        THROW 50002, 'ISBN not in Books Table' , 1

    INSERT INTO Books_Series 
    VALUES (@ISBN, @Series_id)
    
END
GO

EXEC Insert_Books_Series '1234567890123', 2

CREATE FUNCTION Is_Valid_ISBN(@ISBN CHAR(13))
RETURNS BIT
AS
BEGIN
    IF @ISBN NOT LIKE '%[^0-9]%' AND LEN(@ISBN) = 13
        RETURN 1
    RETURN 0
END
GO

CREATE PROCEDURE Insert_Wishlist 
    (@Name NVARCHAR(200), @User_id INT, @ISBN CHAR(13), @Created_at DATE, @Updated_at DATE)
AS 
BEGIN

    IF dbo.IsValidString (@Name) = 0 
        THROW 50003, 'Invalid Wishlist Name' ,1 
    IF @User_id NOT IN (SELECT User_id FROM Users)
        THROW 50003, 'User ID not in User Table.', 1
    IF @ISBN NOT IN (SELECT ISBN FROM Books) 
        THROW 50003, 'ISBN not in Books Table',1
    IF dbo.Is_Valid_Date (@Created_at) = 0 
        THROW 50003, 'Invalid Creation Date', 1
    IF dbo.Is_Valid_Date (@Updated_at) = 0
        THROW 50003,  'Invalid Update Date', 1

    INSERT INTO Wishlist 
    VALUES (@Name, @User_id, @ISBN, @Created_at, @Updated_at)
        
END
GO

EXEC Insert_Wishlist 'My Fav. Books' , 5, '7632344587766', '2025 - 12 - 03', '2025 - 12 - 04' 

CREATE FUNCTION dbo.Is_Valid_Date 
    (@Date DATE)
RETURNS BIT
AS 
BEGIN
    DECLARE @Result BIT = 1;
    DECLARE @DB_Creation_Date DATE = '2025-10-01'

    IF @Date IS NULL 
        SET @Result = 0
    IF @Date < @DB_Creation_Date
        SET @Result = 0
    IF @Date > GETDATE() 
        SET @Result = 0 
    RETURN @Result
END
GO


CREATE VIEW vw_BookAuthors AS
SELECT 
    b.ISBN,
    b.Title AS Book_Title,
    a.Author_id,
    a.Name AS Author_Name,
    a.Nationality AS Author_Nationality
FROM Books b
INNER JOIN BooksAuthors ba 
    ON b.ISBN = ba.ISBN
INNER JOIN Authors a 
    ON ba.Author_id = a.Author_id;

SELECT * FROM vw_BookAuthors

ALTER VIEW vw_Wishlist_User AS
SELECT 
   Users.First_name,
   Users.Last_name,
   Wishlist.Name AS Wishlist,
   Wishlist.ISBN AS Books
FROM Wishlist 
INNER JOIN Users 
ON Wishlist.User_id = Users.User_id

SELECT * FROM vw_Wishlist_User

CREATE VIEW vw_UserInerest AS
SELECT 
    Users.First_name,
    Users.Last_name,
    Interests.Interest_name AS Interest
FROM Users 
LEFT JOIN User_Interests 
ON Users.User_id = User_Interests.User_id
LEFT JOIN Interests
ON User_Interests.Interest_id = Interests.Interest_id

SELECT * FROM vw_UserInerest

CREATE VIEW vw_Book_Contributors AS
SELECT
    Books.Title,
    Authors.Name AS Author,
    Illustrators.Name AS Illustrator,
    Translators.Name AS Translator
FROM Books 
FULL OUTER JOIN BooksAuthors
ON Books.ISBN = BooksAuthors.ISBN
FULL OUTER JOIN Authors
ON BooksAuthors.Author_id = Authors.Author_id
FULL OUTER JOIN BooksTranslators
ON BooksTranslators.ISBN = Books.ISBN
FULL OUTER JOIN Translators 
ON BooksTranslators.Translator_id = Translators.Translator_id
FULL OUTER JOIN BooksIllustrators
ON BooksIllustrators.ISBN = Books.ISBN
FULL OUTER JOIN Illustrators
ON Illustrators.Illustrator_id = BooksIllustrators.Illustrator_id

SELECT * FROM vw_Book_Contributors


GO
ALTER TRIGGER trg_User_Interest_Delete
ON User_Interests
AFTER DELETE 
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE User_Interests
	SET Updated_at = GETDATE()
	FROM User_Interests u
	INNER JOIN deleted d ON u.User_id = d.User_id;
    PRINT FORMAT(GETDATE(), 'yyyy-MM-dd') + ' OPERATION TYPE: DELETE ' + 'TABLE NAME : User_Interests' 
END
GO

DELETE FROM User_Interests 
WHERE User_Interests.User_id = 1

SELECT * FROM Books

GO
CREATE OR ALTER TRIGGER trg_User_Wishlist_Insert
ON Users
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    --SELECT * FROM inserted
    INSERT INTO Wishlist (Name, User_id, ISBN, Created_at, Updated_at)
    SELECT 'My wishlist',  i.User_id, '9780987654321', GETDATE(), GETDATE() FROM inserted as i
    PRINT FORMAT(GETDATE() , 'yyyy-MM-dd') + ' OPERATION TYPE : INSERT ' + 'TABLE NAME : Wishlist'
END
GO

INSERT INTO Users (First_name, Last_name, Telephone, Sex, Date_of_birth, 
    Country, City, Street_name, Street_number, Zip_code, Subscribed, 
    Fidelity_card, Fidelity_card_number, Type_of_person, Email )
VALUES ('Marie', 'Spinster', '0740323128', 'Feminine', '1999-12-03', 'Canada', 'Quebec', '12th Avenue', 52, 60103, 0, 0, NULL, 'Natural', 'spinster_marie.@yahoo.com');


SELECT * FROM Wishlist

