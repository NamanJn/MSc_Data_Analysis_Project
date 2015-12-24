#!/Users/Naman/miniconda/bin/python

# This file just prints out the id of the individual ids from the 27individuals.fam
# importing standard modules
import re, inspect, os, sys;

# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
os.chdir(selfdir);


openfile = open("27individuals.fam")
readfile = openfile.read() 
openfile.close()
splitted = readfile.split("\n")

if splitted[-1] == "":
	splitted = splitted[:-1]

sdf = [ i.split(" ") for i in splitted ]

ids = [ i[1][7:11] for i in sdf ] 
writeids = open("famids.txt","w")
writeids.write("\n".join(ids))
writeids.close()


#openclinical = open("../../data/clinical_data.csv")
#readclinical = openclinical.read() 
#openclinical.close()
#
#csplitted = readclinical.split("\n")[1:-1]
#
#ccsv = [ i.split(",") for i in csplitted ] 
#
#study_age_gender = []
#genderdict = {"M":"0","F":"1"}
#
#for i in ccsv:
#	gender = genderdict[i[2]]
#	age = int(float(i[4])/12.0)
#	study_age_gender.append([i[0],age,gender])
#
#cstudyno =  [ i[0] for i in study_age_gender ] 
#
#mapping = []
#
#writefile = open("27agegender","w")
#
#for i in ids:
#
#	theIndex = cstudyno.index(i)
#	mapping.append(theIndex)
#	writefile.write("a")
#
#writefile.close()
