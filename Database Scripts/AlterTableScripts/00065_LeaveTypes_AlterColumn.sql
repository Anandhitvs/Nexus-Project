
USE [PMSNexus_Leaves]
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='LeaveTypes' AND COLUMN_NAME = 'LeaveAccruedMonthly')
BEGIN
	EXEC sp_RENAME 'LeaveTypes.LeaveAccruedMonthly','LeaveAccruedType','COLUMN'
END
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='LeaveTypes' AND COLUMN_NAME = 'LeaveAccruedLastDay')
BEGIN
	EXEC sp_RENAME 'LeaveTypes.LeaveAccruedLastDay','LeaveAccruedDay','COLUMN'
END
GO