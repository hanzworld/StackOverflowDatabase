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


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Vote, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Vote',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the Post to which this Vote pertains, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Vote',
    @level2type = N'COLUMN',
    @level2name = N'PostId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the type of Vote made on this Post, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Vote',
    @level2type = N'COLUMN',
    @level2name = N'VoteTypeId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this vote was made by the user, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Vote',
    @level2type = N'COLUMN',
    @level2name = N'CreationDateUTC'