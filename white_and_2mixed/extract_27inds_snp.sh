#!/bin/bash

#plink --bfile ../overlap --keep 25europeans_2mixed_names.txt --recodeA --out 27individuals
plink --bfile ../overlap --keep 25europeans_2mixed_names.txt --make-bed --out 27individuals
#plink --bfile ../overlap --keep ../25europeans_2mixed_names.txt --recode --out 27individuals
