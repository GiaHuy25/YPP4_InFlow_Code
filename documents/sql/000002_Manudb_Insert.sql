USE Manu
GO

INSERT INTO [dbo].[AddressType] (TypeName, AddressTypeDescription, CreatedBy, UpdatedBy)
VALUES 
    (N'Billing', N'Địa chỉ thanh toán', 1, 1),
    (N'Shipping', N'Địa chỉ giao hàng', 1, 1);
GO

INSERT INTO [dbo].[Country] (CountryName, CountryCode, CreatedBy, UpdatedBy)
VALUES 
    (N'Vietnam', 'VN', 1, 1),
    (N'Singapore', 'SG', 1, 1),
    (N'United States', 'US', 1, 1),
    (N'Japan', 'JP', 1, 1),
    (N'Thailand', 'TH', 1, 1),
    (N'Australia', 'AU', 1, 1),
    (N'United Kingdom', 'UK', 1, 1),
    (N'Canada', 'CA', 1, 1),
    (N'Germany', 'DE', 1, 1),
    (N'France', 'FR', 1, 1);
GO

INSERT INTO [dbo].[StateProvince] (CountryId, StateProvinceName, CreatedBy, UpdatedBy)
VALUES 
    (1, N'Hà Nội', 1, 1),
    (1, N'TP. Hồ Chí Minh', 1, 1),
    (3, N'California', 1, 1),
    (3, N'New York', 1, 1),
    (4, N'Tokyo', 1, 1),
    (4, N'Osaka', 1, 1),
    (5, N'Bangkok', 1, 1),
    (6, N'New South Wales', 1, 1),
    (7, N'London', 1, 1),
    (8, N'Ontario', 1, 1);
GO

INSERT INTO [dbo].[City] (StateProvinceId, CountryId, CityName, CreatedBy, UpdatedBy)
VALUES 
    (1, 1, N'Quận Hoàn Kiếm', 1, 1),
    (2, 1, N'Quận 1', 1, 1),
    (3, 3, N'San Francisco', 1, 1),
    (4, 3, N'New York City', 1, 1),
    (5, 4, N'Shinjuku', 1, 1),
    (6, 4, N'Osaka City', 1, 1),
    (7, 5, N'Bangkok City', 1, 1),
    (8, 6, N'Sydney', 1, 1),
    (9, 7, N'London City', 1, 1),
    (NULL, 2, 'Singapore', 1, 1);
GO

INSERT INTO [dbo].[Address] (AddressName, Street, CityId, StateProvinceId, CountryId, PostalCode, CreatedBy, UpdatedBy)
VALUES 
    (N'Văn phòng Hà Nội', N'123 Phố Huế', 1, 1, 1, '100000', 1, 1),
    (N'Nhà riêng TP.HCM', N'456 Lê Lợi', 2, 2, 1, '700000', 1, 1),
    (N'Văn phòng San Francisco', N'789 Market Street', 3, 3, 3, '94103', 1, 1),
    (N'Nhà riêng New York', N'101 5th Avenue', 4, 4, 3, '10001', 1, 1),
    (N'Văn phòng Shinjuku', N'202 Shibuya', 5, 5, 4, '150-0002', 1, 1),
    (N'Kho Osaka', N'303 Dotonbori', 6, 6, 4, '542-0071', 1, 1),
    (N'Cửa hàng Bangkok', N'404 Sukhumvit', 7, 7, 5, '10110', 1, 1),
    (N'Văn phòng Sydney', N'505 George Street', 8, 8, 6, '2000', 1, 1),
    (N'Showroom London', N'606 Oxford Street', 9, 9, 7, 'W1C 1AB', 1, 1),
    (N'Văn phòng Singapore', N'707 Orchard Road', 10, NULL, 2, '238859', 1, 1);
GO

INSERT INTO [dbo].[Account] (AccountName, Phone, Email, Fax, CompanyName, Website, CreatedBy, UpdatedBy)
VALUES 
    (N'Công ty ABC', '0123456789', 'abc@company.com', '0123456789', N'ABC Corp', 'www.abc.com', 1, 1),
    (N'Công ty XYZ', '0987654321', 'xyz@company.com', '0987654321', N'XYZ Ltd', 'www.xyz.com', 1, 1),
    (N'Công ty DEF', '1234567890', 'def@company.com', '1234567890', N'DEF Inc', 'www.def.com', 1, 1),
    (N'Công ty GHI', '2345678901', 'ghi@company.com', '2345678901', N'GHI Co', 'www.ghi.com', 1, 1),
    (N'Công ty JKL', '3456789012', 'jkl@company.com', '3456789012', N'JKL Group', 'www.jkl.com', 1, 1),
    (N'Công ty MNO', '4567890123', 'mno@company.com', '4567890123', N'MNO Enterprises', 'www.mno.com', 1, 1),
    (N'Công ty PQR', '5678901234', 'pqr@company.com', '5678901234', N'PQR Solutions', 'www.pqr.com', 1, 1),
    (N'Công ty STU', '6789012345', 'stu@company.com', '6789012345', N'STU Tech', 'www.stu.com', 1, 1),
    (N'Công ty VWX', '7890123456', 'vwx@company.com', '7890123456', N'VWX Innovations', 'www.vwx.com', 1, 1),
    (N'Công ty YZA', '8901234567', 'yza@company.com', '8901234567', N'YZA Systems', 'www.yza.com', 1, 1);
GO

INSERT INTO [dbo].[AccountAddress] (AccountId, AddressId, AddressTypeId, IsDefault, CreatedBy, UpdatedBy)
VALUES 
   
    (1, 1, 1, 1, 1, 1), 
    (1, 1, 2, 1, 1, 1), 
    (1, 2, NULL, 0, 1, 1), 
    (2, 2, 1, 1, 1, 1),
    (2, 3, 2, 1, 1, 1),
    (2, 4, NULL, 0, 1, 1),
    (3, 3, 1, 1, 1, 1), 
    (3, 3, 2, 1, 1, 1), 
    (3, 5, NULL, 0, 1, 1),
    (4, 4, 1, 1, 1, 1), 
    (4, 4, 2, 1, 1, 1),
    (4, 6, NULL, 0, 1, 1),
	(5, 5, 1, 1, 1, 1), 
    (5, 5, 2, 1, 1, 1), 
    (5, 7, NULL, 0, 1, 1), 
    (6, 6, 1, 1, 1, 1), 
    (6, 6, 2, 1, 1, 1), 
    (6, 8, NULL, 0, 1, 1),
    (7, 7, 1, 1, 1, 1), 
    (7, 7, 2, 1, 1, 1), 
    (7, 9, NULL, 0, 1, 1), 
    (8, 8, 1, 1, 1, 1),
    (8, 8, 2, 1, 1, 1),
    (8, 10, NULL, 0, 1, 1), 
    (9, 9, 1, 1, 1, 1), 
    (9, 9, 2, 1, 1, 1), 
    (9, 1, NULL, 0, 1, 1), 
    (10, 10, 1, 1, 1, 1),
    (10, 10, 2, 1, 1, 1),
    (10, 2, NULL, 0, 1, 1);
GO
