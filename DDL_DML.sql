------Data Definition Language (DDL)

--CREATE DDL
--Creating a Database
CREATE DATABASE LibraryDB
--Creating a table
USE LibraryDB
CREATE TABLE Books
(
Id INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR (50) NOT NULL,
Price INT
)

USE LibraryDB
GO
SELECT * FROM INFORMATION_SCHEMA.TABLES 
GO

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='Books'



--ALTER
--Adding a new column
USE LibraryDB
ALTER TABLE Books
ADD ISBN INT NOT NULL;

--Modifying an existing column
USE LibraryDB
ALTER TABLE Books
ALTER COLUMN ISBN VARCHAR(50);



--DROP
--Deleting a table
DROP TABLE Books
--Deleting a database
DROP DATABASE LibraryDB

ALTER TABLE Books
DROP COLUMN ISBN

--TRUNCATE
USE LibraryDB
INSERT INTO dbo.Books(Name, Price) 
VALUES('Book-A', 100),
('Book-B', 200),
('Book-C', 150)


SELECT * FROM Books

TRUNCATE TABLE Books


--RENAME

SP_RENAME 'Books.Name','Libros', 'COLUMN'


--------Data Manipulation Language (DML)

CREATE DATABASE BikeStores

--SELECT
USE [BikeStores]
SELECT [order_id], [customer_id], [order_status], [order_date]
FROM [sales].[orders]

SELECT * FROM [sales].[customers]

--INSERT
INSERT INTO [sales].[customers]([first_name],[last_name],
[phone],[email],[street],[city],[state],[zip_code])
VALUES ('Honorio', 'Apaza','998980','hon@gmail.pe',
'new zone','ilo','Peru','001');


INSERT INTO [sales].[customers]
VALUES ('Maricial', 'Mamano','9989480','honee@gmail.pe',
'new zone','are','Peru','001');


--UPDATE
UPDATE sales.customers
SET [state] = 'New York'
WHERE [state] = 'NY'

SELECT*FROM [sales].[customers]

--DELETE
DELETE FROM sales.customers
WHERE [first_name] = 'Honorio'
AND [last_name] = 'Apaza';

SELECT*FROM [sales].[customers] WHERE [first_name] = 'Honorio'

--rollback
BEGIN TRANSACTION

DELETE FROM sales.customers
WHERE [first_name] = 'Honorio'
AND [last_name] = 'Apaza';

ROLLBACK TRANSACTION



-- WHERE / ORDER BY
SELECT * FROM [sales].[order_items]
WHERE [quantity] >=2 AND [list_price] <= 150
ORDER BY list_price 


SELECT * FROM [sales].[order_items]
WHERE list_price BETWEEN 80 AND 100
ORDER BY list_price DESC

SELECT * FROM sales.customers
WHERE [state] LIKE 'New%' 

-- OFFSET AND FETCH
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;


--TOP

SELECT TOP 10
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;


SELECT TOP 1 PERCENT
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;


SELECT TOP 3 WITH TIES
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;


--DISTINCT
	
SELECT DISTINCT [city] FROM [sales].[customers];
SELECT DISTINCT [state], [city] FROM [sales].[customers];

SELECT * FROM [sales].[customers]