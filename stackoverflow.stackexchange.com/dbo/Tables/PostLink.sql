CREATE TABLE [dbo].[PostLink] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [CreatedDateUTC] DATETIME2 (2) CONSTRAINT [DF_PostLink_CreatedDateUTC] DEFAULT (getutcdate()) NOT NULL,
    [PostId]         INT           NOT NULL,
    [RelatedPostId]  INT           NOT NULL,
    [LinkTypeId]     TINYINT       NOT NULL,
    CONSTRAINT [PK_PostLink] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PostLink_Post] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id]),
    CONSTRAINT [FK_PostLink_RelatedPost] FOREIGN KEY ([RelatedPostId]) REFERENCES [dbo].[Post] ([Id])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[PostLink] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PostLink] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[PostLink] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Post Link, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostLink',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the Post to which this Link has been added, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostLink',
    @level2type = N'COLUMN',
    @level2name = N'PostId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the Post to which this link pertains or references, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostLink',
    @level2type = N'COLUMN',
    @level2name = N'RelatedPostId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the type of link, for machine use only. Possible options are 1- Linked or 2 - Duplicate.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostLink',
    @level2type = N'COLUMN',
    @level2name = N'LinkTypeId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this link was added to the given post, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PostLink',
    @level2type = N'COLUMN',
    @level2name = N'CreatedDateUTC'