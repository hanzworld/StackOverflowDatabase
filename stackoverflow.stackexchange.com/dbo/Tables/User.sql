CREATE TABLE [dbo].[User] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Reputation]      INT            CONSTRAINT [DF_User_Reputation] DEFAULT ((0)) NOT NULL,
    [CreationDateUTC] DATETIME2 (2)  CONSTRAINT [DF_User_CreationDateUTC] DEFAULT (getutcdate()) NOT NULL,
    [DisplayName]     NVARCHAR (40)  NOT NULL,
    [LastAccessDate]  DATETIME2 (2)  NOT NULL,
    [WebsiteUrl]      NVARCHAR (200) NULL,
    [Location]        NVARCHAR (100) NULL,
    [AboutMe]         NVARCHAR (MAX) NULL,
    [Views]           INT            CONSTRAINT [DF_User_Views] DEFAULT ((0)) NOT NULL,
    [UpVotes]         INT            CONSTRAINT [DF_User_UpVotes] DEFAULT ((0)) NOT NULL,
    [DownVotes]       INT            CONSTRAINT [DF_User_DownVotes] DEFAULT ((0)) NOT NULL,
    [AccountId]       INT            NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[User] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[User] TO [StackExchangeUser_Role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[User] TO [StackExchangeUser_Role]
    AS [dbo];


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Unique identifier for the Comment, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The identifier of the StackExchange Network profile Id of the User, for machine use only',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'AccountId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this user account was created, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'CreationDateUTC'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of upvotes the user has cast across the site. This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'UpVotes'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of downvotes the user has cast across the site. This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'DownVotes'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of views this users profile has had by other users. This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'Views'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The total number of reputation points this User has. This is a denormalised column.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'Reputation'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The name to display for this User , as chosen by the user. Please note this content is not encoded, so be sure to encode your output.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'DisplayName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'An optional URI for a website the user can provide. Please note this content is not encoded, so be sure to encode your output. The safety of this URL is not guaranteed.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'WebsiteUrl'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'A free text location the user can specify. Please note this content is not encoded, so be sure to encode your output. The accuracy of the location information is not guaranteed.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'Location'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'An optional free text description of the user, their interests and public profile. Please note this content is not encoded, so be sure to encode your output.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'AboutMe'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'The date and time this user last accessed the site, in UTC',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'User',
    @level2type = N'COLUMN',
    @level2name = N'LastAccessDate'