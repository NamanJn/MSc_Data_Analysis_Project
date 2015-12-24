#!/Users/Naman/miniconda/bin/python

# importing standard modules
import re, inspect, os, sys;
import json
# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
os.chdir(selfdir);

# start here..
samps = "This is sparta";
sampl = ["Elon","Musk","Steve","Jurvetson"];
sampd = {"Python":"is Great","Tesla":"Motors"};

eqtlf = open("first500")
eqtls = eqtlf.read()
eqtll = eqtls.split("\n")[:-1]
eqtlf.close()


eqtll2 = [ i.split("\t") for i in eqtll]
dynof = open("dyno_compatible","w")
for il in eqtll2:
	tempd = {}
	tempd["snp"] = il[0]
	tempd["gene"] = il[1]
	tempd["pvalue"] = il[2]
	dynof.write(json.dumps(tempd)+",\n")

dynof.close()

