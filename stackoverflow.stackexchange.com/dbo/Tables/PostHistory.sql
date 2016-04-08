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

