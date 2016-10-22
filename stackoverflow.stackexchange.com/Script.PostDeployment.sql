/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


IF (LOWER('$(Environment)') = 'test')
BEGIN
	IF NOT EXISTS(SELECT name FROM sys.server_principals WHERE name = 'AutomatedTestLogin')
	BEGIN
		CREATE LOGIN AutomatedTestLogin WITH PASSWORD = 'MyAutomatedPassword'
	END

	IF NOT EXISTS(SELECT name FROM sys.database_principals WHERE name = 'AutomatedTestUser')
	BEGIN
		CREATE USER AutomatedTestUser FOR LOGIN AutomatedTestLogin
	END

END