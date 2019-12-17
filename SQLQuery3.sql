CREATE FUNCTION Sales.Customers_ReturnOrderCount
(
	@CustomerID int,
	@OrderDate date = NULL
)
RETURNS INT
WITH RETURNS NULL ON NULL INPUT, -- If all parameters NULL, return NULL imediatelly 
	SCHEMABINDING --make certain that the tables/columns referenced cannot change
AS
	BEGIN
		DECLARE @OutputValue int

		SELECT @OutputValue = Count(*)
		FROM Sales.Orders
		WHERE CustomerID = @CustomerID	
			AND (OrderDate = @OrderDate OR @OrderDate IS NULL);

		RETURN @OutputValue
			END;
	GO

	SELECT Sales.Customers_ReturnOrderCount(905, '2013-01-01');
	GO

	SELECT Sales.Customers_ReturnOrderCount(905, DEFAULT);
	GO

	SELECT CustomerID, Sales.Customers_ReturnOrderCount(CustomerID, DEFAULT) AS TotalOrders
	FROM Sales.Customers;
	GO

	CREATE FUNCTION Sales.Orders_ReturnFormattedCPO
	(
	@CustomerPurchaseOrderNumber nvarchar (20)
	)
	RETURNS nvarchar(20)
	With returns NULL ON NULL INPUT,
		SCHEMABINDING
		AS
		BEGIN
		RETURN (N'CPO' + RIGHT(N'00000000' + @CustomerPurchaseOrderNumber,8));
		END;
		GO

SELECT OrderId
FROM Sales.Orders
WHERE Sales.Orders_ReturnFormattedCPO(CustomerPurchaseOrderNumber) = 'CPO00019998';
GO

CREATE FUNCTION Sales.Customers_ReturnOrderCountSetSimple
(
	@CustomerID int,
	@OrderDate date = NULL
)
RETURNS TABLE
AS
RETURN (SELECT COUNT (*) AS SalesCount,
	CASE WHEN MAX(BackOrderOrderId) IS NOT NULL 
		THEN 1 ELSE 0 END AS HasbackOrderFlag
		FROM Sales.Orders
		WHERE CustomerId = @CustomerId
		AND(OrderDate=@OrderDate
		or @OrderDate IS NULL));
