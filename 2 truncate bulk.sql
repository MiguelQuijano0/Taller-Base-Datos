select * from [dbo].[faltante];

truncate table [dbo].[faltante];

bulk 
insert  [dbo].[faltante]
from 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\Backup\RegistrosDirTelSQL.txt'
with
(fieldterminator = '\t', --separa campos
rowterminator= '\n'); --separa filas
go

select * from [dbo].[usuario];
