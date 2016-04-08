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

