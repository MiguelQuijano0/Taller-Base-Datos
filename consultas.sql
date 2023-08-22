--DML--
--¿cuantos cientes hay registrados?--
select COUNT(*)
from [dbo].[Customers];

--¿cuantos pedidos?
select COUNT(*)
from [dbo].[Orders]

--que clientes viven en londres y su nombre comience con la inicial de tu nombre
select [ContactName]
from [dbo].[Customers]
WHERE
CITY = 'London' and [ContactName] like 'A%';

--cuantos clientes hay que son de londres

select COUNT(*) from [dbo].[Customers]
where city = 'London';

--cuantos empleados nacierion despues de 1 de junio
select COUNT(*) from [dbo].[Employees]
where [BirthDate] Between '01-06-1960 00:00:00' and '7-17-2023 00:00:00';

select COUNT(*) from [dbo].[Employees]
where [BirthDate] > '01-06-1960 00:00:00';

--dml
--devuelve el nombre completo de los clientes con los pedidos 10360,10253,10440

select [ContactName] from [dbo].[Customers] d1
inner join [dbo].[Orders] d2 on d2.CustomerID = d1.[CustomerID]
where [OrderID] in (10360,10253,10440);

--devuelve las ciudades y numeros de pedidos de clientes por ciudad

select [ShipCity], COUNT([OrderID]) as pedidos from [dbo].[Orders]
group by [ShipCity];

-- cuales son los paises desde los que hay mas pedidos
select top(3)[ShipCity], COUNT([OrderID]) as pedidos from [dbo].[Orders]
group by [ShipCity] order by pedidos desc;

--genera un informe con el nombre de empleados y numero de pedidos que registraron

select d2.[EmployeeID], count[OrderID])numeropedidos,
CONCAT([LastName],' ',[FirstName]) as empleado
from [dbo].[Employees] d1
inner join [dbo].[Orders] d2 on d1.EmployeeID=d2.EmployeeID
group by CONCAT([LastName],' ',[FirstName]),d2.EmployeeID;

--del informe anterior solo necesito los empleados cuyo nombre comience con la inicial de tu nombre

select d2.[EmployeeID], sum([OrderID])numeropedidos,
CONCAT([LastName],' ',[FirstName]) as Empleado
from [dbo].[Employees] d1
inner join [dbo].[Orders] d2 on d1.EmployeeID=d2.EmployeeID
where FirstName like 'M%'
group by CONCAT([LastName],' ',[FirstName]),d2.EmployeeID;

--quiero saber los clientes que hayan hecho mas de un pedido y que hayan sido registrdos por un empleado cuyo nombre sea margaret
select * from [dbo].[Orders];
select * from [dbo].[Employees];


select [CustomerID] ,COUNT([OrderID]) as numpedidos
from [dbo].[Orders] 
where [EmployeeID] = 4
group by [CustomerID] order by numpedidos asc;
having count([OrderID])>1;

--dml
--inserta en custumers la compañia felipe carrillo puerto con tu nombre y apellido como contacto

---inserta la compañia felipe carrillo puerto
INSERT customers(customerid, companyname, contactname) 
VALUES ('CUFCP', 'Felipe carrillo puerto','Miguel Quijano')

--modifica address y pon tu email
update [dbo].[Customers]
set [Address] = 'MiGuelQuijano@Correo.com'
where [CustomerID] = 'CUFCP';

select * from [dbo].[Customers]
--elimina el customer con id =20

delete [dbo].[Customers]
where [CustomerID] = 20

-- cambia el valor de discontinued a 1 para los productos que prteexcan al cetegoriid 4 y supplierid 15

update [dbo].[Products] set [Discontinued] = 1
where [CategoryID]=4 and [SupplierID]=15;

-- vacia la tabla territories

ALTER TABLE [dbo].[Territories] DROP CONSTRAINT [FK_Territories_Region]
GO
ALTER TABLE [dbo].[EmployeeTerritories] DROP CONSTRAINT [FK_EmployeeTerritories_Territories]
GO
truncate table [dbo].[Territories]  ;

--agrega el campo barcode a la tabla products
alter table [dbo].[Products] ADD BarCode VARCHAR(20) NULL;

--elimina la tabla CustomerCustomerDemo
DROP TABLE [dbo].[CustomerCustomerDemo];
GO


--elimina extension de la tabla employees

ALTER TABLE [dbo].[Employees] DROP COLUMN [Extension]


--elimina la tabla region


ALTER TABLE [dbo].[Territories] DROP CONSTRAINT [FK_Territories_Region]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type in (N'U'))
DROP TABLE [dbo].[Region]
GO


