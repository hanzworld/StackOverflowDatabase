CREATE TABLE [dbo].[PostHistory] (
    [Id]                INT              IDENTITY (1, 1) NOT NULL,
    [PostHistoryTypeId] TINYINT          NOT NULL,
    [PostId]            INT              NOT NULL,
    [RevisionGUID]      UNIQUEIDENTIFIER CONSTRAINT [DF_PostHistory_RevisionGUID] DEFAULT (newid()) NOT NULL,
    [CreatedDateUTC]    DATETIME2 (2)    CONSTRAINT [DF_PostHistory_CreatedDateUTC] DEFAULT (getutcdate()) NOT NULL,
    [UserId]            INT              NOT NULL,
    [Text]              NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_PostHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PostHistory_Post] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id]),
    CONSTRAINT [FK_PostHistory_PostHistoryType] FOREIGN KEY ([PostHistoryTypeId]) REFERENCES [dbo].[PostHistoryType] ([Id]),
    CONSTRAINT [FK_PostHistory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[PostHistory] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PostHistory] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for this revision of a Post, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistory',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the type of revision to which this revision of the Post pertains e.g. edit, closed etc, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistory',
    @level2type = N'COLUMN',
    @level2name = N'PostHistoryTypeId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the Post to which this revision pertains, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistory',
    @level2type = N'COLUMN',
    @level2name = N'PostId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the User who made this revision, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistory',
    @level2type = N'COLUMN',
    @level2name = N'UserId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this revision was done, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistory',
    @level2type = N'COLUMN',
    @level2name = N'CreatedDateUTC'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'At times more than one type of history record can be recorded by a single action. All of these will be grouped using the same RevisionGUID',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistory',
    @level2type = N'COLUMN',
    @level2name = N'RevisionGUID'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'A raw version of the new value for a given revision. Please note this content is not encoded, so be sure to encode your output.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostHistory',
    @level2type = N'COLUMN',
    @level2name = N'Text'