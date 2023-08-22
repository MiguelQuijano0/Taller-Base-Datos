/* nivel 1 
Se desea tener una base de datos que almacene la información sobre los empleados de
una empresa, los departamentos en los que trabajan y los estudios de que disponen.
Guardaremos el historial laboral y salarial de todos los empleados. Para ello contamos
con las siguientes tablas:
*/
create database empresa;
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
Fecha_Nac date,
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
Empleado_DNI int primary key,
Salario int,
Fecha_Comienzo Date ,
Fecha_Fin Date,
)
ALTER TABLE  Historial_Salarial
ADD FOREIGN KEY (Empleado_DNI) REFERENCES Empleados(Empleado_DNI);

CREATE TABLE Departamentos (
DPTO_Cod int primary key,
Nombre_Dpto varchar (30) not null,
DPTO_Padre int,
Presupuesto int,
Pres_Actual int 
)

CREATE TABLE Estudios (
Empleado_DNI int primary key,
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
Salario_Min int,
Salario_Max int
)

Alter table Empleados
add Constraint chCargo CHECK ( Sexo = 'H' or Sexo = 'M')

