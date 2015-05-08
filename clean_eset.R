library(lumi)
library(limma)
library(glmnet)
library(MASS)
source('../scripts/functions.R')
filename <- "../data/sample_probe_profile_nobgsub_nonorm_23_03_15_GS_export_format_n=342 R2.txt"
#filename <- "../data/small_sample"
object <- lumiR(filename, detectionTh = 0.01, checkDupId = TRUE, QC = TRUE, columnNameGrepPattern = list('AVG_SIGNAL', se.exprs='BEAD_STD', detection='Detection', beadNum='Avg_NBEADS'), verbose = TRUE)

loc_control = "../data/control_probe_profile_for_nobgsub_nonorm_23_03_15 n=342 R2.txt"
object.c <- addControlData2lumi(loc_control,object)

lumi.x.N <- lumiN(lumiQ(lumiT(lumiB(object.c,"bgAdjust"), method='log')),method='rsn')

info <- "../data/sample_table_for_nobgsub_nonorm_23_03_15 n=342 R2.txt"
targets <- read.delim( file=info,  header=TRUE)

status = targets[match(as.vector(phenoData(lumi.x.N)@data[,1]),targets$Sample.ID),]
#sampleNames(lumi.x.N) <- status[,8]
e.set<-exprs(lumi.x.N)
write.csv(e.set,"raw_expression_matrix.csv")



