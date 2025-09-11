USE master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Manu')
BEGIN
    ALTER DATABASE Manu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Manu;
END;
GO

create database Manu
GO

use Manu
GO

IF OBJECT_ID('[dbo].[UserSystem]', 'U') IS NOT NULL DROP TABLE [dbo].[UserSystem];
IF OBJECT_ID('[dbo].[Country]', 'U') IS NOT NULL DROP TABLE [dbo].[Country];
IF OBJECT_ID('[dbo].[StateProvince]', 'U') IS NOT NULL DROP TABLE [dbo].[StateProvince];
IF OBJECT_ID('[dbo].[City]', 'U') IS NOT NULL DROP TABLE [dbo].[City];
IF OBJECT_ID('[dbo].[Address]', 'U') IS NOT NULL DROP TABLE [dbo].[Address];
IF OBJECT_ID('[dbo].[AddressType]', 'U') IS NOT NULL DROP TABLE [dbo].[AddressType];
IF OBJECT_ID('[dbo].[Account]', 'U') IS NOT NULL DROP TABLE [dbo].[Account];
IF OBJECT_ID('[dbo].[AccountAddress]', 'U') IS NOT NULL DROP TABLE [dbo].[AccountAddress];


Create table [dbo].[UserSystem](
	UserSystemId INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email VARCHAR(255) UNIQUE NOT NULL,
	Phone VARCHAR(15) UNIQUE NOT NULL,
	PasswordHash NVARCHAR(255) NOT NULL,
	PasswordResetToken VARCHAR(6) NULL,
	PasswordResetTokenExpiration DATETIME NULL,
	CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
	UpdatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE [dbo].[Country](
    CountryId INT PRIMARY KEY IDENTITY(1,1),
    CountryName NVARCHAR(100) NOT NULL UNIQUE,
    CountryCode VARCHAR(10) NOT NULL UNIQUE,
    Remarks NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[StateProvince](
    StateProvinceId INT PRIMARY KEY IDENTITY(1,1),
    CountryId INT NOT NULL,
    StateProvinceName NVARCHAR(100) NOT NULL,
    StateProvinceCode NVARCHAR(20) NULL,
    Remarks NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1,
    CONSTRAINT FK_StateProvince_Country FOREIGN KEY (CountryId) REFERENCES [dbo].[Country](CountryId),
    CONSTRAINT UK_StateProvince UNIQUE (CountryId, StateProvinceName)
);
GO

CREATE TABLE [dbo].[City](
    CityId INT PRIMARY KEY IDENTITY(1,1),
    StateProvinceId INT NULL,
    CountryId INT NOT NULL,
    CityName NVARCHAR(100) NOT NULL,
    CityCode NVARCHAR(20) NULL,
    Remarks NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1,
    CONSTRAINT FK_City_StateProvince FOREIGN KEY (StateProvinceId) REFERENCES [dbo].[StateProvince](StateProvinceId),
    CONSTRAINT FK_City_Country FOREIGN KEY (CountryId) REFERENCES [dbo].[Country](CountryId),
    CONSTRAINT UK_City UNIQUE (CountryId, StateProvinceId, CityName)
);
GO

CREATE TABLE [dbo].[Address](
    AddressID INT PRIMARY KEY IDENTITY(1,1),
    AddressName NVARCHAR(255),
    Street NVARCHAR(255) NOT NULL,
    CityId INT NOT NULL,
    StateProvinceId INT NULL,
    CountryId INT NOT NULL,
    PostalCode NVARCHAR(20) NOT NULL,
    Remarks NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1,
    CONSTRAINT FK_Address_City FOREIGN KEY (CityId) REFERENCES [dbo].[City](CityId),
    CONSTRAINT FK_Address_StateProvince FOREIGN KEY (StateProvinceId) REFERENCES [dbo].[StateProvince](StateProvinceId),
    CONSTRAINT FK_Address_Country FOREIGN KEY (CountryId) REFERENCES [dbo].[Country](CountryId)
);
GO

CREATE TABLE [dbo].[AddressType](
    AddressTypeId INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(50) NOT NULL UNIQUE,
    AddressTypeDescription NVARCHAR(255) NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[Account](
	AccountID INT PRIMARY KEY IDENTITY(1,1),
    AccountName NVARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(50) UNIQUE,
    Fax VARCHAR(50) UNIQUE,
    CompanyName NVARCHAR(255) NULL,
    Website VARCHAR(255) NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1
);
GO


CREATE TABLE [dbo].[AccountAddress](
    AccountAddressId INT PRIMARY KEY IDENTITY(1,1),
    AccountId INT NOT NULL,
    AddressId INT NOT NULL,
    AddressTypeId INT NULL,
    IsDefault BIT DEFAULT 0, 
    Remarks NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1,
    CONSTRAINT FK_AccountAddress_Account FOREIGN KEY (AccountId) REFERENCES [dbo].[Account](AccountId),
    CONSTRAINT FK_AccountAddress_Address FOREIGN KEY (AddressId) REFERENCES [dbo].[Address](AddressId),
    CONSTRAINT FK_AccountAddress_AddressType FOREIGN KEY (AddressTypeId) REFERENCES [dbo].[AddressType](AddressTypeId),
	CONSTRAINT UK_AccountAddress UNIQUE (AccountId, AddressId, AddressTypeId),
    CONSTRAINT UK_AccountAddress_Default UNIQUE (AccountId, AddressTypeId, IsDefault)
);
GO

