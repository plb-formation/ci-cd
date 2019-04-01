#! /usr/bin/env python


import cx_Oracle


ip= 'localhost' 
port = 11521
SID= 'XE'

dsn_tns = cx_Oracle.makedsn(ip,port,SID)

db = cx_Oracle.connect('monitor', 'qwertyuiop', dsn_tns)
print db.version

db.close()
