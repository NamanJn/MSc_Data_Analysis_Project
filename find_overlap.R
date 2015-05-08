
e.set <- read.csv("raw_expression_matrix.csv",check.names=F,row.names=1)
link <- read.csv('../data/linkIDs.csv') # this is the IDs for both genome and GE data I need
fam <- read.table('perperson_and_snp_and_maf.fam') # this is the cleaned snp data file 
clinical <- read.csv('../data/clinical_data.csv')
# taking o
#yeses = subset(link_file,subset=link_file[,3] == "Yes")


exp.labels <- colnames(e.set) # getting the study id of the patients.
tmp <- strsplit( as.character(fam[,2]), '_0' )
gwas.labels <- sapply( tmp, getElement, 1 )

ptr.exp.acute <- match(paste(as.character(link[,2]),'A',sep=''),exp.labels)
ptr.exp.conv <- match(paste(as.character(link[,2]),'C',sep=''),exp.labels)
ptr.gwas <- match(as.character(link[,1]),gwas.labels)
ptr.clinical <- match(as.character(link[,2]), clinical$Study.No.)

ptr.overlap <- which( !is.na(ptr.exp.acute) & !is.na(ptr.gwas) & !is.na(ptr.clinical) )
needed.exp.acute <- ptr.exp.acute[ptr.overlap]
needed.exp.conv <- ptr.exp.conv[ptr.overlap]
needed.gwas <- ptr.gwas[ptr.overlap]
needed.clinical <- ptr.clinical[ptr.overlap]

# writing the 88 individuals needed. this means 88 indviduals for the gene expression and 
write.table(fam[needed.gwas,1:2],"88individuals_overlapping.txt",row.names=F,col.names=F,quote=F)
needed_exp_set = e.set[,needed.exp.acute]
#write.csv(needed_exp_set,"88_expression_set.csv",quote=F)

ge_for_eqtl = cbind(geneid=rownames(needed_exp_set),needed_exp_set)
write.table(ge_for_eqtl,"ge_for_eqtl.txt",sep="\t",quote=F,row.names=F)

# writing the age and gender of the individuals for the eqtl analysis
# still need to change M=1 and F=2, also to put the 

pre_clinical = t(clinical[needed.clinical,c(3,5)])
#rownames(pre_clinical) = c("sex")
#colnames(pre_clinical) = 1:length(pre_clinical)
clinical_for_eqtl = cbind(id=rownames(pre_clinical),pre_clinical)
write.table(clinical_for_eqtl,"age_and_gender.txt",sep="\t",quote=F,row.names=F)
