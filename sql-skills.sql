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

SELECT min(total) FROM invoice


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

