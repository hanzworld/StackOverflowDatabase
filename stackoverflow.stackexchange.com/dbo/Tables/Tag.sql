CREATE TABLE [dbo].[Tag] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [TagName]       NVARCHAR (25) NOT NULL,
    [Count]         INT           CONSTRAINT [DF_Tag_Count] DEFAULT ((0)) NOT NULL,
    [ExcerptPostId] INT           NOT NULL,
    [WikiPostId]    INT           NOT NULL,
    CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Tag_ExcerptPost] FOREIGN KEY ([ExcerptPostId]) REFERENCES [dbo].[Post] ([Id]),
    CONSTRAINT [FK_Tag_WikiPost] FOREIGN KEY ([WikiPostId]) REFERENCES [dbo].[Post] ([Id])
);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tag] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tag] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tag] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Tag, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Tag',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the Post to which this tag links, for machine use only. This should refer to a Post of type TagWikiExcerpt',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Tag',
    @level2type = N'COLUMN',
    @level2name = N'ExcerptPostId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the Post to which this Comment pertains, for machine use only. This should refer to a Post of type TagWiki',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Tag',
    @level2type = N'COLUMN',
    @level2name = N'WikiPostId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The freetext name of the tag, ideally not duplicated. This should be what is shown to users. Please note this content is not encoded, so sure to encode your output.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Tag',
    @level2type = N'COLUMN',
    @level2name = N'TagName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of times this tag has been used across the site. This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Tag',
    @level2type = N'COLUMN',
    @level2name = N'Count'