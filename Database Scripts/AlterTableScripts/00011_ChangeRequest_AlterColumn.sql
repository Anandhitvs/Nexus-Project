USE [PMSNexus_Projects]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='ChangeRequest' AND COLUMN_NAME = 'CRChanges')
BEGIN
	ALTER TABLE [dbo].[ChangeRequest] ADD CRChanges [varchar](max) NULL
END
GO