create database Empresa;
use empresa;

CREATE TABLE Empleados (
Empleado_DNI int primary key,
Nombre varchar(10) not null ,
Apellido1 varchar(15),
Apellido2 varchar(15) ,
Direcc1 varchar(25),
Direcc2 varchar(20),
Ciudad varchar(20),
Provincia varchar(20),
Cod_Postal varchar(5),
Sexo varchar(1),
Fecha_Nac date
)

CREATE TABLE Historial_Laboral (
Empleado_DNI int primary key,
Trabajo_Cod int,
Fecha_Inicio Date ,
Fecha_Fin Date,
DPTO_Cod int,
Supervisor_DNI int
)
ALTER TABLE  Historial_Laboral
ADD FOREIGN KEY (DPTO_Cod) REFERENCES Departamentos(DPTO_Cod);

ALTER TABLE  Historial_Laboral
ADD FOREIGN KEY (Empleado_DNI) REFERENCES Empleados(Empleado_DNI);

CREATE TABLE Historial_Salarial (
Empleado_DNI int,
Salario int not null,
Fecha_Comienzo Date ,
Fecha_Fin Date,
)
ALTER TABLE  Historial_Salarial
ADD FOREIGN KEY (Empleado_DNI) REFERENCES Empleados(Empleado_DNI);

CREATE TABLE Departamentos (
DPTO_Cod int primary key,
Nombre_Dpto varchar (30) not null,
DPTO_Padre int,
Presupuesto int not null,
Pres_Actual int 
)

CREATE TABLE Estudios (
Empleado_DNI int,
Universidad int,
Año int,
Grado varchar(3),
Especialidad VArchar(20)
)
ALTER TABLE  Estudios
ADD FOREIGN KEY (Empleado_DNI) REFERENCES Empleados(Empleado_DNI);
ALTER TABLE  Estudios
ADD FOREIGN KEY (Universidad) REFERENCES Universidades(Univ_Cod);

CREATE TABLE Universidades (
Univ_Cod int primary key,
Nombre_Univ varchar(25) not null,
Ciudad Varchar(20),
Municipio Varchar(2),
Cod_Postal varchar(5)
)


CREATE TABLE Trabajos(
Trabajo_Cod int primary key,
Nombre_Trab varchar(20) not null,
Salario_Min int not null,
Salario_Max int not null,
)

/*Nivel 2*/

Alter table Empleados
add Constraint chCargo CHECK ( Sexo = 'H' or Sexo = 'M')

ALTER TABLE departamentos ADD CONSTRAINT uk_nombre_dpto UNIQUE (nombre_dpto) ;
ALTER TABLE trabajos ADD CONSTRAINT uk_nombre_trab UNIQUE (Nombre_Trab);

ALTER TABLE historial_salarial ADD CONSTRAINT pk_historial_salarial PRIMARY KEY (Empleado_DNI, Salario, Fecha_comienzo) ;
ALTER TABLE historial_laboral ADD CONSTRAINT pk_historial_laboral PRIMARY KEY (empleado_dni, trabajo_cod, fecha_inicio) ;


/* nivel 3*/

insert into [dbo].[Empleados]
values ('1','miguel','quijano','pech','centro','23','merida','yucatan','97000','H');

INSERT INTO empleados (Empleado_DNI,Nombre, apellido1, apellido2,Sexo )VALUES ('111222','Sergio', 'Palma', 'Entrena', '111222', 'P') ;
INSERT INTO empleados (nombre, apellido1, apellido2, dni, sexo)VALUES ('Lucia', 'Ortega', 'Plus', '222333', NULL) ;

INSERT INTO historial_laboral (empleado_dni,Trabajo_Cod,fecha_inicio,fecha_fin,dpto_cod,supervisor_dni )VALUES ('111222',NULL,'6­JUN­1996',NULL,NULL,'222333') ;

/*nivel 4*/

/*Se produciría un error por violación de la clave definida sobre la tabla
historial_laboral que afecta al campo supervisor_dni que referencia al campo dni de la tabla empleados.*/

/* Borra una universidad de la tabla de UNIVERSIDADES ¿Qué le sucede a la restricción de
clave foránea de la tabla ESTUDIOS? No se podrán borrar aquellas Universidades cuyo código esté presente en latabla Estudios por existir una restricciónde clave ajena desde dicha tabla hacia la tabla Universidades. Es decir, no pueden borrarse registrospadres mientras existan registros dependientes.*/