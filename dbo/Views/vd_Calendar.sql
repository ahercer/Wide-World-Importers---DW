
create view dbo.vd_Calendar
AS
select 
	cast(convert(varchar(8), [Date], 112) as int) as [Date Key],
	[Date],
	[Day Number], 
	[Day], 
	[Month], 
	[Short Month], 
	[Calendar Month Number], 
	[Calendar Month Label], 
	[Calendar Year], 
	[Calendar Year Label], 
	[Fiscal Month Number], 
	[Fiscal Month Label], 
	[Fiscal Year], 
	[Fiscal Year Label], 
	[ISO Week Number]
from 
	[Dimension].[Date]
GO

