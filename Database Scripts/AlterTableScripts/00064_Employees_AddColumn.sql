USE [PMSNexus_Employees]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Employees' AND COLUMN_NAME = 'ProbationStatusId')
BEGIN
	ALTER TABLE [dbo].[Employees] ADD ProbationStatusId int NULL
END
GO