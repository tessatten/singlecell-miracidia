## usage: Rscript topGO.R [gene ids] [CC/BP/MF]

library("topGO")

# this is the file containing gene IDs
args = commandArgs(trailingOnly=TRUE)
ids <- read.table(args[1], header=F)
#ids <- read.table("pzq.genes", header=F)
myGenes <- as.character(ids$V1)

ndSize <- 5
goCat <- args[2] #'CC', 'BP' and 'MF'
nTerms <-50 # number of terms to write out (or only show significant ones)

# GO annotation file
refGO <- read.table(file="/Users/ta13/R_git/GOterm_dict_WBPS18.txt", sep=" ", stringsAsFactor=F) 
# 
# Smp_000030 GO:0000502,GO:0005488,GO:0030234,GO:0042176
# Smp_000040 GO:0003777,GO:0005515,GO:0005871
#
names(refGO) = c('id', 'go')
ref.vec = strsplit(refGO$go, split=',', fixed=T)
names(ref.vec) <- refGO$id
refGO$id
allAnnotated <- read.table(file="/Users/ta13/R_git/filtered_v10_miracidia/v10_GO_genelists/allGenesInMira.csv", stringsAsFactor=F)
allAnnotated <- allAnnotated$V1
geneList <- factor(as.integer(allAnnotated %in% myGenes))
names(geneList) <- allAnnotated

myGOdata <- new("topGOdata",
		description = "topGO",
		ontology = goCat,
		allGenes = geneList, 
		annot = annFUN.gene2GO,
		gene2GO = ref.vec,
		nodeSize = ndSize, 
)

myGOdata

#resultClassic <- runTest(myGOdata, algorithm="classic", statistic="Fisher") # classic algorithm doesn't consider GO hierarchy
resultTopgo <- runTest(myGOdata,algorithm="weight01",statistic="Fisher") # 

resultTopgo

allRes <- GenTable(
  myGOdata,
#  classic = resultClassic,
  topGO = resultTopgo, 
  orderBy = "topGO",
  ranksOf = "topGO",
  topNodes = nTerms 
)

# add column with genes; add to table
allRes$genes <- sapply(allRes$GO.ID, function(x)
    {
      genes<-genesInTerm(myGOdata, x) 
      genes[[1]][genes[[1]] %in% myGenes]
    })

# convert the gene list to a character vector
allRes$genes <-vapply(allRes$genes, paste, collapse = ",", character(1L))
# only write significant terms
allRes<-subset(allRes, as.numeric(allRes[,"topGO"])<0.05 | grepl("<", allRes[,"topGO"]))
outfile <- paste("topgo_", args[1], "_", goCat, "_", ndSize, ".txt", sep="")
write.table(allRes, outfile,sep="\t", quote=F, row.names = F) #

