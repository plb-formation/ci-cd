/*******************************************************************************
   Database :free 
   Script: create_t.sql
   Description: create des tables t1 et t2.
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
DROP TABLE  t1;

DROP TABLE  t2;

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE t1
(
    t1_id INTEGER PRIMARY KEY NOT NULL,
    t1_name VARCHAR2(15)  NOT NULL
);

CREATE TABLE t2
(
    t2_id INTEGER PRIMARY KEY  NOT NULL,
    t2_val VARCHAR2(15)
);

/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO t1  VALUES (1, 'a');
INSERT INTO t1  VALUES (2, 'b');
INSERT INTO t1  VALUES (3, 'c');

INSERT INTO t2 VALUES (1, 'xxx');
INSERT INTO t2 VALUES (3, 'yyy');
INSERT INTO t2 VALUES (5, 'zzz');
