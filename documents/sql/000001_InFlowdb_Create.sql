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
IF OBJECT_ID('[dbo].[ProductCategory]', 'U') IS NOT NULL DROP TABLE [dbo].[ProductCategory];
IF OBJECT_ID('[dbo].[MeasureUnit]', 'U') IS NOT NULL DROP TABLE [dbo].[MeasureUnit];
IF OBJECT_ID('[dbo].[CustomField]', 'U') IS NOT NULL DROP TABLE [dbo].[CustomField];
IF OBJECT_ID('[dbo].[CustomFieldOption]', 'U') IS NOT NULL DROP TABLE [dbo].[CustomFieldOption];
IF OBJECT_ID('[dbo].[CustomFieldValue]', 'U') IS NOT NULL DROP TABLE [dbo].[CustomFieldValue];
IF OBJECT_ID('[dbo].[ProductUOMConversion]', 'U') IS NOT NULL DROP TABLE [dbo].[ProductUOMConversion];
IF OBJECT_ID('[dbo].[ProductPrice]', 'U') IS NOT NULL DROP TABLE [dbo].[ProductPrice];
IF OBJECT_ID('[dbo].[Products]', 'U') IS NOT NULL DROP TABLE [dbo].[Products];
IF OBJECT_ID('[dbo].[StockLocation]', 'U') IS NOT NULL DROP TABLE [dbo].[StockLocation];
IF OBJECT_ID('[dbo].[ProductInventory]', 'U') IS NOT NULL DROP TABLE [dbo].[ProductInventory];
IF OBJECT_ID('[dbo].[Currency]', 'U') IS NOT NULL DROP TABLE [dbo].[Currency];
IF OBJECT_ID('[dbo].[PaymentTerm]', 'U') IS NOT NULL DROP TABLE [dbo].[PaymentTerm];
IF OBJECT_ID('[dbo].[TaxingScheme]', 'U') IS NOT NULL DROP TABLE [dbo].[TaxingScheme];
IF OBJECT_ID('[dbo].[TaxCode]', 'U') IS NOT NULL DROP TABLE [dbo].[TaxCode];
IF OBJECT_ID('[dbo].[SaleOrder]', 'U') IS NOT NULL DROP TABLE [dbo].[SaleOrder];
IF OBJECT_ID('[dbo].[SaleOrderItem]', 'U') IS NOT NULL DROP TABLE [dbo].[SaleOrderItem];
IF OBJECT_ID('[dbo].[SaleOrderPick]', 'U') IS NOT NULL DROP TABLE [dbo].[SaleOrderPick]
IF OBJECT_ID('[dbo].[SaleOrderPickItem]', 'U') IS NOT NULL DROP TABLE [dbo].[SaleOrderPickItem];
IF OBJECT_ID('[dbo].[SaleOrderShip]', 'U') IS NOT NULL DROP TABLE [dbo].[SaleOrderShip];
IF OBJECT_ID('[dbo].[SaleOrderShipItem]', 'U') IS NOT NULL DROP TABLE [dbo].[SaleOrderShipItem];
IF OBJECT_ID('[dbo].[CustomEntityType]', 'U') IS NOT NULL DROP TABLE [dbo].[CustomEntityType];


