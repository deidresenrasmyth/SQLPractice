ALTER TABLE Examples.Widget
	ADD NullColumn int  NULL
		CONSTRAINT DFL_itemCOLUNM DEFAULT(100)

	SELECT * FROM Examples.Widget
	
ALTER TABLE Examples.Widget DROP COLUMN NullColumn;

ALTER TABLE Examples.Widget DROP COLUMN itemColumn;

ALTER TABLE Examples.Widget DROP DFL_itemColunm;

	