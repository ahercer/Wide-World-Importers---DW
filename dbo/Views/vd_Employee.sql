

CREATE view [dbo].[vd_Employee]
AS

select 
	[Employee Key],
	[WWI Employee ID],
	Employee as 'Employee Name',
	lower(replace(Employee, ' ', '.')) + '@elastacloud.com' as 'Employee Email',
	[Is Salesperson], 
	case 
		when cast([Valid To] as Date) = '9999-12-31' then 1 
		else 0 
	end [Is Active]
from 
	[Dimension].[Employee]

UNION ALL

select 
	cast(max([Employee Key]) as int) + 1,
	cast(max([WWI Employee ID]) as int) + 1,
	'Anna Hercer',
	'anna.hercer@elastacloud.com',
	0,
	1
from 
	[Dimension].[Employee]

UNION ALL

select 
	cast(max([Employee Key]) as int) + 2,
	cast(max([WWI Employee ID]) as int) + 2,
	'Maria Gabarron',
	'maria.gabarron@elastacloud.com',
	0,
	1
from 
	[Dimension].[Employee]
GO

