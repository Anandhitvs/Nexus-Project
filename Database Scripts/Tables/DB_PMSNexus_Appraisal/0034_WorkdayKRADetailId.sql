USE [PMSNexus_Appraisal]
GO

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='WorkdayKRA')
BEGIN
	CREATE TABLE [dbo].[WorkdayKRA](
	[WorkdayKRAId] [int] IDENTITY(1,1) NOT NULL,
	[WorkDayId] [int] NOT NULL,
	[WorkdayObjectiveId] [int] NOT NULL,
	[KRAName] [VARCHAR](500) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkdayKRAId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO