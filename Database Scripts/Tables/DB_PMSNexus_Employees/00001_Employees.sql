IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Employees')
	CREATE TABLE [dbo].[Employees](
		[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
		[FirstName] [varchar](100) NULL,
		[LastName] [varchar](100) NULL,			
		[EmployeeName] [varchar](200) NULL,			
		[FormattedEmployeeId] [varchar](100) NULL,			
		[EmailAddress] [varchar](100) NULL,
		[EmployeeTypeId] [int] Null,
		[DepartmentId] [int] Null,
		[RoleId] [int] Null,
		[DateOfJoining] [datetime] NULL,
		[DateOfContract] [datetime] NULL,
		[ContractEndDate] [datetime] NULL,
		[DateOfRelieving] [datetime] NULL,
		[ReportingManagerId] [int] Null,
		[IsActive] [bit] Null,
		[Gender] [varchar](10) NULL,
		[LocationId] [int] NULL,
		[CurrentWorkLocationId] [int] NULL,
		[CurrentWorkPlaceId] [int] NULL,
		[IsSpecialAbility] [bit] NULL,
		[SpecialAbilityId] [int] NULL,
		[SpecialAbilityRemark] [varchar](max) NULL,
		[DesignationId] [int] NULL,
		[DesignationEffectiveFrom] [datetime] NULL,
		[ActualConfirmationDate] [datetime] NULL,
		[MergerDate] [datetime] NULL,
		[EmployeeGrade] [int] NULL,
		[ProbationExtension] [datetime] NULL,		
		[PreviousExperience] [decimal](18,2) NULL,
		[OfficialMobileNumber] [varchar](2000) NULL,
		[BirthDate]  [datetime] NULL,
		[WeddingAnniversary] [datetime] NULL,
		[Maritalstatus] [varchar](10) NULL,
		[JobTitle] [varchar](500) NULL,
		[Mobile] [varchar](500) NULL,
		[EmployeeCategoryId] [int] NULL,
	    [ProbationStatusId] [int] Null,
		[CreatedOn] [datetime] NULL,
		[ModifiedOn] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[ModifiedBy] [int] NULL,
        [SystemRoleId] [int] NULL,		
		[ExitType] [nvarchar](250) NULL,
		[ResignationDate] [datetime] NULL,
		[RetirementDate] [datetime] NULL,
		[NoticePeriod] [int] NULL,
		[ResignationReason] [nvarchar](max) NULL,
		[ResignationStatus] [nvarchar](250) NULL,
		[Entity] [int] NULL,
		[IsResign] [bit] Null,
		[SourceOfHireId] [int] NULL,
		[ProfilePicture] [nvarchar](max) NULL
	PRIMARY KEY CLUSTERED 
	(
		[EmployeeID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO
 