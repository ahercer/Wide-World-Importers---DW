
CREATE view [dbo].[vf_Orders]
AS
select 
	[City Key],
	[WWI Order ID],
	cast(convert(varchar(8), [Order Date Key], 112) as int) as 'Order Date Key',
	cast(convert(varchar(8), [Picked Date Key], 112) as int) as 'Picked Date Key',
	[Customer Key],
	[Salesperson Key],
	[Picker Key],
	[Stock Item Key],
	Quantity, 
	[Unit Price],
	[Tax Rate],
	[Total Excluding Tax], 
	[Tax Amount], 
	[Total Including Tax]
from 
	[Fact].[Order]
GO

