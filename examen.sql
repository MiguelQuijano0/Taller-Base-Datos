select COUNT(*)
from [Person].[Person];

select COUNT(EmailPromotion)
from [Person].[Person]
where EmailPromotion !=0;

select Sum(EmailPromotion)
from [Person].[Person]
where EmailPromotion !=0;

select Distinct (EmailPromotion)
from [Person].[Person];

select Distinct (EmailPromotion), COUNT (EmailPromotion)
from [Person].[Person]
Group by EmailPromotion;

select top(5) *
from [Person].[Person];

select top(5) NameStyle,LastName
from [Person].[Person];

select top(5) *
from [Person].[Person]
Order by BusinessEntityID Desc;

select top(5) *
from [Person].[Person]
Order by BusinessEntityID Desc;

select BusinessEntityID, sum (StandardPrice) as Ventastotal
from [Purchasing].[ProductVendor]
where BusinessEntityID=1578
group by BusinessEntityID;

select BusinessEntityID, sum (StandardPrice) as Ventastotal,
		ProductID
from [Purchasing].[ProductVendor]
where BusinessEntityID=1578
group by BusinessEntityID, ProductID;

select pv.BusinessEntityID, sum (pv.StandardPrice) as Ventastotal,
		pv.ProductID, p.Name, p.ProductNumber
from [Purchasing].[ProductVendor] as pv
inner join [Production].[Product] as p on  pv.ProductID = p.ProductID
where pv.BusinessEntityID=1578
group by pv.BusinessEntityID, p.ProductID, pv.ProductID, p.Name, p.ProductNumber;

select pv.BusinessEntityID, sum (pv.StandardPrice) as Ventastotal,
		pv.ProductID, p.Name, p.ProductNumber
from [Purchasing].[ProductVendor] as pv
inner join [Production].[Product] as p on  pv.ProductID = p.ProductID
where p.ProductNumber like 'CA%'
group by pv.BusinessEntityID, p.ProductID, pv.ProductID, p.Name, p.ProductNumber;

select pv.BusinessEntityID, sum (pv.StandardPrice) as Ventastotal,
		pv.ProductID, p.Name as producto, p.ProductNumber
from [Purchasing].[ProductVendor] as pv
inner join [Production].[Product] as p on  pv.ProductID = p.ProductID
where p.SellStartDate Between '01-01-2011 00:00:00' and '07-01-2011 00:00:00'
group by pv.BusinessEntityID, p.ProductID, pv.ProductID, p.Name, p.ProductNumber;

select pv.BusinessEntityID, v.name as vendedor, sum (pv.StandardPrice) as Ventastotal,
		p.Name as producto, p.ProductNumber, p.SellStartDate
from [Purchasing].[ProductVendor] as pv
inner join [Production].[Product] p on  pv.ProductID = p.ProductID
inner join [Purchasing].[Vendor] v on pv.BusinessEntityID = v.BusinessEntityID
where MONTH(p.SellStartDate) = 04
group by pv.BusinessEntityID, p.Name, p.Name, p.ProductNumber, p.SellStartDate,v.Name;

select pv.BusinessEntityID, v.name as vendedor, sum (pv.StandardPrice) as Ventastotal,
		p.Name as producto, p.ProductNumber, p.SellStartDate,
		CONCAT(v.AccountNumber,v.Name) as cuenta
from [Purchasing].[ProductVendor] as pv
inner join [Production].[Product] p on  pv.ProductID = p.ProductID
inner join [Purchasing].[Vendor] v on pv.BusinessEntityID = v.BusinessEntityID
where MONTH(p.SellStartDate) = 04
group by pv.BusinessEntityID, p.Name, p.Name, p.ProductNumber, p.SellStartDate,v.Name, v.AccountNumber;

select pv.BusinessEntityID, v.name as vendedor, sum (pv.StandardPrice) as Ventastotal,
		p.Name as producto, p.ProductNumber, p.SellStartDate,
		CONCAT(v.AccountNumber,' ','2023') as cuenta
from [Purchasing].[ProductVendor] as pv
inner join [Production].[Product] p on  pv.ProductID = p.ProductID
inner join [Purchasing].[Vendor] v on pv.BusinessEntityID = v.BusinessEntityID
where MONTH(p.SellStartDate) = 04
group by pv.BusinessEntityID, p.Name, p.Name, p.ProductNumber, p.SellStartDate,v.Name, CONCAT (v.AccountNumber,' ','2023');

select * from [Purchasing].[ProductVendor] where BusinessEntityID = 1492;
select * from [Purchasing].[ProductVendor] where BusinessEntityID = 1498;

update [Purchasing].[ProductVendor] set BusinessEntityID = 1498
where BusinessEntityID=1492;
select * from [Purchasing].[Vendor];

insert into [Purchasing].[Vendor]
values (1699,'QUMP280995','Miguel Quijano',2,1,1,'wwww.mike.com','');
select * from [Purchasing].[Vendor];

delete [Purchasing].[Vendor] where BusinessEntityID = 1699;

select * from [Production].[Document];

truncate table [Production].[ProductModel];
