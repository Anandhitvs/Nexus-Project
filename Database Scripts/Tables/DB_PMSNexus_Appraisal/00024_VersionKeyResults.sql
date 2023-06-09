USE [PMSNexus_Appraisal]
Go
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='VersionKeyResults')

CREATE TABLE VersionKeyResults (
  VERSION_ID int NOT NULL,
  DEPT_ID int NOT NULL,
  ROLE_ID int NOT NULL,
  OBJECTIVE_ID int NOT NULL,
  KEY_RESULT_ID int NOT NULL,
  KEY_RESULT_WEIGHTAGE decimal (18,2) NULL,
  BENCHMARK_TYPE int NULL,
  BENCHMARK_UITYPE int NULL,
  BENCHMARK_DURATION int NULL,
  BENCHMARK_OPERATOR int NULL,
  BENCHMARK_VALUE decimal (18,2) NULL,
  BENCHMARK_FROM_VALUE decimal (18,2) NULL,
  BENCHMARK_TO_VALUE decimal (18,2) NULL,
  CREATED_BY int NOT NULL,
  CREATED_DATE datetime NOT NULL,
  UPDATED_BY int NOT NULL,
  UPDATED_DATE datetime NOT NULL,
  PRIMARY KEY (VERSION_ID,DEPT_ID,ROLE_ID,OBJECTIVE_ID,KEY_RESULT_ID)
  )
GO
