#!/Users/Naman/miniconda/bin/python

# importing standard modules
import re, inspect, os, sys, pdb;

# some boiler plate code.
poing = inspect.getabsfile(inspect.currentframe());
ee = execfile;
selfdir = os.path.dirname(poing);
#os.chdir(selfdir);

# start here..
sampS = "This is sparta";
sampL = ["Elon", "Musk", "Steve", "Jurvetson"];
sampD = {"Python": "is Great", "Tesla": "Motors"};

print "###############################"

# os.system("cut -f 2,5- -d\\  transposed.tped > "+transposed_removed_name)
print (os.getcwd())
#if len(sys.argv) < 3:
#	print "please enter the output name of the file"
#bfile_name = sys.argv[1]
#pdb.set_trace()

#transposed_file_name = "transposed"
#os.system("plink --bfile %s --recode --transpose --out %s" % (bfile_name, transposed_file_name))

transposed_file_name = "5snps"
eqtl_snp_file_name = "eqtl_snp_file"
openfile = open(transposed_file_name+".tped")
open_snp_file = open(eqtl_snp_file_name, "w")

counter = 0
for line in openfile:
    counter += 1

    splittedL = line.strip().split(" ")
    alternateL = splittedL[4:][::2]

    if counter == 1:
        individualL = ["ind"+str(index+1) for index, i in enumerate(alternateL)]
        individualS = "\t".join(individualL)
        open_snp_file.write("snpid\t"+individualS+"\n")

    lineS = "\t".join(splittedL[1:2] + alternateL)+"\n"
    open_snp_file.write(lineS)


open_snp_file.close()
openfile.close()
