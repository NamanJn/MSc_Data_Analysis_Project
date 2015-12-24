#!/bin/bash

for i in $(seq 22)
do
	#num_snps=$($PBS_ARRAY_INDEX*40000))
	num_snps=$((40000*$i))

	file_name=separate_snps/${num_snps}snps
	snp_file_name=27individualssnps_for_eqtl.txt

	head -n 1 $snp_file_name > $file_name 
	echo "$num_snps" # This is a print statement
	ending_line=$(($num_snps+1))
	starting_line=$(($num_snps+2-40000))

	# printing the appropriate lines
	sed -n $starting_line,${ending_line}p $snp_file_name  >> $file_name
done

# This is to tar the snps up for hpc 
archive_name=separate_snps
tar -zcvf ${archive_name}.tar.gz $archive_name/
