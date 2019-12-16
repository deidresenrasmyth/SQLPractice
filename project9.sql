--DROP DATABASE  IF EXISTS 
 --DDRestaurant3 

--Create DataBase DDRestaurant3
--go

--USE DDRestaurant3
--GO

DROP TABLE IF EXISTS DDRestaurantLatin.OrdersItems;
DROP TABLE IF EXISTS DDRestaurantLatin.Items;
DROP TABLE IF EXISTS DDRestaurantLatin.Orders;
DROP TABLE IF EXISTS DDRestaurantLatin.Customers;
DROP TABLE IF EXISTS DDRestaurantLatin.Areas;
DROP TABLE IF EXISTS DDRestaurantLatin.Employees;

DROP SCHEMA IF EXISTS DDRestaurantLatin;
go
CREATE SCHEMA DDRestaurantLatin; 
GO

CREATE TABLE DDRestaurantLatin.Customers (
    CustomerId INT constraint PKCustomers  PRIMARY KEY IDENTITY (1, 1),
    FirstName VARCHAR (20) NOT NULL,
    LastName VARCHAR (20) NOT NULL,
    PhoneNumber VARCHAR (17) NOT NULL,
    PostCode VARCHAR(6) NOT NULL,
	CustomerAddress VARCHAR (50) NOT NULL,
	AreaId int NOT NULL,
	Email VARCHAR (60),
	Points INT NOT NULL
    );

CREATE TABLE DDRestaurantLatin.Employees(
	EmployeeId INT constraint PKEmployees PRIMARY KEY IDENTITY (1,1),
	FirstName VARCHAR (20) NOT NULL,
	LastName VARCHAR (20) NOT NULL,
	PhoneNumber Varchar (17) NOT NULL,
	Email VARCHAR (60),
	SinNumber VARCHAR (20) NOT NULL,
	EmployeeAddress VARCHAR (50) NOT NULL,
	BirthDate DATE
	);

CREATE TABLE DDRestaurantLatin.Items(
	ItemId INT constraint  PKItems  PRIMARY KEY IDENTITY (1,1),
	ItemName VARCHAR (40) NOT NULL,
	IngredientsSummary VARCHAR(200) NOT NULL,
	Calories INT NOT NULL,
	Price MONEY NOT NULL
	);

CREATE TABLE DDRestaurantLatin.Areas(
	AreaId INT constraint PKAreas PRIMARY KEY IDENTITY(1,1),
	AreaName VARCHAR (20) NOT NULL,
	EmployeeId INT not null
	FOREIGN KEY (EmployeeId) REFERENCES DDRestaurantLatin.Employees(EmployeeId)
	);

CREATE TABLE DDRestaurantLatin.ORDERS (
OrderId INT constraint PKORDERS  PRIMARY KEY IDENTITY(1,1),
CustomerId INT NOT NULL,
EmployeeId int not null,
OrderDate DateTime not null
FOREIGN KEY (CustomerId) REFERENCES DDRestaurantLatin.Customers(CustomerId),
FOREIGN KEY (EmployeeId) REFERENCES DDRestaurantLatin.Employees(EmployeeId)
);


CREATE TABLE DDRestaurantLatin.OrdersItems (
OrderItemId INT constraint PKOrdersItems PRIMARY KEY IDENTITY(1,1),
Amount INT NOT NULL,
OrderId int not null,
ItemId int not null
FOREIGN KEY (OrderId) REFERENCES DDRestaurantLatin.Orders(OrderId),
FOREIGN KEY (ItemId) REFERENCES DDRestaurantLatin.Items(ItemId)
);

ALTER TABLE DDRestaurantLatin.Customers ALTER COLUMN AreaId int
ALTER TABLE DDRestaurantLatin.Customers
ADD FOREIGN KEY (AreaId) REFERENCES DDRestaurantLatin.Areas(AreaId);

Select * from DDRestaurantLatin.Areas;
Select * from DDRestaurantLatin.Customers;
Select * from DDRestaurantLatin.Employees; 
Select * from DDRestaurantLatin.Items;
Select * from DDRestaurantLatin.Orders;
Select * from DDRestaurantLatin.OrdersItems;

--DBCC CHECKIDENT ('[DDRestaurantLatin].[Customers]', RESEED, 0);
--GO



ALTER TABLE DDRestaurantLatin.ORDERS
add CONSTRAINT ConsOrderDate 
DEFAULT GETDATE() for OrderDate



ALTER TABLE DDRestaurantLatin.Customers
ADD CONSTRAINT CHK_PostCode CHECK (PostCode like '[a-z][0-9][a-z][0-9][a-z][0-9]');
GO  

CREATE PROCEDURE DDRestaurantLatin.CustomersInsert @FirstName varchar(20), @LastName varchar(20), 
@PhoneNumber varchar(17), @PostCode varchar(6), @CustomerAddress varchar(50), @AreaId int, @Email varchar(60), @Points int

AS

INSERT INTO DDRestaurantLatin.Customers(FirstName, LastName, PhoneNumber, PostCode, CustomerAddress, AreaId, Email, Points)
VALUES (@FirstName, @LastName, @PhoneNumber, @Postcode, @CustomerAddress, @AreaId, @Email, @Points);

