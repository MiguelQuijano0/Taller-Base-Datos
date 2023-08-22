create database PUB;
use PUB;

--C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER19\MSSQL\Backup\

CREATE TABLE pub (
    cod_pub VARCHAR(5) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    licencia_fiscal VARCHAR(60) NOT NULL,
    domicilio VARCHAR(60),
    fecha_apertura DATE NOT NULL,
    horario time  NOT NULL,
    cod_localidad INT NOT NULL 
	) ;
CREATE TABLE titular (
    dni_titular VARCHAR(8) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    domicilio VARCHAR(60),
    cod_pub VARCHAR(5) NOT NULL 
	) ;
CREATE TABLE empleado (
    dni_empleado VARCHAR(8) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    domicilio VARCHAR(60)
	) ;
CREATE TABLE existencias (
    cod_articulo VARCHAR(10)  NOT NULL,
    nombre VARCHAR(60)  NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL NOT NULL,
    cod_pub VARCHAR(5) NOT NULL 
	);
CREATE TABLE localidad (
    cod_localidad INT NOT NULL,
    nombre VARCHAR(60)  NOT NULL 
	);
CREATE TABLE pub_empleado (
    cod_pub VARCHAR(5)   NOT NULL,
    dni_empleado VARCHAR(8)   NOT NULL,
    funcion VARCHAR(9)   NOT NULL 
	);

ALTER TABLE pub ADD CONSTRAINT pk_pub
PRIMARY KEY (cod_pub) ;

ALTER TABLE localidad ADD CONSTRAINT pk_localidad
PRIMARY KEY (cod_localidad) ;

ALTER TABLE titular ADD CONSTRAINT pk_titular
PRIMARY KEY (dni_titular) ;

ALTER TABLE empleado ADD CONSTRAINT pk_empleado
PRIMARY KEY (dni_empleado) ;

ALTER TABLE existencias ADD CONSTRAINT pk_existencias
PRIMARY KEY (cod_articulo) ;

ALTER TABLE pub_empleado ADD CONSTRAINT pk_pub_empleado
PRIMARY KEY (cod_pub, dni_empleado, funcion) ;

ALTER TABLE pub ADD CONSTRAINT fk_pub_localidad
FOREIGN KEY (cod_localidad)
REFERENCES localidad (cod_localidad) ;

ALTER TABLE titular ADD CONSTRAINT fk_titular_pu
FOREIGN KEY (cod_pub)
REFERENCES pub (cod_pub) ;

ALTER TABLE existencias ADD CONSTRAINT fk_existencias_pub
FOREIGN KEY (cod_pub)
REFERENCES pub (cod_pub) ;

ALTER TABLE pub_empleado ADD CONSTRAINT fk_pubemple_pub
FOREIGN KEY (cod_pub)
REFERENCES pub(cod_pub) ;

ALTER TABLE pub_empleado ADD CONSTRAINT fk_pubemple_empleado
FOREIGN KEY (dni_empleado)
REFERENCES empleado (dni_empleado) ;

ALTER TABLE existencias ADD CONSTRAINT ck_precio
CHECK (precio <> 0) ;

ALTER TABLE pub_empleado ADD CONSTRAINT ck_funcion
CHECK (funcion IN ('CAMARERO', 'SEGURIDAD', 'LIMPIEZA')) ;

INSERT INTO [dbo].[pub]
Values ( 1 , 'Miguel', '123asd' , 'Centro','01-01-2008','12:12:12.1234567', 1 );
INSERT INTO [dbo].[pub]
Values ( 2 , 'angel', '123asd' , 'Centro','01-01-2008','12:12:12.1234567', 2 );
INSERT INTO [dbo].[pub]
Values ( 3 , 'luis', '123asd' , 'Centro','01-01-2008','12:12:12.1234567', 1 );
INSERT INTO [dbo].[pub]
Values ( 4 , 'Pedro', '123asd' , 'Centro','01-01-2008','12:12:12.1234567', 2 );
INSERT INTO [dbo].[pub]
Values ( 5 , 'Joel', '123asd' , 'Centro','01-01-2008','12:12:12.1234567', 1 );

INSERT INTO [dbo].[titular]
Values ( '123qas' , 'jorge', 'Centro', 1 );
INSERT INTO [dbo].[titular]
Values ( '1asds' , 'pepe', 'Centro', 2 );
INSERT INTO [dbo].[titular]
Values ( 'xas1s' , 'maria', 'Centro', 3 );


