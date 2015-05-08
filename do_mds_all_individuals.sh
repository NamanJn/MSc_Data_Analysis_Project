
if [ ! -f mdsall.genome ]; then
	plink --bfile perperson_and_snp_and_maf --genome --out mdsall
fi

# Here I am doing a 2 dimensional mds. 
plink --bfile perperson_and_snp_and_maf --read-genome mdsall.genome --cluster --mds-plot 2 --out mdsall


