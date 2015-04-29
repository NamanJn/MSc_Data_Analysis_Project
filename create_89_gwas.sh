#!/bin/bash
# i need to change this to start linking the file after doing the missingness on the gwas data.
plink --bfile ../data/US-Kawasaki-186samples-gene-expression_build37 --keep 89_gwas.txt --make-bed --out 89individuals
plink --bfile 89individuals --mind 0.05 --out mind 

plink --bfile 89individuals --remove mind.irem --make-bed --out 88individuals 
plink --bfile 88individuals --geno 0.05 --make-bed --out 47k_removed_snps 

