
#eqtlconvfile = read.table("sorted27all_eqtl_results_conv.txt", header=T )
eqtlacutefile = read.table("../white_and_2mixed/sorted27all_eqtl_results_acute.txt",header=T)
genesfile = read.table("../geneID_to_geneName.txt", header = T, sep="\t")
#genepositionsfile = read.table("gene_positions_build37.txt", header = T, sep="\t")

# downloaded from NCBI's SNP batch query.
#snplocationfile = read.table("6788snps_of_acute_eqtl.txt")
  
#matchedconv = match( eqtlconvfile[,2] , genesfile[,6] )
#convgeneids = as.character(genesfile[matchedconv,2])

matchedacute = match( eqtlacutefile$gene , genesfile$Array_Address_Id )
geneids = genesfile[matchedacute, 2]

# removing the nucleotide suffix from the rs SNP name, for example rs42342341_A --> rs432432421
tmp <- strsplit( as.character(eqtlacutefile[,1]), '_' )
snps_in_results <- sapply( tmp, getElement, 1 )

new_data = data.frame(snps_in_results, geneids, eqtlacutefile$p.value)


first_500 = new_data[1:500,]

write.table(first_500,"first500",sep="\t",quote=F,row.names=F,col.names=F)



