USE [PMSNexus_Employees]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Employees' AND COLUMN_NAME = 'EmployeeCategoryId')
BEGIN
	ALTER TABLE [dbo].[Employees] ADD EmployeeCategoryId int NULL
END
GO