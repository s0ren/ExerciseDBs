/*
This script was created by Visual Studio on 13-02-2015 at 01:35.
Run this script on SM-MBP\SQLEXPRESS.Restaurent (sm-MBP\sm) to make it the same as SM-MBP\SQLEXPRESS.restaurant (sm-MBP\sm).
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[madewith] DROP CONSTRAINT [FK__madewith__ingred__276EDEB3]
ALTER TABLE [dbo].[madewith] DROP CONSTRAINT [FK__madewith__itemid__286302EC]
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__storeid__29572725]
ALTER TABLE [dbo].[partof] DROP CONSTRAINT [FK__partof__itemid__2A4B4B5E]
ALTER TABLE [dbo].[partof] DROP CONSTRAINT [FK__partof__mealid__2B3F6F97]
ALTER TABLE [dbo].[ingredients] DROP CONSTRAINT [FK__ingredien__vendo__267ABA7A]
ALTER TABLE [dbo].[vendors] DROP CONSTRAINT [FK__vendors__referre__2C3393D0]
INSERT INTO [dbo].[vendors] ([vendorid], [companyname], [repfname], [replname], [referredby]) VALUES (N'DNDRY', N'Don''s Dairy', N'Marla', N'Milker', N'VGRUS')
INSERT INTO [dbo].[vendors] ([vendorid], [companyname], [repfname], [replname], [referredby]) VALUES (N'EDDRS', N'Ed''s Dressings', N'Sam', N'Sauce', N'FRTFR')
INSERT INTO [dbo].[vendors] ([vendorid], [companyname], [repfname], [replname], [referredby]) VALUES (N'FLVCR', N'Flavorful Creams', N'Sherman', N'Sherbert', N'VGRUS')
INSERT INTO [dbo].[vendors] ([vendorid], [companyname], [repfname], [replname], [referredby]) VALUES (N'FRTFR', N'"Fruit Eating" Friends', N'Gilbert', N'Grape', N'FLVCR')
INSERT INTO [dbo].[vendors] ([vendorid], [companyname], [repfname], [replname], [referredby]) VALUES (N'SPWTR', N'Spring Water Supply', N'Gus', N'Hing', N'EDDRS')
INSERT INTO [dbo].[vendors] ([vendorid], [companyname], [repfname], [replname], [referredby]) VALUES (N'VGRUS', N'Veggies_R_Us', N'Candy', N'Corn', NULL)
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'CHESE', N'Cheese', N'scoop     ', 0.03, N'Milk           ', 150, N'DNDRY')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'CHIKN', N'Chicken', N'strip     ', 0.45, N'Meat           ', 120, N'DNDRY')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'CRUTN', N'Crouton', N'piece     ', 0.01, N'Bread          ', 400, N'EDDRS')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'GRAPE', N'Grape', N'piece     ', 0.01, N'Fruit          ', 300, N'FRTFR')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'LETUS', N'Lettuce', N'bowl      ', 0.01, N'Vegetable      ', 200, N'VGRUS')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'ORNG ', N'Orange', N'slice     ', 0.05, N'Fruit          ', 10, N'FRTFR')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'PICKL', N'Pickle', N'slice     ', 0.04, N'Vegetable      ', 800, N'VGRUS')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'SCTDR', N'Secret Dressing', N'ounce     ', 0.03, NULL, 120, NULL)
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'SODA ', N'Soda', N'glass     ', 0.69, NULL, 5000, N'SPWTR')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'TOMTO', N'Tomato', N'slice     ', 0.03, N'Fruit          ', 15, N'VGRUS')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'WATER', N'Water', N'glass     ', 0.06, NULL, NULL, N'SPWTR')
INSERT INTO [dbo].[ingredients] ([ingredientid], [name], [unit], [unitprice], [foodgroup], [inventory], [vendorid]) VALUES (N'WTRML', N'Watermelon', N'piece     ', 0.02, N'Fruit          ', NULL, N'FRTFR')
INSERT INTO [dbo].[items] ([itemid], [name], [price], [dateadded]) VALUES (N'CHKSD', N'Chicken Salad', 2.85, '19981113')
INSERT INTO [dbo].[items] ([itemid], [name], [price], [dateadded]) VALUES (N'FRPLT', N'Fruit Plate', 3.99, '20000902')
INSERT INTO [dbo].[items] ([itemid], [name], [price], [dateadded]) VALUES (N'FRTSD', N'Fruit Salad', 3.45, '20000506')
INSERT INTO [dbo].[items] ([itemid], [name], [price], [dateadded]) VALUES (N'GDNSD', N'Garden Salad', 0.99, '20010302')
INSERT INTO [dbo].[items] ([itemid], [name], [price], [dateadded]) VALUES (N'MILSD', N'Millennium Salad', NULL, '20020816')
INSERT INTO [dbo].[items] ([itemid], [name], [price], [dateadded]) VALUES (N'SODA ', N'Soda', 0.99, '20030206')
INSERT INTO [dbo].[items] ([itemid], [name], [price], [dateadded]) VALUES (N'WATER', N'Water', 0.00, '20020519')
INSERT INTO [dbo].[partof] ([mealid], [itemid], [quantity], [discount]) VALUES (N'CKSDS', N'CHKSD', 1, 0.02)
INSERT INTO [dbo].[partof] ([mealid], [itemid], [quantity], [discount]) VALUES (N'CKSDS', N'SODA ', 1, 0.10)
INSERT INTO [dbo].[partof] ([mealid], [itemid], [quantity], [discount]) VALUES (N'VGNET', N'FRTSD', 1, 0.01)
INSERT INTO [dbo].[partof] ([mealid], [itemid], [quantity], [discount]) VALUES (N'VGNET', N'GDNSD', 1, 0.03)
INSERT INTO [dbo].[partof] ([mealid], [itemid], [quantity], [discount]) VALUES (N'VGNET', N'WATER', 1, 0.00)
INSERT INTO [dbo].[meals] ([mealid], [name]) VALUES (N'CKSDS', N'Chicken N Suds      ')
INSERT INTO [dbo].[meals] ([mealid], [name]) VALUES (N'VGNET', N'Vegan Eatin''        ')
INSERT INTO [dbo].[stores] ([storeid], [address], [city], [state], [zip], [manager]) VALUES (N'#2STR', N'2222 2nd Ave.', N'Waco', N'TX', N'76798-7356', N'Greg Speegle')
INSERT INTO [dbo].[stores] ([storeid], [address], [city], [state], [zip], [manager]) VALUES (N'CASTR', N'4444 4th Blvd', N'San Francsico', N'CA', N'94101-4150', N'Greg Donahoo')
INSERT INTO [dbo].[stores] ([storeid], [address], [city], [state], [zip], [manager]) VALUES (N'FIRST', N'1111 Main St.', N'Waco', N'TX', N'76798     ', N'Jeff Donahoo')
INSERT INTO [dbo].[stores] ([storeid], [address], [city], [state], [zip], [manager]) VALUES (N'NDSTR', N'3333 3rd St.', N'Fargo', N'ND', N'58106     ', N'Jeff Speegle')
INSERT INTO [dbo].[stores] ([storeid], [address], [city], [state], [zip], [manager]) VALUES (N'NWSTR', NULL, NULL, N'TX', NULL, N'Man Ager')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 1, 1, N'CKSDS', 3.68, '20050126 14:02:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 1, 2, N'CHKSD', 2.85, '20050126 14:02:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 1, 3, N'SODA ', 0.99, '20050126 14:02:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 1, 4, N'GDNSD', 0.99, '20050126 14:02:49.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 2, 1, N'CHKSD', 2.85, '20050126 14:04:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 2, 2, N'SODA ', 0.99, '20050126 14:04:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 3, 1, N'CHKSD', 2.85, '20050126 14:05:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 3, 2, N'FRPLT', 3.99, '20050126 14:05:49.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'#2STR', 3, 3, N'GDNSD', 0.99, '20050126 14:06:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 1, 1, N'CHKSD', 2.85, '20050126 14:22:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 1, 2, N'GDNSD', 0.99, '20050126 14:22:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 2, 1, N'SODA ', 0.99, '20050126 14:23:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 2, 2, N'FRTSD', 3.45, '20050126 14:23:49.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 2, 3, N'SODA ', 0.99, '20050126 14:24:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 2, 4, N'VGNET', 4.38, '20050126 14:24:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 3, 1, N'VGNET', 4.38, '20050126 14:25:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 3, 2, N'FRPLT', 3.99, '20050126 14:25:49.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 3, 3, N'FRTSD', 3.45, '20050126 14:26:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 3, 4, N'WATER', 0.00, '20050126 14:26:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'CASTR', 3, 5, N'CHKSD', 2.85, '20050126 14:26:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'FIRST', 1, 1, N'FRTSD', 3.45, '20050126 13:46:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'FIRST', 1, 2, N'WATER', 0.00, '20050126 13:46:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'FIRST', 1, 3, N'WATER', 0.00, '20050126 13:46:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'FIRST', 2, 1, N'CHKSD', 2.85, '20050126 13:47:49.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'FIRST', 3, 1, N'SODA ', 0.99, '20050126 13:49:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'FIRST', 3, 2, N'FRPLT', 3.99, '20050126 13:49:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'FIRST', 3, 3, N'VGNET', 4.38, '20050126 13:49:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'NDSTR', 1, 1, N'WATER', 0.00, '20050126 14:14:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'NDSTR', 1, 2, N'FRPLT', 3.99, '20050126 14:14:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'NDSTR', 2, 1, N'GDNSD', 0.99, '20050126 14:15:34.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'NDSTR', 3, 1, N'VGNET', 4.38, '20050126 14:16:49.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'NDSTR', 3, 2, N'FRPLT', 3.99, '20050126 14:17:04.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'NDSTR', 3, 3, N'FRTSD', 3.45, '20050126 14:17:19.187')
INSERT INTO [dbo].[orders] ([storeid], [ordernumber], [linenumber], [menuitemid], [price], [time]) VALUES (N'NDSTR', 3, 4, N'SODA ', 0.99, '20050126 14:17:34.187')
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'CHKSD', N'CHESE', 2)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'CHKSD', N'CHIKN', 4)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'CHKSD', N'LETUS', 1)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'CHKSD', N'SCTDR', 1)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRPLT', N'CHESE', 10)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRPLT', N'CRUTN', 10)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRPLT', N'GRAPE', 10)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRPLT', N'ORNG ', 10)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRPLT', N'TOMTO', 8)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRPLT', N'WTRML', 10)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRTSD', N'GRAPE', 10)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'FRTSD', N'WTRML', 5)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'GDNSD', N'LETUS', 4)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'GDNSD', N'TOMTO', 8)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'SODA ', N'SODA ', 1)
INSERT INTO [dbo].[madewith] ([itemid], [ingredientid], [quantity]) VALUES (N'WATER', N'WATER', 1)
ALTER TABLE [dbo].[madewith]
    ADD FOREIGN KEY ([ingredientid]) REFERENCES [dbo].[ingredients] ([ingredientid])
ALTER TABLE [dbo].[madewith]
    ADD FOREIGN KEY ([itemid]) REFERENCES [dbo].[items] ([itemid])
ALTER TABLE [dbo].[orders]
    ADD FOREIGN KEY ([storeid]) REFERENCES [dbo].[stores] ([storeid])
ALTER TABLE [dbo].[partof]
    ADD FOREIGN KEY ([itemid]) REFERENCES [dbo].[items] ([itemid])
ALTER TABLE [dbo].[partof]
    ADD FOREIGN KEY ([mealid]) REFERENCES [dbo].[meals] ([mealid])
ALTER TABLE [dbo].[ingredients]
    ADD FOREIGN KEY ([vendorid]) REFERENCES [dbo].[vendors] ([vendorid])
ALTER TABLE [dbo].[vendors]
    ADD FOREIGN KEY ([referredby]) REFERENCES [dbo].[vendors] ([vendorid])
COMMIT TRANSACTION
