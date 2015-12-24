#!/bin/bash


plink --bfile ../data/US-Kawasaki-186samples-gene-expression_build37 --mind 0.05 --geno 0.05 --maf 0.05 --hwe 0.01 --make-bed --out perperson_and_snp_and_maf_and_hwe



