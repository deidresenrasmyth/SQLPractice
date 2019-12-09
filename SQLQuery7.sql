DROP TABLE IF EXISTS Examples.Gadget;
CREATE TABLE Examples.Gadget
(
	GadgetId int IDENTITY (1,1) NOT NULL CONSTRAINT PKGadget PRIMARY KEY,
	GadgetCode varchar(10) NOT NULL
);
INSERT INTO Examples.Gadget(GadgetCode)
VALUES ('LENOVO-102');

SELECT * FROM Examples.Gadget

DELETE FROM Examples.Gadget WHERE GadgetId >=2;

ALTER TABLE Examples.Gadget ADD CONSTRAINT AKGadget UNIQUE (GadgetCode);

SELECT * FROM Examples.Gadget

DROP TABLE IF EXISTS Examples.GroceryItem;
CREATE TABLE Examples.GroceryItem
(
	ItemId int IDENTITY (1,1) PRIMARY KEY,
	ItemDescr varchar (200) NOT NULL,
	ItemCost smallmoney NULL,
	CONSTRAINT CHKGroceryItem_ItemCostRange 
	CHECK (ItemCost > 0 AND ItemCost < 100)
);

SELECT * FROM Examples.GroceryItem;
INSERT INTO Examples.GroceryItem (ItemDescr,ItemCost)
VALUES (NULL, 100.50);

INSERT INTO Examples.GroceryItem (ItemDescr, ItemCost)
VALUES ('PC  Chips',NULL)

DROP TABLE IF EXISTS Examples.Message
CREATE TABLE Examples.Message
(
	MessageTag char(5) NOT NULL,
	Comment nVarchar (MAX) NULL
);
ALTER TABLE Examples.Message
	ADD CONSTRAINT CHKMessage_MessageTagFormat
		CHECK (MessageTag LIKE '[A-Z]-[0-9][0-9][0-9]');


ALTER TABLE Examples.Message
	ADD CONSTRAINT CHKMessage_CommentNotEmpty
	CHECK (LEN(Comment) >0);

INSERT INTO Examples.Message (MessageTag, Comment)
VALUES ('nope', '');

INSERT INTO Examples.Message (MessageTag, Comment)
VALUES ('A-001','');

INSERT INTO Examples.Message (MessageTag, Comment)
VALUES ('A-008','This is a comment');



