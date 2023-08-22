create trigger trinseremp2
on Orders
for insert 
as 
insert into [Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
select max(OrderID),10,21,5,0.5
from orders

select * from [dbo].[Orders]
select * from Territories

INSERT INTO Orders (CustomerID,EmployeeID)
VALUES ('QUEEN',8)

/* CONSTRAINT */

create table city(
idCity int not null,
NameCity Varchar(20),
Regionid int not null
CONSTRAINT uccity
unique(Namecity));

ALTER TABLE Territories
ADD CONSTRAINT DCDescripcion
default 'felipe carrillo puerto'
for TerritoryDescription;

alter table Employees with not check
add constraint chcTitlecourtesy
check (TitleOfCourtesy in ('Srta','Sra','Sr'));

select * from Employees
