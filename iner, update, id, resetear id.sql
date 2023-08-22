select * from [dbo].[faltante]

inser into [dbo].[faltante]

delete  from [dbo].[faltante] where id = 149;

INSERT INTO [dbo].[faltante]
VALUES ('9999999999','calle 32 321 merida yucatan');

select * 
from [dbo].[datos] d1
inner join [dbo].[faltante] d2 on  d1.id = d2.id;

select * 
from [dbo].[datos] d1
left join [dbo].[faltante] d2 on  d1.id = d2.id;

select * 
from [dbo].[datos] d1
right join [dbo].[faltante] d2 on  d1.id = d2.id;

select 
d2.id, d1.nombre, d2.ctelefono, d1.[fecha de nacimiento], d2.cdireccion
from [dbo].[datos] d1
inner join [dbo].[faltante] d2 on  d1.id = d2.id;

update [dbo].[datos]
set telefono = d2.ctelefono, direccion=d2.cdireccion
from [dbo].[datos] d1
inner join [dbo].[faltante] d2 on  d1.id = d2.id;

select * from [dbo].[datos]
where telefono is not null;

select * from [dbo].[faltante];

delete from [dbo].[faltante] where id in (146,147,148,149,150);

insert into [dbo].[faltante]
values ('9999912345','calle 89 232 entre 34 centro');

delete from [dbo].[faltante] where id in (151);

/*mostrrar ultimo id*/
select IDENT_CURRENT ('[dbo].[faltante]');

/*resetear id*/

dbcc checkident('[dbo].[faltante]',RESEED,145);

INSERT INTO Estudiantes
VALUES ('Miguel','Quijano','27','mike@correo.com'),
		('Angel','Pech','20','Angel@coreo.com'),
		('Raul','Loria','21','Raul@coreo.com');

select * from Estudiantes;


update Estudiantes
set CorreoElectronico = 'mikeQuijano@coreo.com'
where ID= 1;

delete from Estudiantes where Edad = 21;

select IDENT_CURRENT ('[dbo].[Estudiantes]');
dbcc checkident('[dbo].[Estudiantes]',RESEED,0);