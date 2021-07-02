-- Artist Table
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)

INSERT INTO artist (name)
VALUES ('Adam Levine'), ('Morgan Wallen'), ('The Wknd');

SELECT * FROM artist

-- Select 5 artists in alphabetical order.

SELECT * FROM artist ORDER BY name LIMIT 5;

-- Employee Table
-- List all employee first and last names only that live in Calgary.

SELECT first_name, last_name 
FROM employee 
WHERE city = 'Calgary'

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards

SELECT * FROM employee
WHERE reports_to = 2

-- Count how many people live in Lethbridge.

SELECT COUNT(*)
FROM employee
WHERE city = 'Lethbridge'

-- Invoice Table
-- Count how many orders were made from the USA.

SELECT COUNT(*)
FROM invoice
WHERE billing_country = 'USA';

-- Find the largest order total amount.

SELECT MAX(total) FROM invoice

-- Find the smallest order total amount.

SELECT MIN(total) FROM invoice


-- Find all orders bigger than $5. 

SELECT * FROM invoice WHERE total >5

-- Count how many orders were smaller than $5.

SELECT COUNT(total) FROM invoice WHERE total < 5

-- Get the total sum of the orders.

SELECT SUM(total) FROM invoice

-- JOIN Queries (Various tables)
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT * 
FROM invoice i
JOIN invoice_line il
ON i.invoice_id = il.invoice_id
WHERE unit_price > .99

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT invoice_date, c.first_name, c.last_name, total
FROM invoice i
JOIN customer c
ON c.customer_id = i.customer_id

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c 
JOIN employee e
ON c.support_rep_id = e.employee_id

-- Get the album title and the artist name from all albums.

SELECT title, name
FROM album al
JOIN artist ar
on al.artist_id = ar.artist_id

-- Make sure to add and commit your SQL file to the respository for this assessment on Github.

--EXTRA CREDIT--
-- SQL
-- Artist Table

-- Select 10 artists in reverse alphabetical order.

SELECT * FROM artist ORDER BY name DESC LIMIT 10;

-- Select all artists that start with the word ‘Black’.

SELECT *
FROM artist
WHERE name LIKE 'Black%'

-- Select all artists that contain the word ‘Black’.

SELECT *
FROM artist
WHERE name LIKE '%Black%'

-- Employee Table

-- Find the birthdate for the youngest employee.

SELECT MAX(birth_date)
FROM employee

-- Find the birthdate for the oldest employee.

SELECT MIN(birth_date)
FROM employee

-- Invoice Table

-- Count how many orders were in CA, TX, or AZ (use IN).

SELECT COUNT(invoice_id)
FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ')

-- Get the average total of the orders.

SELECT AVG(total)
FROM invoice

-- More Join Queries

-- Get all playlist_track track_ids where the playlist name is Music.

SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p 
ON pt.playlist_id = p.playlist_id
WHERE p.name = 'Music';

-- Get all track names for playlist_id 5.

SELECT t.name, playlist_id
FROM playlist_track pt
JOIN track t
ON pt.track_id = t.track_id
WHERE playlist_id = 5

-- Get all track names and the playlist name that they’re on ( 2 joins ).
SELECT * FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
JOIN playlist p ON pt. playlist_id = p.playlist_id
-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).

SELECT t.name, a.title FROM track track_id
JOIN album a on t. album_id = a.album_id
Join genre g ON g. genre_id = t.genre_id
WHERE g. name = 'Alternative & Punk'
;

-- Data with Python
-- In process.py, write another function that prints out all the melon orders that delivered over 10 melons.

