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

