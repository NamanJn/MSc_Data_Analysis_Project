# This script copies over the files for performing the eqtl
# on the HPC


fileList=( 
#overlap.bed 
#overlap.fam 
#overlap.bim 
#age_and_gender.txt 
#ge_for_eqtl.txt
#overlapsnps_for_eqtl.txt
#5snps_test_run/example_eqtl.R
#5snps_test_run/create_eqtl_snp_file.py 
#5snps_test_run/create_5snps_for_test_run.sh
#../data/HumanHT-12_V4_small_with_controls.txt                                      
################################ Below is the 27 individual data
#white_and_2mixed/27individualssnps_for_eqtl.txt
#white_and_2mixed/27eqtl_results
white_and_2mixed/27agegenderpcs_for_eqtl.txt
white_and_2mixed/27ge_for_eqtl_acute.txt

white_and_2mixed/separate_snps.tar.gz
white_and_2mixed/27ge_for_eqtl_conv.txt

)

which_folder=27individuals
for i in ${fileList[@]}
do
	echo "Copying $i over to the hpc ..." 
	scp $i nj1411@login.cx1.hpc.ic.ac.uk://home/nj1411/$which_folder/
done 

