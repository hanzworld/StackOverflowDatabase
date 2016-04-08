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


DECLARE @Snapshot TABLE (Id int, Value text)

INSERT INTO @Snapshot
VALUES
(1, 'Question'),
(2, 'Answer'),
(3, 'Wiki'),
(4, 'TagWikiExcerpt'),
(5, 'TagWiki'),
(6, 'ModeratorNomination'),
(7, 'WikiPlaceholder'),
(8, 'PrivilegeWiki'),
(9, 'SiteNotice')

INSERT INTO 
	PostType (Id, Name)
SELECT 
	s.Id, s.Value
FROM 
	@Snapshot s
	LEFT JOIN PostType pt on pt.Id = s.Id
WHERE 
	pt.Id IS NULl

UPDATE pt
SET
	pt.Id = s.Id,
	pt.Name = s.Value
FROM
	@Snapshot s
	INNER JOIN PostType pt on pt.Id = s.Id

DELETE pt
FROM	
	@Snapshot s
	RIGHT JOIN PostType pt on pt.Id = s.Id
WHERE
	s.Id IS NULL