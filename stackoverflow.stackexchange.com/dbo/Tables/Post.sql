CREATE TABLE [dbo].[Post] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [PostTypeId]          TINYINT        NOT NULL,
    [CreatedDateUTC]      DATETIME2 (2)  CONSTRAINT [DF_Post_CreatedDateUTC] DEFAULT (getutcdate()) NOT NULL,
    [Score]               INT            CONSTRAINT [DF_Post_Score] DEFAULT ((0)) NOT NULL,
    [ViewCount]           INT            CONSTRAINT [DF_Post_ViewCount] DEFAULT ((0)) NOT NULL,
    [Body]                NVARCHAR (MAX) NOT NULL,
    [OwnerUserId]         INT            NOT NULL,
    [LastActivityDateUTC] DATETIME2 (2)  NOT NULL,
    [Title]               NVARCHAR (250) NULL,
    [Tags]                NVARCHAR (150) NULL,
    [AnswerCount]         INT            CONSTRAINT [DF_Post_AnswerCount] DEFAULT ((0)) NOT NULL,
    [CommentCount]        INT            CONSTRAINT [DF_Post_CommentCount] DEFAULT ((0)) NOT NULL,
    [FavouriteCount]      INT            CONSTRAINT [DF_Post_FavouriteCount] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Post_PostType] FOREIGN KEY ([PostTypeId]) REFERENCES [dbo].[PostType] ([Id]),
    CONSTRAINT [FK_Post_User] FOREIGN KEY ([OwnerUserId]) REFERENCES [dbo].[User] ([Id])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[Post] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Post, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the type of this Post, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'PostTypeId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this post was created, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'CreatedDateUTC'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The net score of this post, calculated as net upvotes minus net downvotes. Best used to order the Posts from most relevant to least relevant.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'Score'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The number of times this Post has been viewed aka web page views',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'ViewCount'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Content of the Post, as written by the user. Please note this content is not encoded, so be sure to encode your output.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'Body'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Short summary of the Post, as written by the user. Please note this content is not encoded, so be sure to encode your output.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'Title'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'A comma separated list of tags that have been added to this Post. This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'Tags'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of answers that have been given to this post, regardless of whether they have been accepted. This is a denormalised column. If the post is not an Answer type of post, this will be 0.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'AnswerCount'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of comments that have been asked of this particular post (not included comments to answers). This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'CommentCount'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of times this Post has been favourited by unique users. This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'FavouriteCount'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the User who made this Post, for machine use only. Only present if user has not been deleted. Always -1 for tag wiki entries, i.e. the community user owns them.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'OwnerUserId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time of the most recent activity on the Post, in UTC. For a question, this could be the post being edited, a new answer was posted, a bounty was started, etc/',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Post',
    @level2type = N'COLUMN',
    @level2name = N'LastActivityDateUTC'