Create table [dbo].[Account](
	UserId INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
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
	AddressName NVARCHAR(255),
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
    Email VARCHAR(50) UNIQUE,
    Fax VARCHAR(50) UNIQUE,
    BillingAddressID INT NOT NULL REFERENCES Address(AddressID),
    ShippingAddressID INT NOT NULL REFERENCES Address(AddressID),
    CustomerTypeID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
    ObjectTypeID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
    LastOrderDate DATETIME,
    CompanyName NVARCHAR(255) NULL,
    Website NVARCHAR(255) NULL,	
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    CreatedBy INT NOT NULL,
    UpdatedBy INT NOT NULL,
    IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[ProductCategory](
	ProductCategoryID INT PRIMARY KEY IDENTITY(1,1),
	ProductCategoryName NVARCHAR(100) NOT NULL,
	ParentCategoryId INT NULL REFERENCES ProductCategory(ProductCategoryID),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[MeasureUnit](
	MeasureUnitID INT PRIMARY KEY IDENTITY (1,1),     
	MeasureUnitName NVARCHAR(100) NOT NULL,  
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[CustomEntityType](
	CustomEntityTypeID INT PRIMARY KEY IDENTITY(1,1),
	EntityTypeName NVARCHAR(100) NOT NULL UNIQUE,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[CustomField](
	CustomFieldID INT PRIMARY KEY IDENTITY(1,1),
	FieldName NVARCHAR(100) NOT NULL,
	AliasName NVARCHAR(255) NOT NULL,
	DataType NVARCHAR(255) NOT NULL, 
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[CustomFieldOption](
	OptionID INT PRIMARY KEY IDENTITY(1,1),
	CustomFieldID INT NOT NULL REFERENCES CustomField(CustomFieldID),
	DropdownValue NVARCHAR(255) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[Products](
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductCategoryID INT REFERENCES ProductCategory(ProductCategoryID),
	MeasureUnitID INT REFERENCES MeasureUnit(MeasureUnitID),
	ProductTypeID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	ProductName NVARCHAR(255) NOT NULL,               
	Barcode VARCHAR(50) UNIQUE,                   
	ProductImg NVARCHAR(MAX),              
	ProductDescription NVARCHAR(MAX),                    
	AvailableStock INT NOT NULL DEFAULT 0,
	UnitCost DECIMAL(18,2) NOT NULL,
	ProductLength DECIMAL(10,2),    
	Width DECIMAL(10,2),       
	Height DECIMAL(10,2),     
	ProductWeight DECIMAL(10,2), 
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[ProductPrice](
	ProductPriceID INT PRIMARY KEY IDENTITY(1,1),
	ProductID INT NOT NULL REFERENCES Products(ProductID),
	PricingSchemeName NVARCHAR(100) NOT NULL, 
	MarkupPercent DECIMAL(10,2) NULL,         
	MarkupAmount DECIMAL(10,2) NULL,         
	SalesPrice DECIMAL(18,2) NOT NULL,       
	CurrencyCode CHAR(3) NOT NULL,        
	Cost DECIMAL(18,2) NULL,                 
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[Currency](
	CurrencyID INT PRIMARY KEY IDENTITY(1,1),
	CurrencyCode CHAR(3) NOT NULL UNIQUE,       
	CurrencyName NVARCHAR(100) NOT NULL,         
	Symbol NVARCHAR(10) NULL,                   
	Country NVARCHAR(100) NULL,                  
	DecimalPlaces TINYINT NOT NULL DEFAULT 2,   
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[PaymentTerm] (
	PaymentTermID INT PRIMARY KEY IDENTITY(1,1),
	PaymentTermName NVARCHAR(100) NOT NULL,
	DaysDue INT NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[TaxingScheme](
	TaxingSchemeID INT PRIMARY KEY IDENTITY(1,1),
	SchemeName NVARCHAR(255) NOT NULL,
	Tax1Name NVARCHAR(100),           
	Tax1OnShipping BIT DEFAULT 0,  
	Tax2Name NVARCHAR(100),        
	Tax2OnShipping BIT DEFAULT 0, 
	IsTax2Compound BIT DEFAULT 0,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[TaxCode](
	TaxCodeId INT PRIMARY KEY IDENTITY(1,1),
	TaxingSchemeID INT REFERENCES TaxingScheme(TaxingSchemeID),
	CodeName NVARCHAR(255) NOT NULL,
	Tax1Rate DECIMAL(10,4),
	Tax2Rate DECIMAL(10,4), 
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO


CREATE TABLE [dbo].[CustomFieldValue](
	CustomFieldsValueID INT PRIMARY KEY IDENTITY(1,1),
	CustomFieldID INT NOT NULL REFERENCES CustomField(CustomFieldID),
	CustomEntityTypeID INT NOT NULL REFERENCES CustomEntityType(CustomEntityTypeID),
	CustomValue NVARCHAR(max) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[ProductUOMConversion](
	ProductUOMConversionID INT PRIMARY KEY IDENTITY (1,1),
	ProductID INT NOT NULL REFERENCES Products(ProductID), 
	StandardUOMID INT NOT NULL REFERENCES MeasureUnit(MeasureUnitID),
	FromValue DECIMAL(10,2) NOT NULL,
	ToValue DECIMAL(10,2) NOT NULL, 
	ConversionType BIT,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[StockLocation](
	StockLocationID INT PRIMARY KEY IDENTITY(1,1),
	StockLocationName NVARCHAR(255) NOT NULL,
	Address NVARCHAR(255),
	City NVARCHAR(100),
	StateOrProvince NVARCHAR(100),
	ZipCode VARCHAR(20),
	Country NVARCHAR(100),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[ProductInventory](    
	ProductInventoryID INT PRIMARY KEY IDENTITY(1,1),
	ProductID INT NOT NULL REFERENCES Products(ProductID),
	StockLocationID INT REFERENCES StockLocation(StockLocationID),
	MeasureUnitID INT NOT NULL REFERENCES MeasureUnit(MeasureUnitID),
	Quantity INT NOT NULL DEFAULT 0 CHECK (Quantity >= 0),
	InventoryTypeID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[StockSubLocation](
	StockSubLocationID INT PRIMARY KEY IDENTITY(1,1),
	StockLocationID INT NOT NULL REFERENCES StockLocation(StockLocationID),
	SubLocation NVARCHAR(50) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[Channel](
	ChannelID INT PRIMARY KEY IDENTITY(1,1),
	ChannelName NVARCHAR(100) NOT NULL, 
	ChannelImg NVARCHAR(max),
	CountryCode VARCHAR(5) NOT NULL,              
	NumberOfOrder INT DEFAULT 0,                 
	TotalSale DECIMAL(18,2) DEFAULT 0,           
	StatusID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);


CREATE TABLE [dbo].[OrderRequest](
	OrderRequestID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT NOT NULL REFERENCES Entity(ObjectID),
	SalesPersonID INT REFERENCES Account(UserID),
	ChannelID INT REFERENCES Channel(ChannelID),
	OrderRequestCode VARCHAR(20) NOT NULL,
	Reference NVARCHAR(50),
	OrderDate DATE NOT NULL,
	ExpectedShipmentDate DATE,
	DeliveryDate DATE,
	PaymentTermID INT REFERENCES PaymentTerm(PaymentTermID),
	DeliveryMethod NVARCHAR(100),
	BillingAddressID INT NOT NULL REFERENCES Address(AddressID),
	ShippingAddressID INT NOT NULL REFERENCES Address(AddressID),
	Description NVARCHAR(MAX),
	StatusID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	SubTotal DECIMAL(18,2),
	ShippingCharges DECIMAL(18,2),
	Adjustment DECIMAL(18,2),
	RoundOff DECIMAL(18,2),
	TotalAmount DECIMAL(18,2),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[OrderRequestItem](
	OrderRequestItemID INT PRIMARY KEY IDENTITY(1,1),
	OrderRequestID INT NOT NULL REFERENCES OrderRequest(OrderRequestID),
	ProductID INT NOT NULL REFERENCES Products(ProductID),
	CustomFieldID INT REFERENCES CustomField(CustomFieldID),
	Chest DECIMAL(10,2),
	Waist DECIMAL(10,2),
	Inseam DECIMAL(10,2),
	Height DECIMAL(10,2),
	Weight DECIMAL(10,2),
	Age INT,
	FrontImg NVARCHAR(255), 
	BehindImg NVARCHAR(255),
	Quantity INT NOT NULL,
	Price DECIMAL(18,2),
	AttachFile NVARCHAR(255) ,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[SaleOrder](
	SaleOrderID INT PRIMARY KEY IDENTITY(1,1),
	OrderRequestID INT NOT NULL REFERENCES OrderRequest(OrderRequestID),
	CustomerID INT NOT NULL REFERENCES Entity(ObjectID),
	StockLocationID INT NOT NULL REFERENCES StockLocation(StockLocationID),
	SalePersonID INT REFERENCES Account(UserID),
	CurrencyID INT NOT NULL REFERENCES Currency(CurrencyID),
	PaymentTermID INT REFERENCES PaymentTerm(PaymentTermID),
	SaleOrderCode VARCHAR(20) NOT NULL,
	OrderDate DATE NOT NULL,
	BillingAddressID INT NOT NULL REFERENCES Address(AddressID),
	ShippingAddressID INT NOT NULL REFERENCES Address(AddressID),
	ShipByDate DATE NOT NULL,
	StatusID INT NOT NULL REFERENCES ConfigKey(ConfigKeyID),
	PaymentStatus NVARCHAR(50) NOT NULL,   
	PaymentAmount DECIMAL(18,2) NOT NULL,   
	TaxRate DECIMAL(5,2) DEFAULT 0,                 
	DueDate DATE,
	Subtotal DECIMAL(18,2) NOT NULL,
	Freight DECIMAL(18,2),            
	Total DECIMAL(18,2) NOT NULL,
	Balance DECIMAL(18,2) NOT NULL,  
	ExchangeRate DECIMAL(18,6) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[SaleOrderItem](
	SaleOrderItemID INT PRIMARY KEY IDENTITY(1,1),
	SaleOrderID INT NOT NULL REFERENCES SaleOrder(SaleOrderID),              
	ProductID INT NOT NULL REFERENCES Products(ProductID),     
	MeasureUnitID INT NOT NULL REFERENCES MeasureUnit(MeasureUnitID), 
	CustomFieldID INT REFERENCES CustomField(CustomFieldID),
	Quantity INT NOT NULL,           
	UnitPrice DECIMAL(18,2) NOT NULL,
	DiscountPercent DECIMAL(5,2),
	DiscountAmount DECIMAL(18,2),
	Subtotal DECIMAL(18,2) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[SaleOrderPick](
	PickID INT PRIMARY KEY IDENTITY(1,1),
	SaleOrderID INT NOT NULL REFERENCES SaleOrder(SaleOrderID),
	PickedBy INT NOT NULL REFERENCES Account(UserID),
	Remarks NVARCHAR(MAX),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[SaleOrderPickItem](
	PickItemID INT PRIMARY KEY IDENTITY(1,1),
	PickID INT NOT NULL REFERENCES SaleOrderPick(PickID),
	ProductID INT NOT NULL REFERENCES Products(ProductID),
	StockLocationID INT NOT NULL REFERENCES StockLocation(StockLocationID),
	SubLocationID INT REFERENCES StockSubLocation(StockSubLocationID),
	Quantity INT NOT NULL,
	PickDate DATE,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[SaleOrderShip](
	ShipID INT PRIMARY KEY IDENTITY(1,1),
	SaleOrderID INT NOT NULL REFERENCES SaleOrder(SaleOrderID),
	ShipDate DATE NOT NULL,
	ShippedBy INT NOT NULL REFERENCES Account(UserID),
	Carrier NVARCHAR(100),
	TrackingNumber NVARCHAR(100),
	Remarks NVARCHAR(MAX),
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO

CREATE TABLE [dbo].[SaleOrderShipItem](
	ShipItemID INT PRIMARY KEY IDENTITY(1,1),
	ShipID INT NOT NULL REFERENCES SaleOrderShip(ShipID),
	ProductID INT NOT NULL REFERENCES Products(ProductID),
	Quantity INT NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE(),
	UpdatedAt DATETIME DEFAULT GETDATE(),
	CreatedBy INT NOT NULL,
	UpdatedBy INT NOT NULL,
	IsActive BIT DEFAULT 1
);
GO
