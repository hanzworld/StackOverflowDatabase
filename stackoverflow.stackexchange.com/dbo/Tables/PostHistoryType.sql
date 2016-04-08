CREATE TABLE [dbo].[PostHistoryType] (
    [Id]   TINYINT       NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PostHistoryType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[PostHistoryType] TO [StackExchangeUser_Role]
    AS [dbo];

