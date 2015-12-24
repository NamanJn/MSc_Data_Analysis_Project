library("ggplot2")

fam <- read.table('perperson_and_snp_and_maf_and_hwe.fam') # this is the cleaned snp data file
clinical <- read.csv('../data/clinical_data.csv')
#e.set <- read.csv("raw_expression_matrix.csv",check.names=F,row.names=1)

needed.clinical = read.table('indexes_for_88clinical.txt')
needed.gwas = read.table('indexes_for_88gwas.txt')
needed.clinical = needed.clinical[,1]
needed.gwas = needed.gwas[,1]
needed.exp.acute = read.table("indexes_for_88ge_acute.txt")

# this is the clinical data that is wanted
wanted_clinical = clinical[needed.clinical,]
individuals88_names = fam[needed.gwas,1:2]

# this is the gwas patients that are needed
readmds = read.table("mdsall.mds", header = T)
needed_gwas_for_mds = readmds[needed.gwas,]

# X and Y plots.
xs = needed_gwas_for_mds[,4]
ys = needed_gwas_for_mds[,5]
zs = needed_gwas_for_mds[,6]

raw_ethnicities = as.character(wanted_clinical$Ethnicity)
tmp <- strsplit( raw_ethnicities, ' ' ) # Note that this will only work if they are separated by spaces
ethnicities <- sapply( tmp, getElement, 3 )

# plotting the pc1 vs pc2
qplot( xs, ys, col = ethnicities)

pc1 = xs > 0.05
pc2 = ys < 0

europeans = c()
for (i in 1:length(pc1)){
  if (pc1[i] == T && pc2[i] == T){
    europeans = c(europeans,i)
  }
}

individuals27_names = needed_gwas_for_mds[europeans,1:2]
write.table(individuals27_names, "white_and_2mixed/25europeans_2mixed_names.txt", row.names = F, col.names = F, quote = F)

dataframe_for_highcharts = data.frame(xs,ys,zs,ethnicities)
dataframe_for_highcharts_sorted = dataframe_for_highcharts[order(dataframe_for_highcharts[,3]),]
write.table(dataframe_for_highcharts_sorted, "highcharts/for_python_highchart.txt", row.names = F, col.names = F, quote = F,sep="\t")


