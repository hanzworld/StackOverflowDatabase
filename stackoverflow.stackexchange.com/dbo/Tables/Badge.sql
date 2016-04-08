CREATE TABLE [dbo].[Badge] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [UserId]         INT           NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [CreatedDateUTC] DATETIME2 (2) CONSTRAINT [DF_Badge_CreatedDateUTC] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Badge] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Badge_ToTable] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[Badge] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Badge] TO [StackExchangeUser_Role]
    AS [dbo];

