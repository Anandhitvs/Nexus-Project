
USE [PMSNexus_Employees]
GO
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Skillset' AND COLUMN_NAME='SkillsetCategoryId')
BEGIN
		ALTER TABLE [dbo].[Skillset] ADD [SkillsetCategoryId] int NULL
END
GO
