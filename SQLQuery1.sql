INSERT INTO [catalogo].[licenciatura]
VALUES ('Gastronomia'),
		('Derecho'),
		('Turismo'),
		('contabilidad');
select * from [catalogo].[licenciatura];

INSERT INTO [catalogo].[tipoplan]
VALUES ('Cuatrimestre',900,3,3),
		('Semestre',1500,4,4),
		('Semestre',1500,4,4);

select * from [catalogo].[tipoplan];

INSERT INTO [docentes].[maestros]
VALUES ('Ariel','Wall-e','Rodriguez',3),
		('Julia','Rivero','koh',5),
		('Fredo','Godo','Fredo',4),
		('Joquin','Guzman','Loera',2),
		('Claudia','Molina','Pat',1);
select * from [docentes].[maestros];

insert into [catalogo].[materias]
values ('programacion',40,5,1,5),
		('Cocteleria',40,6,2,4),
		('Juicios',45,5,3,1),
		('viajes',50,7,4,3),
		('costo',40,5,5,2);
select * from [catalogo].[materias];

insert into [alumnos].[alumnos]
values ('miguel','Quijano','Pech','27',1,1),
		('Alex','jimenez','cacho','30',2,4),
		('Marco','Rodriguez','Hau','26',3,3),
		('Jeral','cen','castello','29',4,2),
		('Cristian','Arcos','Sanchez','21',3,3),
		('Julio','Garcia','Uribe','25',2,2),
		('Dylan','Escalante','Vela','22',5,5),
		('Luis','Chi','Gomez','24',4,5 );

select * from [alumnos].[alumnos];

insert into [alumnos].[contacto]
values (1,'mike@correo.com','9999999991','maria pech'),
	(2,'alex@correo.com','9999999992','wilma cacho'),
	(3,'marco@correo.com','9999999993','concepcion hau'),
	(4,'jeral@correo.com','9999999994','socotroco castello'),
	(5,'Dyalan@correo.com','9999999995','Gloria vela'),
	(6,'Julio@correo.com','9999999996','Rosario Uribe'),
	(7,'Cristian@correo.com','9999999997','Carmen sanchez'),
	(8,'Luis@correo.com','9999999998','Monse Gomez');
select * from [alumnos].[contacto];

/*Mostrar los alumos de gastronomia que tengan plan semestral*/

select d1.[cNombre],d1.[capellidopaterno],d1.[capelidomaterno],d2.[CNombrelicenciatura],d2.codigolicenciatura,d3.[cnombreplan]
from  [alumnos].[alumnos] d1 
inner join [catalogo].[licenciatura] d2 
on d1.[idlicenciatura]= d2.[codigolicenciatura]
inner join [catalogo].[tipoplan] d3
on d3.[licenciatura] = d2.[codigolicenciatura]
where d3.[licenciatura] = 2 and d3.[cnombreplan] like '%Semestre%';