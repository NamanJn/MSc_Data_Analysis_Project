#!/bin/bash

# saving the first 5 snps in the overlap.bim (which has 800K snps) 
head -n 5 ../overlap.bim | cut -f2 > 5snps_test_run.txt

# extracting the 5 snps and then creating the new bfiles  
plink --bfile ../overlap --extract 5snps_test_run.txt --make-bed --out 5snps

# now we are transposing the table to have the individuals as the columns.
# this --recode12 option converts the letters to numbers.
plink --bfile 5snps --recode12 --transpose --out 5snps


