CREATE TABLE Examples.Gadget
(
	GadgetId int NOT NULL CONSTRAINT PKGadget PRIMARY KEY,
	GadgetNumber char(8) NOT NULL CONSTRAINT AKGadget UNIQUE,
	GadgetType varchar(10) NOT NULL
);
GO

INSERT INTO Examples.Gadget(GadgetId, GadgetNumber, GadgetType)
VALUES (1,'00000001','Electronic'),
		(2,'00000002', 'Manual'),
		(3,'00000003','Manual');
GO

SELECT ElectronicGadget.GadgetNumber as FromView,
		Gadget.GadgetNumber as FromTable,
		Gadget.GadgetType,ElectronicGadget.UpperGadgetType
FROM Examples.ElectronicGadget
		FULL OUTER JOIN Examples.Gadget
			ON ElectronicGadget.GadgetId = Gadget.GadgetId;
GO

CREATE VIEW Examples.ElectronicGadget
AS
	SELECT GadgetId, GadgetNumber, GadgetType,
			UPPER(GadgetType) AS UpperGadgetType
	FROM Examples.Gadget
	WHERE GadgetType = 'Eletronic'
	GO

ALTER VIEW Examples.ElectronicGadget
AS
	SELECT GadgetID, GadgetNumber, GadgetType,
			UPPER(GadgetType) AS UpperGadgetType
	FROM Examples.Gadget
	WHERE GadgetType = 'Electronic'
	WITH CHECK OPTION;
	GO

INSERT INTO Examples.ElectronicGadget(GadgetId, GadgetNumber, GadgetType)
VALUES (6,'00000006','Manual');
GO

INSERT INTO Examples.ElectronicGadget(GadgetID, GadgetNumber,GadgetType)
VALUES (7,'00000007', 'Electronic');
GO

	--COMPARISONS
	-- LIKE, IN, 
	-- = MEANS EQUAL,
	-- < MEANS LESS THAN 
	-- > MEANS GREATER THAN
	--<>MEANS DIFERENT
	-- (OR !=)

	SELECT * FROM Examples.Gadget;
	SELECT * FROM Examples.ElectronicGadget;

INSERT INTO Examples.ElectronicGadget(GadgetId, GadgetNumber, GadgetType)
VALUES (4,'00000004','Electronic'),
		(5,'00000005', 'Manual');

--Update the row w could see to values that could not be seen
UPDATE Examples.ElectronicGadget
SET GadgetTYpe = 'Manual'
WHERE GadgetNumber = '00000004';
GO

--Update the row we could NOT see to values that could actually see
UPDATE Examples.Electronicgadget
SET GadgetType = 'Electronic'
WHERE GadgetNumber = '00000005';
GO

UPDATE Examples.Gadget
SET GadgetType = 'Manual'
WHERE GadgetNumber = '00000005';
GO



