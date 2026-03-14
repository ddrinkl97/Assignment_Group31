USE [LoginDatabase];
GO

SELECT DB_NAME() AS CurrentDatabase;
SELECT name FROM sys.tables;
GO

USE [LoginDatabase];
GO

CREATE TABLE dbo.UserTable (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    firstname NVARCHAR(50) NULL,
    lastname NVARCHAR(50) NULL,
    usertype NVARCHAR(20) NOT NULL,
    gender NVARCHAR(10) NULL,
    email NVARCHAR(100) NOT NULL
);
GO

CREATE UNIQUE INDEX IX_UserTable_Email ON dbo.UserTable(email);
GO

SELECT name FROM sys.tables;
GO