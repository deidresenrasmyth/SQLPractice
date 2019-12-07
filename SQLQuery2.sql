DROP TABLE IF EXISTS Examples.Widget;
CREATE TABLE Examples.Widget(
WidgetId int primary key,
rowLastMofifiedTime DateTime2
);


ALTER TABLE Examples.Widget
ADD CONSTRAINT DFLTWidget_rowLastModifiedTime
DEFAULT(SYSDATETIME()) FOR RowLastModifiedTime;
GO

INSERT INTO Examples.Widget (WidgetId) VALUES (2);

SELECT * FROM Examples.Widget;