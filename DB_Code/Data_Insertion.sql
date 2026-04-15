
--  AUTHORS / ILLUSTRATORS / TRANSLATORS

INSERT INTO Authors (Name, Nationality, Year_of_birth, Year_of_death, Biography)
VALUES 
('George Orwell', 'British', 1903, 1950, 'English novelist and essayist.'),
('J.K. Rowling', 'British', 1965, NULL, 'British author best known for Harry Potter.'),
('Gabriel García Márquez', 'Colombian', 1927, 2014, 'Nobel Prize-winning author.');

INSERT INTO Illustrators (Name, Nationality, Year_of_birth, Year_of_death, Biography)
VALUES
('Mary GrandPré', 'American', 1954, NULL, 'Illustrator of the U.S. Harry Potter editions.'),
('Quentin Blake', 'British', 1932, NULL, 'Illustrator known for his work with Roald Dahl.');

INSERT INTO Translators (Name, Nationality, Year_of_birth, Year_of_death, Biography)
VALUES
('Gregory Rabassa', 'American', 1922, 2016, 'Translated many Latin American works.'),
('Anthea Bell', 'British', 1936, 2018, 'Translated Harry Potter to German.'),
('John Doe', 'Canadian', 1980, NULL, 'Freelance translator.');

--  AWARDS

INSERT INTO AuthorAwards (Author_id, Title, Date_of_assignment)
VALUES 
(1, 'Literary Excellence Award', '1949-01-01'),
(2, 'Best Fantasy Writer', '2000-06-01');

INSERT INTO IllustratorAwards (Illustrator_id, Title, Date_of_assignment)
VALUES 
(1, 'Illustration Excellence', '2001-05-01'),
(2, 'Lifetime Achievement', '2015-04-01');

INSERT INTO TranslatorAwards (Translator_id, Title, Date_of_assignment)
VALUES
(1, 'Best Translator', '1985-07-01'),
(2, 'Cultural Contribution Award', '1990-03-01');


--  PUBLISHERS & COLLECTIONS

INSERT INTO Publishing_Houses (Name, Country, City, Street_name, Street_number)
VALUES
('Penguin Books', 'UK', 'London', 'Fleet Street', 23),
('Bloomsbury', 'UK', 'London', 'Bedford Square', 50);

INSERT INTO Collections (Publisher_id, Name, Year_of_establishment)
VALUES
(1, 'Classic Literature', 1950),
(2, 'Modern Fantasy', 1997);


--  SERIES & CATEGORIES

INSERT INTO Series (Name, Description)
VALUES 
('Harry Potter Series', 'Fantasy series about a young wizard.'),
('Modern Classics', 'Timeless modern literature.');

INSERT INTO Categories (Title, Description)
VALUES
('Fantasy', 'Fantasy fiction works.'),
('Classic', 'Classic literature from various eras.');


--  BOOKS

INSERT INTO Books 
(ISBN, Title, Length, Breadth, Depth, Weight, Publishing_year, Language, Number_of_pages, Price, Availability, Limited_edition, At_offer, Cover, Description, Publisher_id, Collection_name, Collection_Year_of_establishment)
VALUES
('9781234567890', 'Harry Potter and the Sorcerer''s Stone', 21, 14, 3, 0.5, 1997, 'English', 320, 19.99, 'In stock', 0, 1, 'Hardback', 'First in the Harry Potter series.', 2, 'Modern Fantasy', 1997),
('9780987654321', '1984', 20, 13, 2.5, 0.4, 1949, 'English', 328, 14.99, 'Limited Stock', 0, 0, 'Paperback', 'Dystopian novel by George Orwell.', 1, 'Classic Literature', 1950);


--  RELATION TABLES

INSERT INTO BooksAuthors (ISBN, Author_id)
VALUES
('9781234567890', 2),
('9780987654321', 1);

INSERT INTO BooksIllustrators (ISBN, Illustrator_id)
VALUES
('9781234567890', 1);

INSERT INTO BooksTranslators (ISBN, Translator_id)
VALUES
('9780987654321', 1);

INSERT INTO Books_Series (ISBN, Series_id)
VALUES
('9781234567890', 1),
('9780987654321', 2);

INSERT INTO Genre (Description, ISBN, Category_id)
VALUES
('Fantasy magic world', '9781234567890', 1),
('Political dystopia', '9780987654321', 2);


--  USERS

INSERT INTO Users (First_name, Last_name, Telephone, Sex, Date_of_birth, Country, City, Street_name, Street_number, Zip_code, Subscribed, Fidelity_card, Fidelity_card_number, Type_of_person, Email)
VALUES
('Alice', 'Johnson', '0712345678', 'Feminine', '1990-01-01', 'UK', 'London', 'Baker Street', 221, 10001, 1, 1, '1234567890123', 'Natural', 'alice@gmail.com'),
('Bob', 'Smith', '0723456789', 'Masculine', '1985-05-20', 'USA', 'New York', '5th Avenue', 10, 20002, 0, 0, NULL, 'Natural', 'bob@yahoo.com');


--  INTERESTS & USER INTERESTS

INSERT INTO Interests (Interest_name)
VALUES
('Philosophy'), ('History'), ('Comics'), ('Science Fiction');

INSERT INTO User_Interests (User_id, Interest_id)
VALUES
(1, 4),
(2, 2);


--  ORDERS & ORDERED_BOOKS

INSERT INTO Orders (User_id, Status, Type_of_payment, Gift_packed, Total_price)
VALUES
(1, 'Processed', 'Bank Card', 1, 34.98),
(2, 'Finalized', 'On Delivery', 0, 19.99);

INSERT INTO Ordered_Books (User_id, Order_id, ISBN, Quantity, Book_status)
VALUES
(1, 1, '9781234567890', 1, 'Processed'),
(2, 2, '9780987654321', 1, 'Delivered');


--  WISHLIST

INSERT INTO Wishlist (Name, User_id, ISBN)
VALUES
('Alice Favorites', 1, '9780987654321'),
('Bob Reads', 2, '9781234567890');


--  REVIEWS & RATINGS

INSERT INTO Review (User_id, ISBN, Description)
VALUES
(1, '9781234567890', 'Loved the story and characters!'),
(2, '9780987654321', 'A chilling but insightful read.');

INSERT INTO Rating (User_id, ISBN, Grade)
VALUES
(1, '9781234567890', 9.5),
(2, '9780987654321', 8.7);


SELECT * FROM AuthorAwards
SELECT * FROM Authors
SELECT * FROM Books
SELECT * FROM Books_Series
SELECT * FROM BooksAuthors
SELECT * FROM BooksIllustrators
SELECT * FROM BooksTranslators
SELECT * FROM Categories
SELECT * FROM Collections
SELECT * FROM Genre
SELECT * FROM IllustratorAwards
SELECT * FROM Illustrators
SELECT * FROM Interests
SELECT * FROM Ordered_Books
SELECT * FROM Orders
SELECT * FROM Publishing_Houses
SELECT * FROM Rating
SELECT * FROM Review
SELECT * FROM Series
SELECT * FROM TranslatorAwards
SELECT * FROM Translators
SELECT * FROM User_Interests
SELECT * FROM Users
SELECT * FROM Wishlist
