USE master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Inflow')
BEGIN
    ALTER DATABASE Inflow SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Inflow;
END;
GO

create database Inflow
GO

use Inflow
GO

IF OBJECT_ID('[dbo].[Account]', 'U') IS NOT NULL DROP TABLE [dbo].[Account];
IF OBJECT_ID('[dbo].[ConfigGroup]', 'U') IS NOT NULL DROP TABLE [dbo].[ConfigGroup];
IF OBJECT_ID('[dbo].[ConfigKey]', 'U') IS NOT NULL DROP TABLE [dbo].[ConfigKey];
IF OBJECT_ID('[dbo].[Address]', 'U') IS NOT NULL DROP TABLE [dbo].[Address];
IF OBJECT_ID('[dbo].[Entity]', 'U') IS NOT NULL DROP TABLE [dbo].[Entity];


Create table [dbo].[Account](
	UserId INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) UNIQUE NOT NULL,
	Phone VARCHAR(15) UNIQUE NOT NULL,
	PasswordHash NVARCHAR(255) NOT NULL,
	ResetCode VARCHAR(6),
	CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
	UpdatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE [dbo].[ConfigGroup](
	ConfigGroupID INT PRIMARY KEY IDENTITY(1,1),
	ConfigGroupName VARCHAR(50) NOT NULL UNIQUE,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[ConfigKey](
	ConfigKeyID INT PRIMARY KEY IDENTITY(1,1),
	KeyName VARCHAR(50) NOT NULL,
	KeyValue VARCHAR(50) NOT NULL,
	ConfigGroupID INT REFERENCES ConfigGroup(ConfigGroupID),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[Address](
	AddressID INT PRIMARY KEY IDENTITY(1,1),
	PreSavedName NVARCHAR(255),
	Street NVARCHAR(255) NOT NULL,     
	City NVARCHAR(100) NOT NULL,           
	StateProvince NVARCHAR(100),      
	Country NVARCHAR(100) NOT NULL,        
	ZipPostalCode NVARCHAR(20) NOT NULL,
	AddressTypeID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	Remarks NVARCHAR(MAX), 
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[Entity](
	ObjectID INT PRIMARY KEY IDENTITY(1,1),
	ObjectName NVARCHAR(255) NOT NULL,
	Phone VARCHAR(20),
	Email VARCHAR(255) UNIQUE,
	BillingAddressID INT NOT NULL REFERENCES Address(AddressID),
	ShippingAddressID INT NOT NULL REFERENCES Address(AddressID),
	CustomerTypeID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	ObjectTypeID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	TotalSpend DECIMAL(18,2) DEFAULT 0,
	LastOrderDate DATETIME,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO