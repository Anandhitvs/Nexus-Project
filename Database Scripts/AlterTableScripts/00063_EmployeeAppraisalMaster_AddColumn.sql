USE [PMSNexus_Appraisal]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='EmployeeAppraisalMaster' AND COLUMN_NAME = 'IsBUHeadApproved')
BEGIN
	ALTER TABLE [dbo].[EmployeeAppraisalMaster] ADD IsBUHeadApproved bit NULL DEFAULT (0) WITH VALUES 
	
END