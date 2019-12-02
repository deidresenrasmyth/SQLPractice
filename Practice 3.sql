SELECT * FROM Sales.Orders

SELECT * 
FROM Sales.customerTransactions
WHERE PaymentMethodId = 4;

SELECT CustomerID, OrderId, OrderDate, ExpectedDeliveryDate
FROM Sales.Orders
WHERE CustomerPurchaseOrderNumber = '16374'

SELECT SalespersonPersonId, OrderDate
FROM Sales.orders
ORDER BY SalespersonPersonId ASC, OrderDate DESC;

CREATE INDEX SalespersonPersonId_OrderDate1 ON Sales.Orders (SalespersonPersonId ASC,OrderDate DESC);

SELECT OrderId, OrderDate, ExpectedDeliveryDate, People.FullName
FROM Sales.Orders
	JOIN Application.People
		ON People.PersonId = Orders.ContactPersonId
WHERE PreferredName = 'Aakriti';

SELECT Orders.ContactPersonId,People.PreferredName
FROM Sales.Orders
	JOIN Application.People
		ON People.PersonId = Orders.ContactPersonId
WHERE PreferredName = 'Aakriti';

CREATE NONCLUSTERED INDEX ContactPersonId_Include_OrderDate_ExpectedDeliveryDate
ON Sales.Orders(ContactPersonId)
INCLUDE (OrderDate, ExpectedDeliveryDate)
ON Userdata
GO


























