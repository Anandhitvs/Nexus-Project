USE [PMSNexus_Appraisal]
Go
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='VersionDepartmentRoleMapping')

CREATE TABLE VersionDepartmentRoleMapping (
  VERSION_ID int NOT NULL,
  DEPT_ID int  NOT NULL,
  ROLE_ID int  NOT NULL,
  CREATED_BY int  NULL,
  CREATED_DATE datetime  NULL,
  UPDATED_BY int  NULL,
  UPDATED_DATE datetime  NULL,
  PRIMARY KEY (VERSION_ID,DEPT_ID,ROLE_ID)
  )
GO