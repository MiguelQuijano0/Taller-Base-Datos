CREATE TRIGGER trAcceso 
ON ALL SERVER
    FOR LOGON
    AS
         BEGIN
		 IF ORIGINAL_LOGIN()='tigre'
		 Begin
		 if APP_NAME() like '%mana%Studio%'
		  begin RollBack;
		  Raiserror ('Error en la conexion',16,1)
		  return;
		  end
		  end
		  end