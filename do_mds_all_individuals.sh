plink --bfile perperson_and_snp_and_maf --genome --out mdsall


# Here I am doing a 2 dimensional
plink --bfile mydata --read-genome mdsall.genome --cluster --mds-plot 2




