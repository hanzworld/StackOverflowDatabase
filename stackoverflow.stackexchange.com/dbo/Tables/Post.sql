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

