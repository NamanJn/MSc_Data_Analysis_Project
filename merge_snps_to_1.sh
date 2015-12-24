#!/bin/bash

plink --bfile $1 --recodeA --out $1

python create_transposed.py $1

