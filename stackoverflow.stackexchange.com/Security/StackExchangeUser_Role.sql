CREATE ROLE StackExchangeUser_Role
    AUTHORIZATION [dbo];


GO
ALTER ROLE StackExchangeUser_Role ADD MEMBER [StackExchangeUser];

