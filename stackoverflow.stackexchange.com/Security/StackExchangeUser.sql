CREATE LOGIN [StackExchangeUser]
    WITH PASSWORD = N'St4ck3xchang3!7893', DEFAULT_LANGUAGE = [us_english], CHECK_EXPIRATION = ON;
	GO

CREATE USER [StackExchangeUser] FOR LOGIN [StackExchangeUser];
GO

GRANT CONNECT TO [StackExchangeUser];
GO

