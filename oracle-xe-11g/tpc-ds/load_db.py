#! /usr/bin/python3 

import glob, os
for file in glob.glob("*.ctl"):
   if file == "dbgen_version.ctl" : 
      pass
   else: 
     logfile = file.replace(".ctl",".log")
     cmd = 'sqlldr userid=tpcds/p4ssw0rd control={} log={}'.format(file,logfile)
     os.system(cmd)