GO

EXEC DDRestaurantLatin.CustomersInsert 'Juan', 'Chavez', '647-263-9568','M5L3U5', '569 Pape Avenue', 5, 'helloworld@email.com', 50

SELECT * FROM DDRestaurantLatin.Customers

GO

CREATE PROCEDURE DDRestaurantLatin.CustomersUpdate @CustomerId int, @FirstName varchar(20), @LastName varchar(20), 
@PhoneNumber varchar(17), @PostCode varchar(6), @CustomerAddress varchar(50), @AreaId int, @Email varchar(60), @Points int

AS

UPDATE DDRestaurantLatin.Customers
SET FirstName = @FirstName, LastName = @LastName, PhoneNumber = @PhoneNumber, PostCode = @PostCode, CustomerAddress = @CustomerAddress, AreaId = @AreaId, Email = @Email, Points = @Points
WHERE CustomerId = @CustomerId;

GO

EXEC DDRestaurantLatin.CustomersUpdate 1001, 'Alberto', 'Chavez', '647-263-9568','M5L3U5', '569 Pape Avenue', 5, 'helloworld@email.com', 50

SELECT * FROM DDRestaurantLatin.Customers

GO

CREATE PROCEDURE DDRestaurantLatin.CustomersDelete @CustomerId int 
AS
DELETE FROM DDRestaurantLatin.Customers
WHERE CustomerId = @CustomerId;

GO

EXEC DDRestaurantLatin.CustomersDelete 1004

GO

CREATE PROCEDURE DDRestaurantLatin.ItemsInsert @ItemName varchar(40), @IngredientsSummary varchar(200), 
@Calories int, @Price int

AS

INSERT INTO DDRestaurantLatin.Items(ItemName, IngredientsSummary, Calories, Price)
VALUES (@ItemName, @IngredientsSummary, @Calories, @Price);

GO

EXEC DDRestaurantLatin.ItemsInsert 'Pie', 'Chicken', 586, 23.00

SELECT * FROM DDRestaurantLatin.Items

GO

CREATE PROCEDURE DDRestaurantLatin.ItemsUpdate @ItemId int, @ItemName varchar(40), @IngredientsSummary varchar(200), 
@Calories int, @Price int

AS

UPDATE DDRestaurantLatin.Items
SET ItemName = @ItemName, IngredientsSummary = @IngredientsSummary, Calories = @Calories, Price = @Price
WHERE ItemId = @ItemId;

GO

EXEC DDRestaurantLatin.ItemsUpdate 1001, 'Pie', 'Vegetables', 422, 20.50

SELECT * FROM DDRestaurantLatin.Items

GO

CREATE PROCEDURE DDRestaurantLatin.ItemsDelete @ItemId int 
AS
DELETE FROM DDRestaurantLatin.Items
WHERE ItemId = @ItemId;

GO

EXEC DDRestaurantLatin.ItemsDelete 1001

GO

--EMPLOYEES PROCEDURES

CREATE PROCEDURE DDRestaurantLatin.EmployeesInsert @FirstName varchar(20), @LastName varchar(20), 
@PhoneNumber varchar(17), @Email varchar(60), @SinNumber varchar(20), @EmployeeAddress varchar(50), @BirthDate datetime

AS

INSERT INTO DDRestaurantLatin.Employees(FirstName, LastName, PhoneNumber, Email, SinNumber, EmployeeAddress, BirthDate)
VALUES                                (@FirstName, @LastName, @PhoneNumber, @Email, @SinNumber, @EmployeeAddress, @BirthDate);

GO

EXEC DDRestaurantLatin.EmployeesInsert 'Bill', 'Gates', '647-263-9568','bill_gates@hotmail.com', '123456789', '569 Pape Avenue', '1985/07/01'

SELECT * FROM DDRestaurantLatin.Employees

GO



CREATE PROCEDURE DDRestaurantLatin.EmployeesUpdate @EmployeeId int, @FirstName varchar(20), @LastName varchar(20), 
@PhoneNumber varchar(17), @Email varchar(60), @SinNumber varchar(20), @EmployeeAddress varchar(50), @BirthDate datetime

AS

UPDATE DDRestaurantLatin.Employees
SET FirstName = @FirstName, LastName = @LastName, PhoneNumber = @PhoneNumber, Email = @Email, SinNumber = @SinNumber, EmployeeAddress = @EmployeeAddress, BirthDate = @BirthDate
WHERE EmployeeId = @EmployeeId;

GO

EXEC DDRestaurantLatin.EmployeesUpdate 1001,'Bill', 'Gates', '647-263-9568','bill_gates@hotmail.com', '123456789', '569 Pape Avenue', '1986/07/01'

SELECT * FROM DDRestaurantLatin.Employees

GO

CREATE PROCEDURE DDRestaurantLatin.EmployeesDelete @EmployeeId int 
AS
DELETE FROM DDRestaurantLatin.Employees
WHERE EmployeeId = @EmployeeId;

GO

EXEC DDRestaurantLatin.EmployeesDelete 1001

GO