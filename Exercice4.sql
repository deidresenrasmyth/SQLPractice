CREATE VIEW Sales.Orders10YearsMultipleItems
AS
SELECT OrderId, CustomerId, SalespersonPersonId, OrderDate, ExpectedDeliveryDate
FROM Sales.Orders
WHERE OrderDate >= DATEADD(Year, -10, SYSDATETIME())
		AND (SELECT COUNT (*) 
			FROM Sales.OrderLines
			WHERE OrderLines.OrderID = Orders.OrderID) > 1

			-- simbolo >= maior ou  igual
			-- sysdatetime() returne the currently date time
			-- count significa ???

SELECT TOP 5 *
FROM Sales.Orders10yearsMultipleItems
ORDER BY ExpectedDeliveryDate DESC

SELECT PersonId, IsPermittedToLogon, IsEmployee, IsSalesPerson
FROM Application.People

--0 significa false and 1 sidnifica tru

CREATE VIEW Application.PeopleEmployeeStatus
AS
SELECT PersonId, FullName,
	IsPermittedToLogon, IsEmployee, IsSalesPerson,
	CASE WHEN IsPermittedToLogon = 1 THEN 'Can Logon' 
			ELSE 'Can''t Logon' END AS LogonRights,
	CASE WHEN IsEmployee = 1 AND isSalesPerson = 1
		THEN 'Sales Person' 
	WHEN IsEmployee = 1
		THEN 'Regular'
	ELSE 'Not employee' END AS EmployeeType
FROM APPLICATION.People

SELECT * FROM APPLICATION. PeopleEmployeeStatus

CREATE SCHEMA
CREATE VIEW Reports.InvoiceSummaryBasis
AS
SELECT Invoices.InvoiceId, CustomerCategories.CustomerCategoryName,
	Cities.CityName, StateProvinces.StateProvinceName,
	StateProvinces.SalesTerritory,
	Invoices.InvoiceDate,
	--the grain of the report is at the invoice so total
	--the amouts for invoice
	SUM(InvoiceLines.LineProfit) AS InvoiceProfit,
	SUM(InvoiceLines.ExtendedPrice) AS InvoiceExtendedPrice
FROM Sales.Invoices
		JOIN Sales.InvoiceLines
			ON Invoices.InvoiceID = InvoiceLines.InvoiceID
		JOIN Sales.Customers
			ON Customers.CustomerID = Invoices.CustomerID
		JOIN Sales.CustomerCategories
			ON Customers.CustomerCategoryID = CustomerCategories.CustomerCategoryID
		JOIN Application.Cities
			ON Customers. DeliveryCityID = Cities. CityID
		JOIN Application.StateProvinces
			ON StateProvinces.StateProvinceID =
Cities.StateProvinceID
GROUP BY Invoices.InvoiceID,
CustomerCategories.CustomerCategoryName,
	Cities.CityName, StateProvinces.StateProvinceName,
	StateProvinces.SalesTerritory,
	Invoices.InvoiceDate;



