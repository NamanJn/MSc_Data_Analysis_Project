
e.set <- read.csv("../raw_expression_matrix.csv",check.names=F,row.names=1)
ids <- read.table('famids.txt') # this is the cleaned snp data file.
clinical <- read.csv('../../data/clinical_data.csv')
mds <- read.table("../mdsall.mds",header=T)

# This is gene expression stuff
exp.labels <- colnames(e.set) # getting the study id of the patients.

# We are assuming that we do not have to use the link file  

tmp <- strsplit( as.character(mds[,2]), '_0' )
mds.labels <- sapply( tmp, getElement, 1 )
mds_ids = substr(mds.labels, 8 , 11) # this is where I am extracting the id 

needed.exp.acute <- match( paste(as.character(ids[,1]),'A',sep=''), exp.labels)
needed.exp.conv <- match( paste(as.character(ids[,1]),'C',sep=''), exp.labels)
needed.pcs <- match( as.character(ids[,1]), mds_ids )

needed_exp_set = e.set[,needed.exp.acute]
needed_exp_set_conv = e.set[,needed.exp.conv]
needed_pcs <- mds[needed.pcs,]

ge_for_eqtl = cbind( geneid = rownames(needed_exp_set), needed_exp_set)
ge_for_eqtl_conv = cbind( geneid = rownames(needed_exp_set_conv), needed_exp_set_conv)

write.table( ge_for_eqtl, "27ge_for_eqtl_acute.txt", sep="\t", quote=F, row.names=F)
write.table( ge_for_eqtl_conv, "27ge_for_eqtl_conv.txt", sep="\t", quote=F, row.names=F)

# THis is clinical stufff
needed.clinical <- match( ids[,1], clinical$Study.No.)
levels(clinical$Gender) <- c(levels(clinical$Gender), "0")
levels(clinical$Gender) <- c(levels(clinical$Gender), "1")
clinical$Gender[clinical$Gender == "M"] <- "0"
clinical$Gender[clinical$Gender == "F"] <- "1"

# converting months to years. It rounds to the nearest integer. I AM NOT DOING THIS NOW
#clinical[,5] = round(clinical[,5]/12)
  
pre_clinical = t(clinical[needed.clinical,c(3,5)])
clinical_for_eqtl = cbind(id = rownames(pre_clinical),pre_clinical)

# adding principal components as well
age_gender_pcs=rbind(c("PC1", needed_pcs[,4]) ,clinical_for_eqtl)
age_gender_pcs=rbind(c("PC2", needed_pcs[,5]) ,age_gender_pcs)
write.table(age_gender_pcs,"27agegenderpcs_for_eqtl.txt", sep = "\t", quote = F, row.names = F)
