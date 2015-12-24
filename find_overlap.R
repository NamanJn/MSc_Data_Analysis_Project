
e.set <- read.csv("raw_expression_matrix.csv",check.names=F,row.names=1)
link <- read.csv('../data/linkIDs.csv') # this is the IDs for both genome and GE data I need
fam <- read.table('perperson_and_snp_and_maf_and_hwe.fam') # this is the cleaned snp data file 
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

write.table(needed.exp.acute,"indexes_for_88ge_acute.txt",row.names=F,col.names=F,quote=F)
write.table(needed.gwas,"indexes_for_88gwas.txt",row.names=F,col.names=F,quote=F)
write.table(needed.clinical,"indexes_for_88clinical.txt",row.names=F,col.names=F,quote=F)

#----------#----------#----------#----------#----------#---------- 88 individual snp data.
# writing the 88 individuals needed. THis is for extraction the SNP data for these 88 individuals.
# this means 88 indviduals for the gene expression and also the clinical

individuals88_names = fam[needed.gwas,1:2]
write.table(individuals88_names, "88individuals_overlapping.txt", row.names=F,col.names=F,quote=F)

#----------#----------#----------#----------#----------#---------- 88 individual GE data.
# writing the ge for the 88 individuals
needed_exp_set = e.set[,needed.exp.acute]
ge_for_eqtl = cbind( geneid = rownames(needed_exp_set), needed_exp_set)
write.table( ge_for_eqtl, "88ge_for_eqtl.txt", sep="\t", quote=F, row.names=F)

#----------#----------#----------#----------#----------#---------- 88 individual age_and_gender data.

# writing the age and gender of the individuals for the eqtl analysis
#convert to 0 and 1s from "M" to "F"
levels(clinical$Gender) <- c(levels(clinical$Gender), "0")
levels(clinical$Gender) <- c(levels(clinical$Gender), "1")
clinical$Gender[clinical$Gender == "M"] <- "0"
clinical$Gender[clinical$Gender == "F"] <- "1"

# converting months to years. It rounds to the nearest integer.
#clinical[,5] = round(clinical[,5]/12)

# I am writing the file of the clinical data
pre_clinical = t(clinical[needed.clinical,c(3,5)])
clinical_for_eqtl = cbind(id = rownames(pre_clinical),pre_clinical)
write.table(clinical_for_eqtl,"88age_and_gender.txt",sep = "\t", quote=F,row.names=F)
