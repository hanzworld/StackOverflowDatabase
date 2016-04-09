CREATE TABLE [dbo].[Comment] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [PostId]         INT            NOT NULL,
    [Score]          INT            CONSTRAINT [DF_Comment_Score] DEFAULT ((0)) NOT NULL,
    [Text]           NVARCHAR (600) NOT NULL,
    [CreatedDateUTC] DATETIME2 (2)  CONSTRAINT [DF_Comment_CreatedDateUTC] DEFAULT (getutcdate()) NOT NULL,
    [UserId]         INT            NOT NULL,
    [DeletedDateUTC] DATETIME2(2) NULL, 
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

