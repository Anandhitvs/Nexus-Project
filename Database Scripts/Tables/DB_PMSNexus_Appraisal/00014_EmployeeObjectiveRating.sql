USE [PMSNexus_Appraisal]
Go
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='EmployeeObjectiveRating')

CREATE TABLE EmployeeObjectiveRating (
  APP_CYCLE_ID int NOT NULL,
  EMPLOYEE_ID int NOT NULL,
  OBJECTIVE_ID int NOT NULL,
  OBJECTIVE_MAX_RATING decimal(18,2) NULL,
  OBJECTIVE_RATING decimal(18,2) NULL,
  CREATED_BY int  NULL,
  CREATED_DATE datetime  NULL,
  UPDATED_BY int  NULL,
  UPDATED_DATE datetime  NULL,
  PRIMARY KEY (APP_CYCLE_ID,EMPLOYEE_ID,OBJECTIVE_ID)
  )
GO