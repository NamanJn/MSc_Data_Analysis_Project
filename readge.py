#!/Users/Naman/miniconda/bin/python

# importing standard modules
import re, inspect, os, sys;

# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
os.chdir(selfdir);

# start here..
openfile = open("../data/sample_probe_profile_nobgsub_nonorm_23_03_15_GS_export_format_n=342 R2.txt")

readfile = openfile.read()


openfile.close()


splitted = readfile.split("\n")


need = splitted[7:]
