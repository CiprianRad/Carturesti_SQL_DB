CREATE DATABASE Library;

USE Library;

DROP DATABASE Library;

CREATE TABLE Authors (
	Author_id INT NOT NULL Identity(1,1) PRIMARY KEY,
	Name NVARCHAR(300) NOT NULL,
	Nationality NVARCHAR(100),
	Year_of_birth INT,
	Year_of_death INT,
	Biography NVARCHAR(MAX),
	CONSTRAINT CHK_Year_Author CHECK (
  Year_of_birth BETWEEN 0 AND YEAR(GETDATE()) AND 
  (Year_of_death IS NULL OR Year_of_death BETWEEN 0 AND 2025) AND
  (Year_of_death IS NULL OR Year_of_death >= Year_of_birth)
  )
);

CREATE TABLE Illustrators (
	Illustrator_id INT NOT NULL Identity(1,1) PRIMARY KEY,
	Name NVARCHAR(300) NOT NULL,
	Nationality NVARCHAR(100),
	Year_of_birth INT,
	Year_of_death INT,
	Biography NVARCHAR(MAX),
	CONSTRAINT CHK_Year_Illustrator CHECK (
  Year_of_birth BETWEEN 0 AND YEAR(GETDATE()) AND 
  (Year_of_death IS NULL OR Year_of_death BETWEEN 0 AND 2025) AND
  (Year_of_death IS NULL OR Year_of_death >= Year_of_birth)
  )
);

CREATE TABLE Translators (
	Translator_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(300) NOT NULL,
	Nationality NVARCHAR(100),
	Year_of_birth INT,
	Year_of_death INT,
	Biography NVARCHAR(MAX),
	CONSTRAINT CHK_Year_Translator CHECK (
  Year_of_birth BETWEEN 0 AND YEAR(GETDATE()) AND 
  (Year_of_death IS NULL OR Year_of_death BETWEEN 0 AND 2025) AND
  (Year_of_death IS NULL OR Year_of_death >= Year_of_birth)
  )
);


