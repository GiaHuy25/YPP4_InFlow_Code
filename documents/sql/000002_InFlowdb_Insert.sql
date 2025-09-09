USE Inflow
GO

-- 1. Insert into ConfigGroup
INSERT INTO [dbo].[ConfigGroup] (ConfigGroupName, CreatedBy, UpdatedBy) VALUES
('PaymentMethods', 1, 1),
('AddressTypes', 1, 1),
('CustomerTypes', 1, 1),
('ObjectTypes', 1, 1),
('ShippingOptions', 1, 1),
('TaxCategories', 1, 1),
('DiscountTypes', 1, 1),
('OrderStatuses', 1, 1),
('CurrencyTypes', 1, 1),
('NotificationSettings', 1, 1);

-- 2. Insert into ConfigKey
INSERT INTO [dbo].[ConfigKey] (KeyName, KeyValue, ConfigGroupID, CreatedBy, UpdatedBy) VALUES
('CreditCard', 'CC', 1, 1, 1),
('PayPal', 'PP', 1, 1, 1),
('Home', 'HOME', 2, 1, 1),
('Office', 'OFFICE', 2, 1, 1),
('Individual', 'IND', 3, 1, 1),
('Business', 'BUS', 3, 1, 1),
('Person', 'PER', 4, 1, 1),
('Company', 'COMP', 4, 1, 1),
('Standard', 'STD', 5, 1, 1),
('Express', 'EXP', 5, 1, 1);

-- 3. Insert into Address
INSERT INTO [dbo].[Address] (PreSavedName, Street, City, StateProvince, Country, ZipPostalCode, AddressTypeID, Remarks, CreatedBy, UpdatedBy) VALUES
('Home1', N'123 Main St', N'Hanoi', N'Ha Noi', N'Vietnam', N'10000', 3, N'Primary residence', 1, 1),
('Office1', N'456 Business Rd', N'HCM City', N'HCM', N'Vietnam', N'70000', 4, N'Company office', 1, 1),
('Home2', N'789 Le Loi St', N'Da Nang', N'Da Nang', N'Vietnam', N'55000', 3, N'Second home', 1, 1),
('Office2', N'101 Tran Phu St', N'Can Tho', N'Can Tho', N'Vietnam', N'94000', 4, N'Branch office', 1, 1),
('Home3', N'222 Hai Ba Trung', N'Hai Phong', N'Hai Phong', N'Vietnam', N'18000', 3, N'Family house', 1, 1),
('Office3', N'333 Nguyen Hue', N'Binh Duong', N'Binh Duong', N'Vietnam', N'82000', 4, N'Regional office', 1, 1),
('Home4', N'444 Hung Vuong', N'Nha Trang', N'Khanh Hoa', N'Vietnam', N'65000', 3, N'Vacation home', 1, 1),
('Office4', N'555 Le Duan', N'Da Lat', N'Lam Dong', N'Vietnam', N'66000', 4, N'Head office', 1, 1),
('Home5', N'666 Tran Hung Dao', N'Quy Nhon', N'Binh Dinh', N'Vietnam', N'59000', 3, N'Rental property', 1, 1),
('Office5', N'777 Pham Van Dong', N'Vung Tau', N'Ba Ria Vung Tau', N'Vietnam', N'78000', 4, N'Sales office', 1, 1);

