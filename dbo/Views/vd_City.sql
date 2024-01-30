
create view dbo.vd_City
AS
select 
	[City Key],
	[WWI City ID],
	City,
	[State Province],
	Country,
	Continent,
	[Sales Territory],
	Region,
	Subregion
from 
	[Dimension].[City]
GO

