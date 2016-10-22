CREATE TABLE [dbo].[PostHistoryType] (
    [Id]   TINYINT       NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PostHistoryType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[PostHistoryType] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the PostHistoryType, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistoryType',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The freetext name of the type of revision that can be made to a post, ideally not duplicated. This should be what is shown to users.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistoryType',
    @level2type = N'COLUMN',
    @level2name = N'Name'