-- 4. Insert into Entity
INSERT INTO [dbo].[Entity] (ObjectName, Phone, Email, Fax, BillingAddressID, ShippingAddressID, CustomerTypeID, ObjectTypeID, TotalSpend, LastOrderDate, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Nguyen Van A', '0901234567', 'nguyenvana@example.com', '5551234567', 1, 2, 5, 7, 500.50, '2025-09-01', 1, 1, 1),
(N'Tran Thi B', '0912345678', 'tranthib@example.com', '5551234568', 3, 4, 5, 7, 1200.75, '2025-08-15', 1, 1, 1),
(N'Le Van C', '0923456789', 'levanc@example.com', '5551234569', 5, 6, 6, 8, 3000.00, '2025-09-02', 1, 1, 1),
(N'Pham Thi D', '0934567890', 'phamthid@example.com', '5551234570', 7, 8, 6, 8, 450.25, '2025-08-20', 1, 1, 1),
(N'Hoang Van E', '0945678901', 'hoangvane@example.com', '5551234571', 9, 10, 5, 7, 750.00, '2025-09-03', 1, 1, 1),
(N'Nguyen Thi F', '0956789012', 'nguyenthif@example.com', '5551234572', 1, 2, 5, 7, 1800.90, '2025-08-10', 1, 1, 1),
(N'Tran Van G', '0967890123', 'tranvang@example.com', '5551234573', 3, 4, 6, 8, 2500.60, '2025-09-04', 1, 1, 1),
(N'Le Thi H', '0978901234', 'lethih@example.com', '5551234574', 5, 6, 5, 7, 600.30, '2025-08-25', 1, 1, 1),
(N'Pham Van I', '0989012345', 'phamvani@example.com', '5551234575', 7, 8, 6, 8, 900.80, '2025-09-05', 1, 1, 1),
(N'Hoang Thi K', '0990123456', 'hoangthik@example.com', '5551234576', 9, 10, 5, 7, 1500.45, '2025-08-30', 1, 1, 1);

-- 5. Insert into ProductCategory
INSERT INTO [dbo].[ProductCategory] (ProductCategoryName, ParentCategoryId, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Electronics', NULL, 1, 1, 1),
(N'Clothing', NULL, 1, 1, 1),
(N'Books', NULL, 1, 1, 1),
(N'Furniture', NULL, 1, 1, 1),
(N'Smartphones', 1, 1, 1, 1),
(N'T-Shirts', 2, 1, 1, 1),
(N'Novels', 3, 1, 1, 1),
(N'Chairs', 4, 1, 1, 1),
(N'Home Appliances', 1, 1, 1, 1),
(N'Tables', 4, 1, 1, 1);

-- 6. Insert into MeasureUnit
INSERT INTO [dbo].[MeasureUnit] (MeasureUnitName, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Unit', 1, 1, 1),
(N'Kilogram', 1, 1, 1),
(N'Piece', 1, 1, 1),
(N'Box', 1, 1, 1),
(N'Pack', 1, 1, 1),
(N'Meter', 1, 1, 1),
(N'Liter', 1, 1, 1),
(N'Gram', 1, 1, 1),
(N'Centimeter', 1, 1, 1),
(N'Bottle', 1, 1, 1);

INSERT INTO [dbo].[CustomEntityType] (EntityTypeName, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Product', 1, 1, 1),
(N'Customer', 1, 1, 1),
(N'SaleOrder', 1, 1, 1),
(N'OrderRequest', 1, 1, 1),
(N'SaleQuote', 1, 1, 1);

-- 7. Insert into CustomField
INSERT INTO [dbo].[CustomField] (FieldName, AliasName, DataType, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Color', N'Product Color', N'NVARCHAR(50)', 1, 1, 1),
(N'Material', N'Product Material', N'NVARCHAR(100)', 1, 1, 1),
(N'Warranty', N'Warranty Period', N'NVARCHAR(50)', 1, 1, 1),
(N'Brand', N'Product Brand', N'NVARCHAR(100)', 1, 1, 1),
(N'Size', N'Product Size', N'NVARCHAR(50)', 1, 1, 1),
(N'Voltage', N'Operating Voltage', N'NVARCHAR(50)', 1, 1, 1),
(N'Weight Capacity', N'Max Weight Capacity', N'NVARCHAR(50)', 1, 1, 1),
(N'Edition', N'Book Edition', N'NVARCHAR(50)', 1, 1, 1),
(N'Fabric Type', N'Clothing Fabric', N'NVARCHAR(100)', 1, 1, 1),
(N'Power Consumption', N'Power Usage', N'NVARCHAR(50)', 1, 1, 1);

-- 8. Insert into CustomFieldOption
INSERT INTO [dbo].[CustomFieldOption] (CustomFieldID, DropdownValue, CreatedBy, UpdatedBy, IsActive) VALUES
(1, N'Red', 1, 1, 1),
(1, N'Blue', 1, 1, 1),
(2, N'Cotton', 1, 1, 1),
(2, N'Polyester', 1, 1, 1),
(3, N'1 Year', 1, 1, 1),
(3, N'2 Years', 1, 1, 1),
(5, N'Small', 1, 1, 1),
(5, N'Medium', 1, 1, 1),
(5, N'Large', 1, 1, 1),
(4, N'Samsung', 1, 1, 1);

-- 9. Insert into Products
INSERT INTO [dbo].[Products] (ProductCategoryID, MeasureUnitID, ProductTypeID, ProductName, Barcode, ProductImg, ProductDescription, AvailableStock, UnitCost, ProductLength, Width, Height, ProductWeight, CreatedBy, UpdatedBy, IsActive) VALUES
(5, 1, 7, N'Samsung Galaxy S23', 'VN12345678901', NULL, N'Latest smartphone', 100, 5000000.00, 15.00, 7.00, 0.80, 0.20, 1, 1, 1),
(6, 3, 7, N'Cotton T-Shirt', 'VN12345678902', NULL, N'Comfortable T-shirt', 200, 100000.00, 60.00, 40.00, NULL, 0.15, 1, 1, 1),
(9, 1, 8, N'Microwave Oven', 'VN12345678903', NULL, N'Kitchen microwave', 50, 1500000.00, 50.00, 30.00, 25.00, 10.00, 1, 1, 1),
(7, 3, 7, N'Novel: The Great Gatsby', 'VN12345678904', NULL, N'Classic novel', 300, 80000.00, 20.00, 13.00, 2.00, 0.50, 1, 1, 1),
(8, 1, 8, N'Wooden Chair', 'VN12345678905', NULL, N'Durable chair', 80, 500000.00, 50.00, 50.00, 80.00, 5.00, 1, 1, 1),
(5, 1, 7, N'iPhone 14', 'VN12345678906', NULL, N'Apple smartphone', 120, 7000000.00, 15.50, 7.50, 0.80, 0.22, 1, 1, 1),
(6, 3, 7, N'Polo Shirt', 'VN12345678907', NULL, N'Casual polo', 150, 150000.00, 62.00, 42.00, NULL, 0.18, 1, 1, 1),
(9, 1, 8, N'Blender', 'VN12345678908', NULL, N'Kitchen blender', 60, 800000.00, 20.00, 20.00, 30.00, 2.00, 1, 1, 1),
(7, 3, 7, N'Book: 1984', 'VN12345678909', NULL, N'Dystopian novel', 250, 90000.00, 20.00, 13.00, 2.50, 0.55, 1, 1, 1),
(10, 1, 8, N'Dining Table', 'VN12345678910', NULL, N'Wooden dining table', 40, 2000000.00, 150.00, 80.00, 75.00, 20.00, 1, 1, 1);

-- 10. Insert into Currency
INSERT INTO [dbo].[Currency] (CurrencyCode, CurrencyName, Symbol, Country, CreatedBy, UpdatedBy) VALUES
('USD', 'US Dollar', '$', 'USA', 1, 1),
('EUR', 'Euro', '€', 'EU', 1, 1),
('JPY', 'Japanese Yen', '¥', 'Japan', 1, 1),
('VND', 'Vietnam Dong', '₫', 'Vietnam', 1, 1),
('GBP', 'Pound Sterling', '£', 'UK', 1, 1),
('AUD', 'Australian Dollar', '$', 'Australia', 1, 1),
('CAD', 'Canadian Dollar', '$', 'Canada', 1, 1),
('CNY', 'Chinese Yuan', '¥', 'China', 1, 1),
('KRW', 'Korean Won', '₩', 'Korea', 1, 1),
('INR', 'Indian Rupee', '₹', 'India', 1, 1);

-- 11. Insert into ProductPrice
INSERT INTO [dbo].[ProductPrice] (ProductID, PricingSchemeName, MarkupPercent, MarkupAmount, SalesPrice, CurrencyCode, Cost, CreatedBy, UpdatedBy, IsActive) VALUES
(1, N'Standard', 20.00, NULL, 6000000.00, 'VND', 5000000.00, 1, 1, 1),
(2, N'Retail', 50.00, NULL, 150000.00, 'VND', 100000.00, 1, 1, 1),
(3, N'Wholesale', NULL, 300000.00, 1800000.00, 'VND', 1500000.00, 1, 1, 1),
(4, N'Standard', 25.00, NULL, 100000.00, 'VND', 80000.00, 1, 1, 1),
(5, N'Retail', 40.00, NULL, 700000.00, 'VND', 500000.00, 1, 1, 1),
(6, N'Premium', 25.00, NULL, 8750000.00, 'VND', 7000000.00, 1, 1, 1),
(7, N'Standard', 50.00, NULL, 225000.00, 'VND', 150000.00, 1, 1, 1),
(8, N'Wholesale', NULL, 200000.00, 1000000.00, 'VND', 800000.00, 1, 1, 1),
(9, N'Retail', 30.00, NULL, 117000.00, 'VND', 90000.00, 1, 1, 1),
(10, N'Standard', 30.00, NULL, 2600000.00, 'VND', 2000000.00, 1, 1, 1);

-- 12. Insert into CustomFieldValue
INSERT INTO [dbo].[CustomFieldValue] (CustomFieldID, CustomEntityTypeID, CustomValue, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, N'Black', 1, 1, 1),
(2, 1, N'Cotton', 1, 1, 1),
(3, 1, N'2 Years', 1, 1, 1),
(4, 1, N'Samsung', 1, 1, 1),
(5, 1, N'Medium', 1, 1, 1),
(1, 1, N'Silver', 1, 1, 1),
(2, 1, N'Polyester', 1, 1, 1),
(3, 1, N'1 Year', 1, 1, 1),
(8, 1, N'First Edition', 1, 1, 1),
(9, 1, N'Breathable Fabric', 1, 1, 1);

-- 13. Insert into ProductUOMConversion
INSERT INTO [dbo].[ProductUOMConversion] (ProductID, StandardUOMID, FromValue, ToValue, ConversionType, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 1.00, 1.00, 1, 1, 1, 1),
(2, 3, 1.00, 1.00, 1, 1, 1, 1),
(3, 1, 1.00, 1.00, 1, 1, 1, 1),
(4, 3, 1.00, 1.00, 1, 1, 1, 1),
(5, 1, 1.00, 1.00, 1, 1, 1, 1),
(6, 1, 1.00, 1.00, 1, 1, 1, 1),
(7, 3, 1.00, 1.00, 1, 1, 1, 1),
(8, 1, 1.00, 1.00, 1, 1, 1, 1),
(9, 3, 1.00, 1.00, 1, 1, 1, 1),
(10, 1, 1.00, 1.00, 1, 1, 1, 1);

-- 14. Insert into StockLocation
INSERT INTO [dbo].[StockLocation] (StockLocationName, Address, City, StateOrProvince, ZipCode, Country, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Hanoi Warehouse', N'123 Tran Hung Dao', N'Hanoi', N'Ha Noi', '10000', N'Vietnam', 1, 1, 1),
(N'HCM Warehouse', N'456 Nguyen Thi Minh Khai', N'HCM City', N'HCM', '70000', N'Vietnam', 1, 1, 1),
(N'Da Nang Depot', N'789 Le Loi', N'Da Nang', N'Da Nang', '55000', N'Vietnam', 1, 1, 1),
(N'Can Tho Store', N'101 Ninh Kieu', N'Can Tho', N'Can Tho', '94000', N'Vietnam', 1, 1, 1),
(N'Hai Phong Hub', N'222 Lach Tray', N'Hai Phong', N'Hai Phong', '18000', N'Vietnam', 1, 1, 1),
(N'Binh Duong Depot', N'333 Vo Van Ngan', N'Binh Duong', N'Binh Duong', '82000', N'Vietnam', 1, 1, 1),
(N'Nha Trang Store', N'444 Tran Phu', N'Nha Trang', N'Khanh Hoa', '65000', N'Vietnam', 1, 1, 1),
(N'Da Lat Warehouse', N'555 Le Hong Phong', N'Da Lat', N'Lam Dong', '66000', N'Vietnam', 1, 1, 1),
(N'Quy Nhon Hub', N'666 Nguyen Hue', N'Quy Nhon', N'Binh Dinh', '59000', N'Vietnam', 1, 1, 1),
(N'Vung Tau Store', N'777 Ba Cu', N'Vung Tau', N'Ba Ria Vung Tau', '78000', N'Vietnam', 1, 1, 1);

-- 15. Insert into ProductInventory
INSERT INTO [dbo].[ProductInventory] (ProductID, StockLocationID, MeasureUnitID, Quantity, InventoryTypeID, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 1, 50, 9, 1, 1, 1),
(2, 2, 3, 100, 9, 1, 1, 1),
(3, 3, 1, 20, 9, 1, 1, 1),
(4, 4, 3, 150, 9, 1, 1, 1),
(5, 5, 1, 30, 9, 1, 1, 1),
(6, 6, 1, 60, 9, 1, 1, 1),
(7, 7, 3, 80, 9, 1, 1, 1),
(8, 8, 1, 25, 9, 1, 1, 1),
(9, 9, 3, 120, 9, 1, 1, 1),
(10, 10, 1, 15, 9, 1, 1, 1);


-- 17. Insert into PaymentTerm
INSERT INTO [dbo].[PaymentTerm] (PaymentTermName, DaysDue, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Net 30', 30, 1, 1, 1),
(N'Net 15', 15, 1, 1, 1),
(N'Immediate', 0, 1, 1, 1),
(N'Net 45', 45, 1, 1, 1),
(N'Net 60', 60, 1, 1, 1),
(N'Net 7', 7, 1, 1, 1),
(N'COD', 0, 1, 1, 1),
(N'Net 90', 90, 1, 1, 1),
(N'Advance', 0, 1, 1, 1),
(N'Net 14', 14, 1, 1, 1);

-- 18. Insert into TaxingScheme
INSERT INTO [dbo].[TaxingScheme] (SchemeName, Tax1Name, Tax1OnShipping, Tax2Name, Tax2OnShipping, IsTax2Compound, CreatedBy, UpdatedBy, IsActive) VALUES
(N'VAT Standard', N'VAT', 1, NULL, 0, 0, 1, 1, 1),
(N'VAT Reduced', N'VAT', 0, NULL, 0, 0, 1, 1, 1),
(N'No Tax', NULL, 0, NULL, 0, 0, 1, 1, 1),
(N'VAT + Export', N'VAT', 1, N'Export Tax', 1, 0, 1, 1, 1),
(N'VAT + Local', N'VAT', 1, N'Local Tax', 0, 1, 1, 1, 1),
(N'Import Duty', N'Import Tax', 0, NULL, 0, 0, 1, 1, 1),
(N'VAT Exempt', NULL, 0, NULL, 0, 0, 1, 1, 1),
(N'VAT + Service', N'VAT', 1, N'Service Tax', 1, 0, 1, 1, 1),
(N'Export Only', N'Export Tax', 1, NULL, 0, 0, 1, 1, 1),
(N'Local Tax', N'Local Tax', 0, NULL, 0, 0, 1, 1, 1);

-- 19. Insert into TaxCode
INSERT INTO [dbo].[TaxCode] (TaxingSchemeID, CodeName, Tax1Rate, Tax2Rate, CreatedBy, UpdatedBy, IsActive) VALUES
(1, N'VAT10', 10.0000, NULL, 1, 1, 1),
(2, N'VAT5', 5.0000, NULL, 1, 1, 1),
(3, N'NOTAX', 0.0000, NULL, 1, 1, 1),
(4, N'VAT10_EXPORT5', 10.0000, 5.0000, 1, 1, 1),
(5, N'VAT10_LOCAL2', 10.0000, 2.0000, 1, 1, 1),
(6, N'IMPORT7', 7.0000, NULL, 1, 1, 1),
(7, N'EXEMPT', 0.0000, NULL, 1, 1, 1),
(8, N'VAT10_SERVICE3', 10.0000, 3.0000, 1, 1, 1),
(9, N'EXPORT5', 5.0000, NULL, 1, 1, 1),
(10, N'LOCAL2', 2.0000, NULL, 1, 1, 1);

-- 20. Insert into StockSubLocation
INSERT INTO [dbo].[StockSubLocation] (StockLocationID, SubLocation, CreatedBy, UpdatedBy, IsActive) VALUES
(1, N'Aisle1', 1, 1, 1),
(2, N'Shelf1', 1, 1, 1),
(3, N'Bin1', 1, 1, 1),
(4, N'Rack1', 1, 1, 1),
(5, N'Aisle2', 1, 1, 1),
(6, N'Shelf2', 1, 1, 1),
(7, N'Bin2', 1, 1, 1),
(8, N'Rack2', 1, 1, 1),
(9, N'Aisle3', 1, 1, 1),
(10, N'Shelf3', 1, 1, 1);

-- 21. Insert into Channel
INSERT INTO [dbo].[Channel] (ChannelName, ChannelImg, CountryCode, NumberOfOrder, TotalSale, StatusID, CreatedBy, UpdatedBy, IsActive) VALUES
(N'Shopee VN', NULL, 'VN', 50, 100000000.00, 8, 1, 1, 1),
(N'Lazada VN', NULL, 'VN', 30, 75000000.00, 8, 1, 1, 1),
(N'Tiki VN', NULL, 'VN', 20, 50000000.00, 8, 1, 1, 1),
(N'Website', NULL, 'VN', 15, 30000000.00, 8, 1, 1, 1),
(N'Store Hanoi', NULL, 'VN', 25, 60000000.00, 8, 1, 1, 1),
(N'Store HCM', NULL, 'VN', 22, 55000000.00, 8, 1, 1, 1),
(N'Store Da Nang', NULL, 'VN', 18, 40000000.00, 8, 1, 1, 1),
(N'Facebook Shop', NULL, 'VN', 10, 20000000.00, 8, 1, 1, 1),
(N'Zalo Shop', NULL, 'VN', 12, 25000000.00, 8, 1, 1, 1),
(N'Wholesale', NULL, 'VN', 8, 15000000.00, 8, 1, 1, 1);

-- 22. Insert into OrderRequest
INSERT INTO [dbo].[OrderRequest] (CustomerID, SalesPersonID, ChannelID, OrderRequestCode, Reference, OrderDate, ExpectedShipmentDate, DeliveryDate, PaymentTermID, DeliveryMethod, BillingAddressID, ShippingAddressID, Description, StatusID, SubTotal, ShippingCharges, Adjustment, RoundOff, TotalAmount, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 1, 'OR001', 'REF001', '2025-09-01', '2025-09-05', NULL, 1, N'Standard', 1, 2, N'Order for smartphones', 8, 12000000.00, 50000.00, 0.00, 0.00, 12050000.00, 1, 1, 1),
(2, 1, 2, 'OR002', 'REF002', '2025-09-02', '2025-09-06', NULL, 2, N'Express', 3, 4, N'Clothing order', 8, 300000.00, 30000.00, 0.00, 0.00, 330000.00, 1, 1, 1),
(3, 1, 3, 'OR003', 'REF003', '2025-09-03', '2025-09-07', NULL, 3, N'Standard', 5, 6, N'Appliance order', 8, 3600000.00, 100000.00, 0.00, 0.00, 3700000.00, 1, 1, 1),
(4, 1, 4, 'OR004', 'REF004', '2025-09-04', '2025-09-08', NULL, 4, N'Express', 7, 8, N'Book order', 8, 200000.00, 20000.00, 0.00, 0.00, 220000.00, 1, 1, 1),
(5, 1, 5, 'OR005', 'REF005', '2025-09-05', '2025-09-09', NULL, 5, N'Standard', 9, 10, N'Furniture order', 8, 1400000.00, 80000.00, 0.00, 0.00, 1480000.00, 1, 1, 1),
(6, 1, 6, 'OR006', 'REF006', '2025-09-06', '2025-09-10', NULL, 1, N'Express', 1, 2, N'Smartphone order', 8, 17500000.00, 60000.00, 0.00, 0.00, 17560000.00, 1, 1, 1),
(7, 1, 7, 'OR007', 'REF007', '2025-09-07', '2025-09-11', NULL, 2, N'Standard', 3, 4, N'Clothing order', 8, 450000.00, 30000.00, 0.00, 0.00, 480000.00, 1, 1, 1),
(8, 1, 8, 'OR008', 'REF008', '2025-09-08', '2025-09-12', NULL, 3, N'Express', 5, 6, N'Appliance order', 8, 2000000.00, 70000.00, 0.00, 0.00, 2070000.00, 1, 1, 1),
(9, 1, 9, 'OR009', 'REF009', '2025-09-09', '2025-09-13', NULL, 4, N'Standard', 7, 8, N'Book order', 8, 234000.00, 20000.00, 0.00, 0.00, 254000.00, 1, 1, 1),
(10, 1, 10, 'OR010', 'REF010', '2025-09-10', '2025-09-14', NULL, 5, N'Express', 9, 10, N'Furniture order', 8, 5200000.00, 100000.00, 0.00, 0.00, 5300000.00, 1, 1, 1);

-- 23. Insert into OrderRequestItem
INSERT INTO [dbo].[OrderRequestItem] (OrderRequestID, ProductID, CustomFieldID, Chest, Waist, Inseam, Height, Weight, Age, FrontImg, BehindImg, Quantity, Price, AttachFile, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6000000.00, NULL, 1, 1, 1),
(2, 2, 5, 90.00, 70.00, 80.00, NULL, NULL, NULL, NULL, NULL, 2, 150000.00, NULL, 1, 1, 1),
(3, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1800000.00, NULL, 1, 1, 1),
(4, 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 100000.00, NULL, 1, 1, 1),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 700000.00, NULL, 1, 1, 1),
(6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8750000.00, NULL, 1, 1, 1),
(7, 7, 5, 92.00, 72.00, 82.00, NULL, NULL, NULL, NULL, NULL, 2, 225000.00, NULL, 1, 1, 1),
(8, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1000000.00, NULL, 1, 1, 1),
(9, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 117000.00, NULL, 1, 1, 1),
(10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2600000.00, NULL, 1, 1, 1);

-- 24. Insert into SaleOrder
INSERT INTO [dbo].[SaleOrder] (OrderRequestID, CustomerID, StockLocationID, SalePersonID, CurrencyID, PaymentTermID, SaleOrderCode, OrderDate, BillingAddressID, ShippingAddressID, ShipByDate, StatusID, PaymentStatus, PaymentAmount, TaxRate, DueDate, Subtotal, Freight, Total, Balance, ExchangeRate, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 1, 1, 4, 1, 'SO001', '2025-09-01', 1, 2, '2025-09-05', 8, N'Pending', 12050000.00, 10.00, '2025-10-01', 12000000.00, 50000.00, 13250000.00, 13250000.00, 1.000000, 1, 1, 1),
(2, 2, 2, 1, 4, 2, 'SO002', '2025-09-02', 3, 4, '2025-09-06', 8, N'Pending', 330000.00, 5.00, '2025-09-17', 300000.00, 30000.00, 346500.00, 346500.00, 1.000000, 1, 1, 1),
(3, 3, 3, 1, 4, 3, 'SO003', '2025-09-03', 5, 6, '2025-09-07', 8, N'Pending', 3700000.00, 10.00, '2025-09-03', 3600000.00, 100000.00, 4070000.00, 4070000.00, 1.000000, 1, 1, 1),
(4, 4, 4, 1, 4, 4, 'SO004', '2025-09-04', 7, 8, '2025-09-08', 8, N'Pending', 220000.00, 0.00, '2025-10-04', 200000.00, 20000.00, 220000.00, 220000.00, 1.000000, 1, 1, 1),
(5, 5, 5, 1, 4, 5, 'SO005', '2025-09-05', 9, 10, '2025-09-09', 8, N'Pending', 1480000.00, 7.00, '2025-11-04', 1400000.00, 80000.00, 1596000.00, 1596000.00, 1.000000, 1, 1, 1),
(6, 6, 6, 1, 4, 1, 'SO006', '2025-09-06', 1, 2, '2025-09-10', 8, N'Pending', 17560000.00, 10.00, '2025-10-06', 17500000.00, 60000.00, 19310000.00, 19310000.00, 1.000000, 1, 1, 1),
(7, 7, 7, 1, 4, 2, 'SO007', '2025-09-07', 3, 4, '2025-09-11', 8, N'Pending', 480000.00, 5.00, '2025-09-22', 450000.00, 30000.00, 504000.00, 504000.00, 1.000000, 1, 1, 1),
(8, 8, 8, 1, 4, 3, 'SO008', '2025-09-08', 5, 6, '2025-09-12', 8, N'Pending', 2070000.00, 10.00, '2025-09-08', 2000000.00, 70000.00, 2277000.00, 2277000.00, 1.000000, 1, 1, 1),
(9, 9, 9, 1, 4, 4, 'SO009', '2025-09-09', 7, 8, '2025-09-13', 8, N'Pending', 254000.00, 0.00, '2025-10-09', 234000.00, 20000.00, 254000.00, 254000.00, 1.000000, 1, 1, 1),
(10, 10, 10, 1, 4, 5, 'SO010', '2025-09-10', 9, 10, '2025-09-14', 8, N'Pending', 5300000.00, 7.00, '2025-11-09', 5200000.00, 100000.00, 5679000.00, 5679000.00, 1.000000, 1, 1, 1);

-- 25. Insert into SaleOrderItem
INSERT INTO [dbo].[SaleOrderItem] (SaleOrderID, ProductID, MeasureUnitID, CustomFieldID, Quantity, UnitPrice, DiscountPercent, DiscountAmount, Subtotal, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 1, 1, 2, 6000000.00, 0.00, 0.00, 12000000.00, 1, 1, 1),
(2, 2, 3, 5, 2, 150000.00, 0.00, 0.00, 300000.00, 1, 1, 1),
(3, 3, 1, 3, 2, 1800000.00, 0.00, 0.00, 3600000.00, 1, 1, 1),
(4, 4, 3, 8, 2, 100000.00, 0.00, 0.00, 200000.00, 1, 1, 1),
(5, 5, 1, NULL, 2, 700000.00, 0.00, 0.00, 1400000.00, 1, 1, 1),
(6, 6, 1, 1, 2, 8750000.00, 0.00, 0.00, 17500000.00, 1, 1, 1),
(7, 7, 3, 5, 2, 225000.00, 0.00, 0.00, 450000.00, 1, 1, 1),
(8, 8, 1, 3, 2, 1000000.00, 0.00, 0.00, 2000000.00, 1, 1, 1),
(9, 9, 3, 8, 2, 117000.00, 0.00, 0.00, 234000.00, 1, 1, 1),
(10, 10, 1, NULL, 2, 2600000.00, 0.00, 0.00, 5200000.00, 1, 1, 1);

-- 26. Insert into SaleOrderPick
INSERT INTO [dbo].[SaleOrderPick] (SaleOrderID, PickedBy, Remarks, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, N'Picked from Hanoi Warehouse', 1, 1, 1),
(2, 1, N'Picked from HCM Warehouse', 1, 1, 1),
(3, 1, N'Picked from Da Nang Depot', 1, 1, 1),
(4, 1, N'Picked from Can Tho Store', 1, 1, 1),
(5, 1, N'Picked from Hai Phong Hub', 1, 1, 1),
(6, 1, N'Picked from Binh Duong Depot', 1, 1, 1),
(7, 1, N'Picked from Nha Trang Store', 1, 1, 1),
(8, 1, N'Picked from Da Lat Warehouse', 1, 1, 1),
(9, 1, N'Picked from Quy Nhon Hub', 1, 1, 1),
(10, 1, N'Picked from Vung Tau Store', 1, 1, 1);

-- 27. Insert into SaleOrderPickItem
INSERT INTO [dbo].[SaleOrderPickItem] (PickID, ProductID, StockLocationID, SubLocationID, Quantity, PickDate, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 1, 1, 2, '2025-09-02', 1, 1, 1),
(2, 2, 2, 2, 2, '2025-09-03', 1, 1, 1),
(3, 3, 3, 3, 2, '2025-09-04', 1, 1, 1),
(4, 4, 4, 4, 2, '2025-09-05', 1, 1, 1),
(5, 5, 5, 5, 2, '2025-09-06', 1, 1, 1),
(6, 6, 6, 6, 2, '2025-09-07', 1, 1, 1),
(7, 7, 7, 7, 2, '2025-09-08', 1, 1, 1),
(8, 8, 8, 8, 2, '2025-09-09', 1, 1, 1),
(9, 9, 9, 9, 2, '2025-09-10', 1, 1, 1),
(10, 10, 10, 10, 2, '2025-09-11', 1, 1, 1);

-- 28. Insert into SaleOrderShip
INSERT INTO [dbo].[SaleOrderShip] (SaleOrderID, ShipDate, ShippedBy, Carrier, TrackingNumber, Remarks, CreatedBy, UpdatedBy, IsActive) VALUES
(1, '2025-09-03', 1, N'Giao Hang Nhanh', 'TRK001', N'Shipped to Hanoi', 1, 1, 1),
(2, '2025-09-04', 1, N'VietPost', 'TRK002', N'Shipped to HCM City', 1, 1, 1),
(3, '2025-09-05', 1, N'Giao Hang Tiet Kiem', 'TRK003', N'Shipped to Da Nang', 1, 1, 1),
(4, '2025-09-06', 1, N'Giao Hang Nhanh', 'TRK004', N'Shipped to Can Tho', 1, 1, 1),
(5, '2025-09-07', 1, N'VietPost', 'TRK005', N'Shipped to Hai Phong', 1, 1, 1),
(6, '2025-09-08', 1, N'Giao Hang Tiet Kiem', 'TRK006', N'Shipped to Binh Duong', 1, 1, 1),
(7, '2025-09-09', 1, N'Giao Hang Nhanh', 'TRK007', N'Shipped to Nha Trang', 1, 1, 1),
(8, '2025-09-10', 1, N'VietPost', 'TRK008', N'Shipped to Da Lat', 1, 1, 1),
(9, '2025-09-11', 1, N'Giao Hang Tiet Kiem', 'TRK009', N'Shipped to Quy Nhon', 1, 1, 1),
(10, '2025-09-12', 1, N'Giao Hang Nhanh', 'TRK010', N'Shipped to Vung Tau', 1, 1, 1);

-- 29. Insert into SaleOrderShipItem
INSERT INTO [dbo].[SaleOrderShipItem] (ShipID, ProductID, Quantity, CreatedBy, UpdatedBy, IsActive) VALUES
(1, 1, 2, 1, 1, 1),
(2, 2, 2, 1, 1, 1),
(3, 3, 2, 1, 1, 1),
(4, 4, 2, 1, 1, 1),
(5, 5, 2, 1, 1, 1),
(6, 6, 2, 1, 1, 1),
(7, 7, 2, 1, 1, 1),
(8, 8, 2, 1, 1, 1),
(9, 9, 2, 1, 1, 1),
(10, 10, 2, 1, 1, 1);