CREATE TABLE [dbo].[Badge] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [UserId]         INT           NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [CreatedDateUTC] DATETIME2 (2) CONSTRAINT [DF_Badge_CreatedDateUTC] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Badge] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Badge_ToTable] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[Badge] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Badge] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Badge, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Badge',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the user to which the badge is awarded',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Badge',
    @level2type = N'COLUMN',
    @level2name = N'UserId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The freetext name of the badge, ideally not duplicated. This should be what is shown to users.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Badge',
    @level2type = N'COLUMN',
    @level2name = N'Name'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this badge was awarded to this user, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Badge',
    @level2type = N'COLUMN',
    @level2name = N'CreatedDateUTC'