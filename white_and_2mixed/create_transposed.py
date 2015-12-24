#!/Users/Naman/miniconda/bin/python

# This file transposes the .raw file and makes it ready for eqtl analysis.

# importing standard modules
import re, inspect, os, sys;
import numpy as np

# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
os.chdir(selfdir);

file_name = sys.argv[1]
openfile = open(file_name+".raw")
readfile = openfile.read()
openfile.close()

lines2 = readfile.split("\n")[:-1]
line2 = lines2[-1].split(" ")

snpline2 = line2[6:]
counter = 0

array2d = []

for i in lines2:
	tempo = i.split(" ")
	array2d.append(tempo[0:1] + tempo[6:])


print counter
# Transposing the 2d array
transposed = zip(*array2d)

writefile = open(file_name+"snps_for_eqtl.txt","w")

for i in transposed:
	writefile.write("\t".join(i)+"\n" )

writefile.close()

