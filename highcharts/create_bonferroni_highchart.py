#!/Users/Naman/miniconda/bin/python

# importing standard modules
import re, inspect, os, sys;

# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
os.chdir(selfdir);

# start here..
samps = "This is sparta";
sampl = ["Elon","Musk","Steve","Jurvetson"];
sampd = {"Python":"is Great","Tesla":"Motors"};

import numpy as np

a=np.array(range(10,110,10))

p_values = [0.01, 0.025,0.05 ]

writefile = open("bonferroni_ready.txt","w")
writefile.write(str(list(a))+"\n")

for p_value in p_values:
	values = 1-(1-p_value)**a

	string_to_write = str([round(i,3) for i in list(values)])
	writefile.write("{ name:'%s',data:%s},\n" % (p_value,string_to_write))

writefile.close()
