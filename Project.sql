CREATE DATABASE DDRestaurant
GO

CREATE SCHEMA  DDRestaurantLatin
GO

CREATE TABLE DDRestaurantLatin.Customers (
    CustomerId INT PRIMARY KEY IDENTITY (1, 1),
    FirstName VARCHAR (20) NOT NULL,
    LastName VARCHAR (20) NOT NULL,
    PhoneNumber VARCHAR (12) NOT NULL,
    PostCode VARCHAR(6) NOT NULL,
	CustomerAddress VARCHAR (50) NOT NULL,
	Area VARCHAR (30) NOT NULL,
	Email VARCHAR (60),
	Points INT NOT NULL
    );


--FOREIGN KEY (store_id) REFERENCES sales.stores (store_id)

CREATE TABLE DDRestaurantLatin.Employees(
	EmployeeId INT PRIMARY KEY IDENTITY (1,1),
	FirstName VARCHAR (20) NOT NULL,
	LastName VARCHAR (20) NOT NULL,
	PhoneNumber Varchar (12) NOT NULL,
	Email VARCHAR (60),
	Id Varchar (20) NOT NULL,
	SinNumber VARCHAR (20) NOT NULL,
	EmployeeAddress VARCHAR (50) NOT NULL,
	BirthDate DATE
	);

CREATE TABLE DDRestaurantLatin.Items(
	ItemId INT PRIMARY KEY IDENTITY (1,1),
	ItemName VARCHAR (40) NOT NULL,
	IngredientsSummary VARCHAR(200) NOT NULL,
	Calories INT NOT NULL,
	Price MONEY NOT NULL
	);

CREATE TABLE DDRestaurantLatin.Areas(
	AreaId INT PRIMARY KEY IDENTITY(1,1),
	AreaName VARCHAR (20) NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES DDRestaurantLatin.Employees (EmployeeId)
	);


	