INSERT INTO [dbo].[existencias]
Values ( 'esc' , 'escoba', 10, 23.50,1);
INSERT INTO [dbo].[existencias]
Values ( 'clor' , 'Cloro', 10, 50.50,1);
INSERT INTO [dbo].[existencias]
Values ( 'marti' , 'martillo', 10, 100.50,1);





INSERT INTO [dbo].[localidad]
Values (1,'Colonia Mejico');
INSERT INTO [dbo].[localidad]
Values (2,'Prolongación Montjo');


INSERT INTO Empleado
Values ('asdasd','Yannelly Lopez Encalada' , '28 x 23 col. Salvador ote' );




Update Localidad Set nombre = 'Colonia Mexico'
where cod_localidad = 1;

Update Localidad Set nombre = 'Prolongación Montejo'
where cod_localidad = 2;


Delete  [dbo].[existencias] where cod_articulo= 'clor';



SELECT DATEADD(hh,-6,event_time) event_time,
       database_name as BD,
       server_instance_name as instancia,
       session_server_principal_name AS UserName,
       object_name,
          [statement] as script,
          action_id,
		  (CASE WHEN [action_id] = 'ACDO' THEN 'DATABASE_OBJECT_ACCESS_GROUP' WHEN [action_id] = 'ACO' THEN 'SCHEMA_OBJECT_ACCESS_GROUP' WHEN [action_id] = 'ADBO' THEN 'BULK ADMIN' WHEN [action_id] = 'ADDP' THEN 'DATABASE_ROLE_MEMBER_CHANGE_GROUP'
				 WHEN [action_id] = 'ADSP' THEN 'SERVER_ROLE_MEMBER_CHANGE_GROUP' WHEN [action_id] = 'AL' THEN 'ALTER' WHEN [action_id] = 'ALCN' THEN 'ALTER CONNECTION' WHEN [action_id] = 'ALRS' THEN 'ALTER RESOURCES'
				 WHEN [action_id] = 'ALSS' THEN 'ALTER SERVER STATE' WHEN [action_id] = 'ALST' THEN 'ALTER SETTINGS' WHEN [action_id] = 'ALTR' THEN 'ALTER TRACE' WHEN [action_id] = 'APRL' THEN 'ADD MEMBER'
				 WHEN [action_id] = 'AS' THEN 'ACCESS' WHEN [action_id] = 'AUSC' THEN 'AUDIT SESSION CHANGED' WHEN [action_id] = 'AUSF' THEN 'AUDIT SHUTDOWN ON FAILURE' WHEN [action_id] = 'AUTH' THEN 'AUTHENTICATE'
				 WHEN [action_id] = 'BA' THEN 'BACKUP' WHEN [action_id] = 'BAL' THEN 'BACKUP LOG' WHEN [action_id] = 'BRDB' THEN 'BACKUP_RESTORE_GROUP' WHEN [action_id] = 'C2OF' THEN 'TRACE AUDIT C2OFF'
				 WHEN [action_id] = 'C2ON' THEN 'TRACE AUDIT C2ON' WHEN [action_id] = 'CCLG' THEN 'CHANGE LOGIN CREDENTIAL' WHEN [action_id] = 'CMLG' THEN 'CREDENTIAL MAP TO LOGIN' WHEN [action_id] = 'CNAU' THEN 'AUDIT_CHANGE_GROUP'
				 WHEN [action_id] = 'CO' THEN 'CONNECT' WHEN [action_id] = 'CP' THEN 'CHECKPOINT' WHEN [action_id] = 'CR' THEN 'CREATE' WHEN [action_id] = 'D' THEN 'DENY'
				 WHEN [action_id] = 'DAGF' THEN 'FAILED_DATABASE_AUTHENTICATION_GROUP' WHEN [action_id] = 'DAGL' THEN 'DATABASE_LOGOUT_GROUP' WHEN [action_id] = 'DAGS' THEN 'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP' WHEN [action_id] = 'DBAF' THEN 'DATABASE AUTHENTICATION FAILED'
				 WHEN [action_id] = 'DBAS' THEN 'DATABASE AUTHENTICATION SUCCEEDED' WHEN [action_id] = 'DBCC' THEN 'DBCC' WHEN [action_id] = 'DBCG' THEN 'DBCC_GROUP' WHEN [action_id] = 'DBL' THEN 'DATABASE LOGOUT'
				 WHEN [action_id] = 'DL' THEN 'DELETE' WHEN [action_id] = 'DPRL' THEN 'DROP MEMBER' WHEN [action_id] = 'DR' THEN 'DROP' WHEN [action_id] = 'DWC' THEN 'DENY WITH CASCADE'
				 WHEN [action_id] = 'EX' THEN 'EXECUTE' WHEN [action_id] = 'FT' THEN 'FULLTEXT' WHEN [action_id] = 'FTG' THEN 'FULLTEXT_GROUP' WHEN [action_id] = 'G' THEN 'GRANT'
				 WHEN [action_id] = 'GRDB' THEN 'DATABASE_PERMISSION_CHANGE_GROUP' WHEN [action_id] = 'GRDO' THEN 'DATABASE_OBJECT_PERMISSION_CHANGE_GROUP' WHEN [action_id] = 'GRO' THEN 'SCHEMA_OBJECT_PERMISSION_CHANGE_GROUP' WHEN [action_id] = 'GRSO' THEN 'SERVER_OBJECT_PERMISSION_CHANGE_GROUP'
				 WHEN [action_id] = 'GRSV' THEN 'SERVER_PERMISSION_CHANGE_GROUP' WHEN [action_id] = 'GWG' THEN 'GRANT WITH GRANT' WHEN [action_id] = 'IMDP' THEN 'DATABASE_PRINCIPAL_IMPERSONATION_GROUP' WHEN [action_id] = 'IMP' THEN 'IMPERSONATE'
				 WHEN [action_id] = 'IMSP' THEN 'SERVER_PRINCIPAL_IMPERSONATION_GROUP' WHEN [action_id] = 'IN' THEN 'INSERT' WHEN [action_id] = 'LGB' THEN 'BROKER LOGIN' WHEN [action_id] = 'LGBG' THEN 'BROKER_LOGIN_GROUP'
				 WHEN [action_id] = 'LGDA' THEN 'DISABLE' WHEN [action_id] = 'LGDB' THEN 'CHANGE DEFAULT DATABASE' WHEN [action_id] = 'LGEA' THEN 'ENABLE' WHEN [action_id] = 'LGFL' THEN 'FAILED_LOGIN_GROUP'
				 WHEN [action_id] = 'LGIF' THEN 'LOGIN FAILED' WHEN [action_id] = 'LGIS' THEN 'LOGIN SUCCEEDED' WHEN [action_id] = 'LGLG' THEN 'CHANGE DEFAULT LANGUAGE' WHEN [action_id] = 'LGM' THEN 'DATABASE MIRRORING LOGIN'
				 WHEN [action_id] = 'LGMG' THEN 'DATABASE_MIRRORING_LOGIN_GROUP' WHEN [action_id] = 'LGNM' THEN 'NAME CHANGE' WHEN [action_id] = 'LGO' THEN 'LOGOUT' WHEN [action_id] = 'LGSD' THEN 'SUCCESSFUL_LOGIN_GROUP'
				 WHEN [action_id] = 'LO' THEN 'LOGOUT_GROUP' WHEN [action_id] = 'MNDB' THEN 'DATABASE_CHANGE_GROUP' WHEN [action_id] = 'MNDO' THEN 'DATABASE_OBJECT_CHANGE_GROUP' WHEN [action_id] = 'MNDP' THEN 'DATABASE_PRINCIPAL_CHANGE_GROUP'
				 WHEN [action_id] = 'MNO' THEN 'SCHEMA_OBJECT_CHANGE_GROUP' WHEN [action_id] = 'MNSO' THEN 'SERVER_OBJECT_CHANGE_GROUP' WHEN [action_id] = 'MNSP' THEN 'SERVER_PRINCIPAL_CHANGE_GROUP' WHEN [action_id] = 'NMLG' THEN 'NO CREDENTIAL MAP TO LOGIN'
				 WHEN [action_id] = 'OP' THEN 'OPEN' WHEN [action_id] = 'OPDB' THEN 'DATABASE_OPERATION_GROUP' WHEN [action_id] = 'OPSV' THEN 'SERVER_OPERATION_GROUP' WHEN [action_id] = 'PWAR' THEN 'APPLICATION_ROLE_CHANGE_PASSWORD_GROUP'
				 WHEN [action_id] = 'PWC' THEN 'CHANGE PASSWORD' WHEN [action_id] = 'PWCG' THEN 'LOGIN_CHANGE_PASSWORD_GROUP' WHEN [action_id] = 'PWCS' THEN 'CHANGE OWN PASSWORD' WHEN [action_id] = 'PWEX' THEN 'PASSWORD EXPIRATION'
				 WHEN [action_id] = 'PWMC' THEN 'MUST CHANGE PASSWORD' WHEN [action_id] = 'PWPL' THEN 'PASSWORD POLICY' WHEN [action_id] = 'PWR' THEN 'RESET PASSWORD' WHEN [action_id] = 'PWRS' THEN 'RESET OWN PASSWORD'
				 WHEN [action_id] = 'PWU' THEN 'UNLOCK ACCOUNT' WHEN [action_id] = 'R' THEN 'REVOKE' WHEN [action_id] = 'RC' THEN 'RECEIVE' WHEN [action_id] = 'RF' THEN 'REFERENCES'
				 WHEN [action_id] = 'RS' THEN 'RESTORE' WHEN [action_id] = 'RWC' THEN 'REVOKE WITH CASCADE' WHEN [action_id] = 'RWG' THEN 'REVOKE WITH GRANT' WHEN [action_id] = 'SL' THEN 'SELECT'
				 WHEN [action_id] = 'SN' THEN 'SEND' WHEN [action_id] = 'SPLN' THEN 'SHOW PLAN' WHEN [action_id] = 'STSV' THEN 'SERVER_STATE_CHANGE_GROUP' WHEN [action_id] = 'SUQN' THEN 'SUBSCRIBE QUERY NOTIFICATION'
				 WHEN [action_id] = 'SVCN' THEN 'SERVER CONTINUE' WHEN [action_id] = 'SVPD' THEN 'SERVER PAUSED' WHEN [action_id] = 'SVSD' THEN 'SERVER SHUTDOWN' WHEN [action_id] = 'SVSR' THEN 'SERVER STARTED'
				 WHEN [action_id] = 'TASA' THEN 'TRACE AUDIT START' WHEN [action_id] = 'TASP' THEN 'TRACE AUDIT STOP' WHEN [action_id] = 'TO' THEN 'TAKE OWNERSHIP' WHEN [action_id] = 'TODB' THEN 'DATABASE_OWNERSHIP_CHANGE_GROUP'
				 WHEN [action_id] = 'TODO' THEN 'DATABASE_OBJECT_OWNERSHIP_CHANGE_GROUP' WHEN [action_id] = 'TOO' THEN 'SCHEMA_OBJECT_OWNERSHIP_CHANGE_GROUP' WHEN [action_id] = 'TOSO' THEN 'SERVER_OBJECT_OWNERSHIP_CHANGE_GROUP' WHEN [action_id] = 'TRCG' THEN 'TRACE_CHANGE_GROUP'
				 WHEN [action_id] = 'TRO' THEN 'TRANSFER' WHEN [action_id] = 'UCGP' THEN 'USER_CHANGE_PASSWORD_GROUP' WHEN [action_id] = 'UDAG' THEN 'USER_DEFINED_AUDIT_GROUP' WHEN [action_id] = 'UDAU' THEN 'USER DEFINED AUDIT'
				 WHEN [action_id] = 'UP' THEN 'UPDATE' WHEN [action_id] = 'USAF' THEN 'CHANGE USERS LOGIN AUTO' WHEN [action_id] = 'USLG' THEN 'CHANGE USERS LOGIN' WHEN [action_id] = 'USTC' THEN 'COPY PASSWORD'
				 WHEN [action_id] = 'VDST' THEN 'VIEW DATABASE STATE' WHEN [action_id] = 'VSST' THEN 'VIEW SERVER STATE' WHEN [action_id] = 'VWCT' THEN 'VIEW CHANGETRACKING' WHEN [action_id] = 'VW' THEN 'VIEW' WHEN [action_id] = 'XA' THEN 'EXTERNAL ACCESS ASSEMBLY'
				 WHEN [action_id] = 'XU' THEN 'UNSAFE ASSEMBLY' 
			END) AS ActionName
FROM sys.fn_get_audit_file('C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\Backup\Auditorias\Audit-ordinario*', DEFAULT, DEFAULT)  -- svrw-bd-sql17
--FROM sys.fn_get_audit_file('E:\Auditoria_SQLServer\Auditoria_DDL_*', DEFAULT, DEFAULT)  -- svrw-bd-sql04

WHERE CONVERT(varchar,(DATEADD(hh,-6,event_time) ),112)>='20230726'
AND (database_name = 'PUB')
--[statement] like '%CREATE%'
--action_id='DR'
--and [statement] NOT IN  ('drop event')
--[statement] like '%CREATE%'
--and action_id='CR'
--and client_ip='172.16.4.94'
--and action_id='CR'
--and client_ip='172.16.4.94'
GROUP BY event_time, database_name,server_instance_name,session_server_principal_name,
object_name,[statement],action_id
ORDER BY 1 DESC,2,4,5