CREATE TABLE AuthorAwards (
    Author_id INT,
    Title NVARCHAR(400),
    Date_of_assignment DATE DEFAULT GETDATE(),
    FOREIGN KEY (Author_id) REFERENCES Authors(Author_id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PK_AuthorAwards PRIMARY KEY (Author_id, Title, Date_of_assignment)
);

CREATE TABLE TranslatorAwards (
    Translator_id INT,
    Title NVARCHAR(400),
    Date_of_assignment DATE DEFAULT GETDATE(),
    FOREIGN KEY (Translator_id) REFERENCES Translators(Translator_id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PK_TranslatorAwards PRIMARY KEY (Translator_id, Title, Date_of_assignment)
);

CREATE TABLE IllustratorAwards (
    Illustrator_id INT,
    Title NVARCHAR(400),
    Date_of_assignment DATE DEFAULT GETDATE(),
    FOREIGN KEY (Illustrator_id) REFERENCES Illustrators(Illustrator_id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PK_IllustratorAwards PRIMARY KEY (Illustrator_id, Title, Date_of_assignment)
);

CREATE TABLE Publishing_Houses (
	Publisher_id INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(400),
	Country VARCHAR(200),
	City NVARCHAR(300),
	Street_name NVARCHAR(400),
	Street_number INT CHECK (Street_number > 0)
);

CREATE TABLE Collections (
	Publisher_id INT,
	Name NVARCHAR(400) NOT NULL,
	Year_of_establishment INT NOT NULL CHECK(Year_of_establishment > 1000), 
	FOREIGN KEY (Publisher_id) REFERENCES Publishing_Houses(Publisher_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_Collections PRIMARY KEY (Publisher_id, Name, Year_of_establishment)
);

CREATE TABLE Series (
	Series_id INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(300) UNIQUE,
	Description NVARCHAR(MAX)
);

CREATE TABLE Categories (
	Category_id INT IDENTITY(1,1) PRIMARY KEY,
	Title NVARCHAR(300),
	Description NVARCHAR(MAX), 
);

CREATE TABLE Books (
	ISBN CHAR(13) PRIMARY KEY,
	CONSTRAINT CK_Books_ISBN_13digits CHECK (ISBN NOT LIKE '%[^0-9]%' AND LEN(ISBN) = 13),
	Title NVARCHAR(500) NOT NULL,
	Length FLOAT NOT NULL,
	Breadth FLOAT NOT NULL,
	Depth FLOAT,
	Weight FLOAT,
	Publishing_year INT NOT NULL CHECK (Publishing_year <= 2025 AND Publishing_year > 0),
	Language VARCHAR(100) NOT NULL,
	CONSTRAINT Books_Language CHECK (Language IN ('Romanian', 'Hungarian', 'French', 'Dutch', 'English', 'Russian', 'Spanish', 'Latin', 'Greek')),
	Number_of_pages INT NOT NULL CHECK (Number_of_pages > 0),
	Price FLOAT(4) CHECK (Price > 0) NOT NULL,
	Availability VARCHAR(50) NOT NULL,
	CONSTRAINT Books_Availability CHECK (Availability in ('Not Available', 'Supplier Stock', 'Limited Stock', 'In stock')),
	Limited_edition BIT NOT NULL,
	At_offer BIT NOT NULL,
	Cover VARCHAR(50),
	CONSTRAINT Books_Cover CHECK (Cover in ('Hardback', 'Paperback', 'Clothbound')),
	Description NVARCHAR(MAX) NOT NULL,
	Added_at DATE DEFAULT GETDATE(),
	Publisher_id INT NOT NULL,
	Collection_name NVARCHAR(400) NOT NULL,
	Collection_Year_of_establishment INT NOT NULL CHECK(Collection_Year_of_establishment > 1500), 
	CONSTRAINT FK_Books_Collections FOREIGN KEY (Publisher_id, Collection_name, Collection_Year_of_establishment) REFERENCES Collections(Publisher_id, Name, Year_of_establishment) ON UPDATE CASCADE ON DELETE SET NULL,
);

CREATE TABLE Books_Series (
	ISBN CHAR(13) NOT NULL,
	Series_id INT NOT NULL,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (Series_id) REFERENCES Series(Series_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_Books_Series PRIMARY KEY (ISBN, Series_id)
);

CREATE TABLE Genre (
	Description NVARCHAR(MAX),
	ISBN CHAR(13),
	Category_id INT,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (Category_id) REFERENCES Categories(Category_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_Genre PRIMARY KEY (ISBN, Category_id)
);

CREATE TABLE BooksTranslators (
	ISBN CHAR(13),
	Translator_id INT,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Translator_id) REFERENCES Translators(Translator_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_Book_Translator PRIMARY KEY (ISBN, Translator_id)
);

CREATE TABLE BooksIllustrators (
	ISBN CHAR(13),
	Illustrator_id INT,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Illustrator_id) REFERENCES Illustrators(Illustrator_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_Book_Illustrator PRIMARY KEY (ISBN, Illustrator_id)
);

CREATE TABLE BooksAuthors (
	ISBN CHAR(13),
	Author_id INT,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Author_id) REFERENCES Authors(Author_id) ON UPDATE CASCADE ON  DELETE SET NULL,
	CONSTRAINT PK_Book_Authors PRIMARY KEY (ISBN, Author_id)
);

CREATE TABLE Users (
	User_id INT IDENTITY(1,1) PRIMARY KEY,
	First_name NVARCHAR(200) NOT NULL,
	Last_name NVARCHAR(200) NOT NULL,
	Telephone VARCHAR(20) NOT NULL CHECK (Telephone NOT LIKE '%[^0-9]%'),
	Sex VARCHAR(30) CHECK (Sex IN ('Feminine', 'Masculine', 'Neutral')),
	Date_of_birth DATE,
	Created_at DATE DEFAULT GETDATE() NOT NULL,
	Country NVARCHAR(200) NOT NULL,
	City NVARCHAR(300) NOT NULL,
	Street_name NVARCHAR(300) NOT NULL,
	Street_number INT,
	Zip_code INT NOT NULL,
	Subscribed BIT NOT NULL DEFAULT 0,
	Fidelity_card BIT NOT NULL DEFAULT 0,
	Fidelity_card_number CHAR(13) NULL CHECK (Fidelity_card_number NOT LIKE '%[^0-9]%' AND LEN(Fidelity_card_number) = 13),
	CONSTRAINT Fidelity_card_number_required
    CHECK (
        (Fidelity_card = 0 AND Fidelity_card_number IS NULL)
        OR
        (Fidelity_card = 1 AND Fidelity_card_number IS NOT NULL)
    ),
	Type_of_person VARCHAR(50) NOT NULL CHECK (Type_of_person IN ('Natural', 'Legal')),
	Email NVARCHAR(200) NOT NULL UNIQUE,
	CONSTRAINT Email_validation CHECK (Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com')
);

CREATE TABLE Interests (
	Interest_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Interest_name NVARCHAR (MAX) NOT NULL,
	CONSTRAINT CHK_Interests_name CHECK (Interest_name IN ('Sports', 'Architecture', 'Philosophy', 'History', 'Art', 'Poetry', 'Manga', 'Comics',
	'Biology', 'Mathematics', 'Computer Science', 'Chemistry', 'Physics', 'Science Fiction', 'Economics', 'Self-help', 'Gastronomy', 'Biography',
	'Jurnals', 'Linguistics', 'Semiotics', 'Theology'))
);

CREATE TABLE User_Interests (
	User_id INT NOT NULL,
	Interest_id INT NOT NULL,
	FOREIGN KEY (User_id) REFERENCES Users(User_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Interest_id) REFERENCES Interests(Interest_id) ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY (User_id, Interest_id),
	Updated_at DATE DEFAULT GETDATE()
);

CREATE TABLE Orders (
	User_id INT NOT NULL,
	Order_id INT IDENTITY(1,1) NOT NULL,
	Status VARCHAR(100) NOT NULL CHECK (Status IN ('Anulled', 'Finalized', 'Processed', 'Shipped')),
	Type_of_payment NVARCHAR(100) NOT NULL CHECK (Type_of_payment IN ('On Delivery', 'Bank Card', 'Cultural Card', 'Online Card')),
	Placed_at DATE NOT NULL DEFAULT GETDATE(),
	Gift_packed BIT NOT NULL DEFAULT 0,
	Total_price DECIMAL(10,2) NOT NULL CHECK (Total_price > 0 ),
	FOREIGN KEY (User_id) REFERENCES Users(User_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_Order PRIMARY KEY (User_id, Order_id)
);

CREATE TABLE Ordered_Books (
	User_id INT NOT NULL,
	Order_id INT NOT NULL,
	ISBN CHAR(13) NOT NULL,
	Quantity INT NOT NULL CHECK (Quantity > 0),
	PRIMARY KEY (Order_id, ISBN),
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (User_id, Order_id) REFERENCES Orders(User_id, Order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	Book_status VARCHAR(50) NOT NULL CHECK (Book_status IN ('Not delivered','Processed', 'Shipped', 'Delivered'))
);

CREATE TABLE Wishlist (
	Name NVARCHAR(200) NOT NULL, 
	User_id INT NOT NULL,
	ISBN CHAR(13) NOT NULL,
	FOREIGN KEY (User_id) REFERENCES Users(User_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (User_id, ISBN, Name),
	Created_at DATE DEFAULT GETDATE(),
	Updated_at DATE DEFAULT GETDATE()
);

GO
CREATE TRIGGER 
trg_Wishlist_UpdatedAt
ON Wishlist
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Wishlist
    SET Updated_at = GETDATE()
    FROM Wishlist w
    INNER JOIN inserted i ON w.ISBN = i.ISBN AND w.User_id = i.User_id;
END;
GO

CREATE TABLE Review (
	User_id INT NOT NULL,
	ISBN CHAR(13) NOT NULL,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (User_id) REFERENCES Users(User_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_Review PRIMARY KEY (ISBN, User_id),
	Description NVARCHAR(MAX) NOT NULL,
	Created_at DATE DEFAULT GETDATE(),
	Updated_at DATE DEFAULT GETDATE()
);

GO
CREATE TRIGGER tgr_Review_Updated_at
ON Review
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Review
	SET Updated_at = GETDATE()
	FROM Review r
	INNER JOIN inserted i ON r.ISBN = i.ISBN AND r.User_id = i.User_id;
END;
GO


CREATE TABLE Rating (
	ISBN CHAR(13) NOT NULL,
	User_id INT NOT NULL,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (User_id) REFERENCES Users(User_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT PK_User_Book PRIMARY KEY (ISBN, User_id),
	Grade DECIMAL(4,2) NOT NULL CHECK (Grade >= 0 AND Grade <= 10),
	Created_at DATE DEFAULT GETDATE(),
	Updated_at DATE DEFAULT GETDATE()
);

GO
CREATE TRIGGER tgr_Rating_Updated_at
ON Rating
AFTER UPDATE 
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Rating
	SET Updated_at = GETDATE()
	FROM Rating r
	INNER JOIN inserted i ON r.ISBN = i.ISBN AND r.User_id = i.User_id;
END;


GO
CREATE FUNCTION dbo.fn_SanitizePhone (@Phone VARCHAR(25))
RETURNS VARCHAR(25)
AS
BEGIN
    WHILE PATINDEX('%[^0-9]%', @Phone) > 0
        SET @Phone = STUFF(@Phone, PATINDEX('%[^0-9]%', @Phone), 1, '');
    RETURN @Phone;
END;


CREATE PROCEDURE dbo.ValidatePhoneNumber 
    @RawNumber VARCHAR(25)
AS
BEGIN
    DECLARE @Clean VARCHAR(25) = dbo.fn_SanitizePhone(@RawNumber);
    DECLARE @CC VARCHAR(3), @NDC VARCHAR(5), @SN VARCHAR(10);
    IF LEN(@Clean) < 7 OR LEN(@Clean) > 15
    BEGIN
        SELECT 'Invalid' AS Status, 'Wrong Length' AS Reason;
        RETURN;
    END

    IF LEFT(@Clean, 1) = '1' AND LEN(@Clean) = 11
    BEGIN
        SET @CC = SUBSTRING(@Clean, 1, 1);
        SET @NDC = SUBSTRING(@Clean, 2, 3); -- Area Code
        SET @SN = SUBSTRING(@Clean, 5, 7);  -- Subscriber Number

        -- Validate Area Code
        IF LEFT(@NDC, 1) IN ('0', '1')
            SELECT 'Invalid' AS Status, 'Invalid Area Code' AS Reason;
        ELSE
            SELECT 'Valid' AS Status, @CC AS Country, @NDC AS AreaCode, @SN AS Subscriber;
    END
    --TODO: Add ELSE IF blocks for other Country Codes
END
