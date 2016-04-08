CREATE TABLE [dbo].[PostType] (
    [Id]   TINYINT       NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PostType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[PostType] TO [StackExchangeUser_Role]
    AS [dbo];

