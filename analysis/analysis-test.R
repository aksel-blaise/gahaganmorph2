# load geomorph
devtools::install_github("geomorphR/geomorph", ref = "Stable", build_vignettes = TRUE)
library(geomorph)

# set working directory
setwd(getwd())
source('readmulti.csv.r')

# read .csv files
setwd("./data")
filelist <- list.files(pattern = ".csv")
coords<-readmulti.csv(filelist)
setwd("../")

# read qualitative data
qdata<-read.csv("qdata.csv",header=TRUE, row.names=1)
qdata<-qdata[match(dimnames(coords)[[3]],rownames(qdata)),]

Y.gpa<-gpagen(coords, PrinAxes = TRUE)
plot(Y.gpa)
# quantify global integration relative to self-similarity (Bookstein 2015)
globalIntegration(Y.gpa$coords)
### analyses
gdf<-geomorph.data.frame(shape=Y.gpa$coords, size=Y.gpa$Csize, region=qdata$region) # geomorph data frame
csz<-Y.gpa$Csize # attribute for boxplot
rgn<-qdata$region # attribute for boxplot
# principal components analysis
PCA<-gm.prcomp(Y.gpa$coords)
summary(PCA)

# set plot parameters
colors <- c("dodgerblue4","indianred4") # baseball colors, naturally
colors <- colors[as.numeric(qdata$region)]
shapes <- c(2,4) # open triangle (ctx) and X (sca)
shapes <- shapes[as.numeric(qdata$region)]

# plotPCA
PCAplot<-plot(PCA, col = colors, pch = shapes)
picknplot.shape(PCAplot)