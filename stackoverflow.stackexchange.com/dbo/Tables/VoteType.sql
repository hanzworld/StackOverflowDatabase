CREATE TABLE [dbo].[VoteType] (
    [Id]   TINYINT       NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_VoteType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[VoteType] TO [StackExchangeUser_Role]
    AS [dbo];

