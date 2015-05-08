#!/bin/bash

plink --bfile perperson_and_snp_and_maf --keep 88individuals_overlapping.txt --make-bed --out overlap

