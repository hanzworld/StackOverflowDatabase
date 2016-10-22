CREATE TABLE [dbo].[Comment] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [PostId]         INT            NOT NULL,
    [Score]          INT            CONSTRAINT [DF_Comment_Score] DEFAULT ((0)) NOT NULL,
    [Text]           NVARCHAR (600) NOT NULL,
    [CreatedDateUTC] DATETIME2 (2)  CONSTRAINT [DF_Comment_CreatedDateUTC] DEFAULT (getutcdate()) NOT NULL,
    [UserId]         INT            NOT NULL,
    CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Comment_Post] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id]),
    CONSTRAINT [FK_Comment_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Comment] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Comment] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Comment] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Comment, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Comment',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the Post to which this Comment pertains, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Comment',
    @level2type = N'COLUMN',
    @level2name = N'PostId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The net score of this comment, calculated as net upvotes minus net downvotes. Best used to order the Comments from most relevant to least relevant. Only populated if the score is > 0.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Comment',
    @level2type = N'COLUMN',
    @level2name = N'Score'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Content of the Comment, as written by the user. Please note this content is not encoded, so be sure to encode your output.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Comment',
    @level2type = N'COLUMN',
    @level2name = N'Text'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this badge was awarded to this user, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Comment',
    @level2type = N'COLUMN',
    @level2name = N'CreatedDateUTC'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the User who made this Comment, for machine use only. If the user has been deleted, this will be empty.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Comment',
    @level2type = N'COLUMN',
    @level2name = N'UserId'