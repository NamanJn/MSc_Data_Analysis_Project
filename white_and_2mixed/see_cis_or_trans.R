
eqtlconvfile = read.table("sorted27all_eqtl_results_conv.txt", header=T )
eqtlacutefile = read.table("sorted27all_eqtl_results_acute.txt",header=T)
genesfile = read.table("../geneID_to_geneName.txt", header = T, sep="\t")
genepositionsfile = read.table("gene_positions_build37.txt", header = T, sep="\t")

# downloaded from NCBI's SNP batch query.
snplocationfile = read.table("NCBI_acute_snp_results")

matchedconv = match( eqtlconvfile[,2] , genesfile[,6] )
convgeneids = as.character(genesfile[matchedconv,2])

matchedacute = match( eqtlacutefile[, 2] , genesfile[, 6] )
geneids = genesfile[matchedacute, 2]


required = match(geneids, genepositionsfile[,1])
genechromosome = as.character(genepositionsfile[required,3])

# removing the nucleotide suffix from the rs SNP name, for example rs42342341_A --> rs432432421
tmp <- strsplit( as.character(eqtlacutefile[,1]), '_' )
snps_in_results <- sapply( tmp, getElement, 1 )

snp_locations_index = match(snps_in_results, snplocationfile[,4])
rawsnpchromosome = as.character(snplocationfile[snp_locations_index,1])
snplocations = snplocationfile[snp_locations_index,]

for_qqman = data.frame("1","1","1")
#tmp <- strsplit( as.character(rawsnpchromosome[,1]), 'chr' )
#snpchromosome <- sapply( tmp, getElement, 2 )
counter = 0
for (i in 1:length(rawsnpchromosome)){
  #print(i)
  add_chr = paste("chr",genechromosome[i],sep="")
  #print(paste("ennotlkjt  ",add_chr,sep=""))
  #print(paste("This is the snp chromosome: ",rawsnpchromosome[i],sep=""))
  if( !is.na(rawsnpchromosome[i]) && rawsnpchromosome[i] == add_chr){
    print(add_chr)
    print(rawsnpchromosome[i])
	print("###############################")
   	print (snplocations[i,])
	print("##############################################################")
    print(genepositionsfile[required,][i,])
  
  for_qqman = rbind(for_qqman,as.character(c(snplocations[i,4],genechromosome[i],snplocations[i,2])))
    counter = counter + 1
  }
}

fraction_of_same_chromosome = counter/length(rawsnpchromosome)
print(fraction_of_same_chromosome)
