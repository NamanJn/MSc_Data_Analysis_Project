
# This script 

fileList=( overlap.bed 
overlap.fam 
overlap.bim 
age_and_gender.txt 
ge_for_eqtl.txt
)

for i in ${fileList[@]}
do
	echo "Copying $i over to the hpc ..." 
	scp $i nj1411@login.cx1.hpc.ic.ac.uk://home/nj1411
	
done 
