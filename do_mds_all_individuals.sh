
if [ ! -f mdsall.genome ]; then
	plink --bfile perperson_and_snp_and_maf_and_hwe --genome --out mdsall
fi

# Here I am doing a 3 dimensional mds. 
plink --bfile perperson_and_snp_and_maf_and_hwe --read-genome mdsall.genome --cluster --mds-plot 3 --out mdsall


