USE [PMSNexus_Employees]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Employees' AND COLUMN_NAME = 'DesignationId')
BEGIN
	ALTER TABLE [dbo].[Employees] ADD DesignationId int NULL
END
GO

