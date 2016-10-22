CREATE TABLE [dbo].[VoteType] (
    [Id]   TINYINT       NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_VoteType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[VoteType] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Vote Type, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'VoteType',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The freetext name of the type of Vote that can be made on a Post, ideally not duplicated. This should be what is shown to users.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'VoteType',
    @level2type = N'COLUMN',
    @level2name = N'Name'