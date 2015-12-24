#!/Users/Naman/miniconda/bin/python

# importing standard modules
import re, inspect, os, sys;

# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
os.chdir(selfdir);


openfile = open("for_python_highchart.txt")
readfile = openfile.read()
openfile.close()
splitted = readfile.split("\n")[:-1]
tabsplit = [i.split("\t") for i in splitted]

ethnic_dict =  {}

for i in tabsplit:
	ethnicity = i[-1].split(" ")[0]
	datapoints = [[float(i[0]),float(i[1]),float(i[2])]]
	#datapoints = [[float(i[0]),float(i[1])]]
	if ethnic_dict.get(ethnicity) == None:
		ethnic_dict[ethnicity] = datapoints
	else:
		ethnic_dict[ethnicity] = ethnic_dict.get(ethnicity) + datapoints

ethnic_dict["East Asian"] = ethnic_dict.pop("Asian")

writefile = open("highcharts_compatible.txt","w")

colors = ["red","purple","pink","blue","orange"]
counter = 0
sorted_ethnic = sorted(ethnic_dict.keys())

for i in sorted_ethnic:
	writefile.write("{ name: '%s', color: '%s', data: \n" % (i,colors[counter]) )
	writefile.write( str(ethnic_dict[i]) )
	#for j in ethnic_dict[i]:
		#writefile.write("[%s,%s]," % (j[0],j[1]) )
	writefile.write("},\n")
	counter += 1

writefile.close()
