

e.set <- read.csv("raw_expression_matrix.csv",check.names=F,row.names=1)
link <- read.csv('../data/linkIDs.csv')
fam <- read.table('../data/US-Kawasaki-186samples-gene-expression_build37.fam')
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

# writing the 89 individuals needed.
write.table(fam[needed.gwas,1:2],"89individuals_needed.txt",row.names=F,col.names=F)
needed_exp_set = e.set[,needed.exp.acute]
write.csv(needed_exp_set,"89_expression_set.csv",quote=F)