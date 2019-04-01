/*******************************************************************************
   Database :free 
   Script: coalesce.sql
   Description: create des tables records et wages.
   DB Server: Sqlite
   Author: Herve Meftah
   License: GPL
********************************************************************************/

/*******************************************************************************
   Drop Foreign Keys Constraints
********************************************************************************/


/*******************************************************************************
   Drop Tables
********************************************************************************/
DROP TABLE IF EXISTS [wages];


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE [wages]
(
    [id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
    [hourly_wage] NUMERIC(8,2) NULL,
    [salary]      NUMERIC(8,2) NULL,
    [commission]  NUMERIC(8,2) NULL,
    [num_sales]   INTEGER  NULL
);

/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO [wages] ([hourly_wage]) VALUES (10.00);
INSERT INTO [wages] ([hourly_wage]) VALUES (20.00);
INSERT INTO [wages] ([hourly_wage]) VALUES (30.00);
INSERT INTO [wages] ([hourly_wage]) VALUES (40.00);

INSERT INTO [wages] ([salary]) VALUES (10000.00);
INSERT INTO [wages] ([salary]) VALUES (20000.00);
INSERT INTO [wages] ([salary]) VALUES (30000.00);
INSERT INTO [wages] ([salary]) VALUES (40000.00);

INSERT INTO [wages] ([commission],[num_sales]) VALUES (1500.00,3);
INSERT INTO [wages] ([commission],[num_sales]) VALUES (2500.00,2);
INSERT INTO [wages] ([commission],[num_sales]) VALUES (2000.00,6);
INSERT INTO [wages] ([commission],[num_sales]) VALUES (1400.00,4);

