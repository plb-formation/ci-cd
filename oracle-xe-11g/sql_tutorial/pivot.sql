/*******************************************************************************
   Database :free 
   Script: pivot.sql
   Description: create des tables records et countries.
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
DROP TABLE IF EXISTS [records];

DROP TABLE IF EXISTS [countries];

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE [records]
(
    [id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [sport] CHAR(10)  NOT NULL,
    [country] CHAR(3)  NOT NULL,
    [place]   INTEGER NOT NULL,
    [type]   INTEGER NOT NULL,
    FOREIGN KEY ([place]) REFERENCES [countries] ([short])
                ON DELETE NO ACTION ON UPDATE NO ACTION

);

CREATE TABLE [countries]
(
    [name] CHAR(30) PRIMARY KEY  NOT NULL,
    [short] NVARCHAR(5) NOT NULL
);

/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO [countries] ([name], [short]) VALUES ('usa','usa');
INSERT INTO [countries] ([name], [short]) VALUES ('germany','ger');
INSERT INTO [countries] ([name], [short]) VALUES ('russia','rus');
INSERT INTO [countries] ([name], [short]) VALUES ('norway','nor');
INSERT INTO [countries] ([name], [short]) VALUES ('poland','pol');
INSERT INTO [countries] ([name], [short]) VALUES ('sweden','swe');

INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('ski','swe',1,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('ski','nor',2,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('ski','rus',3,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('luge','swe',1,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('luge','usa',2,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('luge','ger',3,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('bob','nor',1,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('bob','rus',2,1);
INSERT INTO [records] ([sport], [country],[place],[type]) VALUES ('bob','ger',3,1);


