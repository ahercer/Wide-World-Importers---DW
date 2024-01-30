
create view dbo.vd_Item
AS
select 
	[Stock Item Key],
	[WWI Stock Item ID],
	[Stock Item] as 'Item Description',
	Color,
	Brand,
	Size,
	[Unit Price],
	[Tax Rate],
	[Recommended Retail Price]
from 
	[Dimension].[Stock Item]
GO

