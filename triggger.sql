CREATE TRIGGER tr_LimitUserApp ON ALL SERVER
    FOR LOGON
    AS
         BEGIN
             DECLARE @app NVARCHAR(100);
             SET @app = APP_NAME();
             IF(@App LIKE 'SQL Server Management Studio')
                 BEGIN
                     RETURN;
					  BEGIN
					  IF((ORIGINAL_LOGIN() = 'tigre')
					  AND (DATEPART(Hour, GETDATE()) BETWEEN 06 AND 18))
					  ROLLBACK;
					  END;
             END;
                 ELSE
                 PRINT 'no estas conectado a ' + @app + 'Status:- Failed';
             ROLLBACK;
         END;