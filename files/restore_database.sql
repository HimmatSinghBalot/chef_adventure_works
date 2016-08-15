DECLARE @bakFile NVARCHAR(400),
        @mdfFile NVARCHAR(400),
        @ldfFile NVARCHAR(400)
set @bakFile =  'C:\Deploy\AdventureWorks2012-Full Database Backup.bak'
set @mdfFile = 'AdventureWorks2012_Data'
set @ldfFile = 'AdventureWorks2012_Log'

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'AdventureWorks')
	EXEC ('ALTER DATABASE AdventureWorks SET SINGLE_USER WITH ROLLBACK IMMEDIATE;');	

RESTORE DATABASE AdventureWorks
FROM DISK = @bakFile WITH 
MOVE 'AdventureWorks2012_Data'TO 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorks2012_Data.mdf',
MOVE 'AdventureWorks2012_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorks2012_Log.ldf'

ALTER DATABASE AdventureWorks SET MULTI_USER
GO