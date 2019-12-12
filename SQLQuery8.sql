CREATE TABLE Examples.SimpleTable
(
	SimpleTableId int NOT NUll	IDENTITY(1,1) PRIMARY KEY,
	Value1 varchar (20) NOT NULL,
	Value2 varchar (20) NOT NULL
	);
	-- 3 COLUMS BECAUSE 3 LINES (SimpleTable, Value2 and Value2)

CREATE PROCEDURE Examples.SimpleTable_Insert
	@Value1 varchar (20),
	@Value2 varchar (20)
AS
	INSERT INTO Examples.SimpleTable(Value1,Value2)
	VALUES (@Value1, @Value2);
	GO
EXEC Examples.SimpleTable_Insert 'MY VALUE 1', 'MY VALUE 2'

--	Exec Examples. SimpleTable_Insert 0, 'test','
SELECT * FROM Examples.SimpleTable;

--CREATE STORE PROCEDURES FOR UPDATE AND DELETE

CREATE PROCEDURE Examples.SimpleTable_Update
@Value1 varchar(20),
@Value2 varchar (20),
@Id int
AS
UPDATE Examples.SimpleTable
set
Value1 = @Value1,
Value2 = Value2
WHERE SimpleTableId = @Id;
GO
EXEC Examples.SimpleTable
CREATE PROCEDURE Examples.SimpleTable_Delete
@Id int
AS
DELETE FROM Examples.SimpleTable WHERE SimpleTableId = @Id;

--Exec Examples.SimpleTable_Insert 'My Value1', 'David'
--Exec Examples.SimpleTable_Update 'My new Value' , My other Value',1
--Exec Examples.SimpleTable_Delete 1

--SELECT * FROM Examples.SimpleTable

CREATE PROCEDURE Examples.SimpleTable_Select
AS
SELECT SimpleTableId,Value1, Value2
FROM Example.SimpleTable
ORDER BY Value1;

CREATE PROCEDURE Examples.SimpleTable_SelectValue1StartWitQorZ


AS
SELECT SimpleTableId, Value1, Value2
FROM Examples.SimpleTable
WHERE Value1 like 'Q%'
ORDER BY Value1 

SELECT *
FROM Examples.SimpleTable
WHERE Value1 like 'Z%'
ORder BY Value1;
GO
--DROP PROCEDURE Examples.SimpleTable_SelectValue1StartWitQorZ

--Parameters????

--EXEC Examples.SimpleTable_SelectValue1StartWitQorZ

INSERT INTO Examples.SimpleTable
Values ('Zebra','Alpha'),('Charlie','Tango'),('Quebec','Beta')