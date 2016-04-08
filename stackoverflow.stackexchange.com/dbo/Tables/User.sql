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

