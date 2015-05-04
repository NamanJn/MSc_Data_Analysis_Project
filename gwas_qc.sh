#!/bin/bash
# i need to change this to start linking the file after doing the missingness on the gwas data.
plink --bfile ../data/US-Kawasaki-186samples-gene-expression_build37 --mind 0.05 --out mind
#plink --bfile 89individuals --mind 0.05 --out mind 

plink --bfile ../data/US-Kawasaki-186samples-gene-expression_build37 --remove mind.irem --make-bed --out perperson 
plink --bfile perperson --geno 0.05 --make-bed --out perperson_and_snp 
rm perperson.*

