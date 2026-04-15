--Updates
UPDATE Authors
SET Biography = Biography + ' Still living and writing.'
WHERE Nationality = 'British' AND Year_of_death IS NULL;

UPDATE Books
SET Price = Price + 2, Availability = 'In stock'
WHERE (Availability = 'Limited Stock' OR Price < 15);


UPDATE Users
SET Fidelity_card = 1, Fidelity_card_number = '9999999999999'
WHERE Fidelity_card = 0 AND Fidelity_card_number IS NULL;

UPDATE Wishlist
SET Name = Name + ' - Updated'
WHERE User_id IN (SELECT User_id FROM Users WHERE Subscribed = 1) AND Name IS NOT NULL;

--Deletes
DELETE FROM Translators
WHERE Year_of_death IS NOT NULL AND Year_of_death < 1990;

DELETE FROM Orders
WHERE Status = 'Finalized' AND Total_price < 20;

DELETE FROM Review
WHERE Description IS NULL OR LEN(LTRIM(RTRIM(Description))) = 0;

DELETE FROM Wishlist
WHERE User_id IN (SELECT User_id FROM Users WHERE Subscribed = 0);
