CREATE TABLE [dbo].[Vote] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [PostId]          INT           NOT NULL,
    [VoteTypeId]      TINYINT       NOT NULL,
    [CreationDateUTC] DATETIME2 (2) CONSTRAINT [DF_Vote_CreationDateUTC] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Vote_Post] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id]),
    CONSTRAINT [FK_Vote_VoteType] FOREIGN KEY ([VoteTypeId]) REFERENCES [dbo].[VoteType] ([Id])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[Vote] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Vote] TO [StackExchangeUser_Role]
    AS [dbo];

