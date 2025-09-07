USE Inflow
GO

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

INSERT INTO [dbo].[Entity] (ObjectName, Phone, Email, BillingAddressID, ShippingAddressID, CustomerTypeID, ObjectTypeID, TotalSpend, LastOrderDate, CreatedBy, UpdatedBy) VALUES
(N'Nguyen Van A', '0901234567', 'nguyenvana@example.com', 1, 2, 5, 7, 500.50, '2025-09-01', 1, 1),
(N'Tran Thi B', '0912345678', 'tranthib@example.com', 3, 4, 5, 7, 1200.75, '2025-08-15', 1, 1),
(N'Le Van C', '0923456789', 'levanc@example.com', 5, 6, 6, 8, 3000.00, '2025-09-02', 1, 1),
(N'Pham Thi D', '0934567890', 'phamthid@example.com', 7, 8, 6, 8, 450.25, '2025-08-20', 1, 1),
(N'Hoang Van E', '0945678901', 'hoangvane@example.com', 9, 10, 5, 7, 750.00, '2025-09-03', 1, 1),
(N'Nguyen Thi F', '0956789012', 'nguyenthif@example.com', 1, 2, 5, 7, 1800.90, '2025-08-10', 1, 1),
(N'Tran Van G', '0967890123', 'tranvang@example.com', 3, 4, 6, 8, 2500.60, '2025-09-04', 1, 1),
(N'Le Thi H', '0978901234', 'lethih@example.com', 5, 6, 5, 7, 600.30, '2025-08-25', 1, 1),
(N'Pham Van I', '0989012345', 'phamvani@example.com', 7, 8, 6, 8, 900.80, '2025-09-05', 1, 1),
(N'Hoang Thi K', '0990123456', 'hoangthik@example.com', 9, 10, 5, 7, 1500.45, '2025-08-30', 1, 1);