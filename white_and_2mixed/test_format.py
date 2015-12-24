#!/Users/Naman/miniconda/bin/python

# importing standard modules
import re, inspect, os, sys;

# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
os.chdir(selfdir);


openfile = open("27ge_for_eqtl.txt")
readfile = openfile.read()

splitted = readfile.split('\n')

if splitted[-1] == "":
	print "yes last one is an empty line, so deleting now"
	splitted = splitted[:-1]

for i in splitted:
	tabsplit = i.split("\t")
	if len(tabsplit) != 28:
		print "dam"
		print "ok so something is wrong."
