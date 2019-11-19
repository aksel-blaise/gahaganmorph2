# load geomorph
devtools::install_github("geomorphR/geomorph", ref = "Stable", build_vignettes = TRUE)
library(geomorph)

# set working directory
setwd(getwd())
source('readmulti.csv.R')

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
# plot consensus configuration in 2D to illustrate axial twisting
par(mfrow=c(1,3))
plot(Y.gpa$consensus[,c("Y", "X")], pch=20)
plot(Y.gpa$consensus[,c("Z", "X")], pch=20)
plot(Y.gpa$consensus[,c("Z", "Y")], pch=20)
# quantify global integration relative to self-similarity (Bookstein 2015)
globalIntegration(Y.gpa$coords)
### analyses
gdf<-geomorph.data.frame(shape=Y.gpa$coords, size=Y.gpa$Csize, region=qdata$region) # geomorph data frame
csz<-Y.gpa$Csize # attribute for boxplot
rgn<-qdata$region # attribute for boxplot
# boxplot of central Texas and southern Caddo area Gahagan bifaces by centroid size
boxplot(csz~rgn, 
        main = "Centroid size of Gahagan bifaces by Region",
        names = c("Central Texas", "Southern Caddo Area"),
        xlab = "Region",
        ylab = "Centroid Size",
        col = c("dodgerblue4","indianred4")
)
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

# define models
fit.rsize<-procD.lm(size ~ region, data = gdf, print.progress = FALSE, iter = 9999)
fit.size<-procD.lm(shape ~ size, data = gdf, print.progress = FALSE, iter = 9999)
fit.region<-procD.lm(shape ~ region, data = gdf, print.progress = FALSE, iter = 9999)
fit.unique<-procD.lm(shape ~ size * region, data = gdf, print.progress = FALSE, iter = 9999)
fit.common<-procD.lm(shape ~ size + region, data = gdf, print.progress = FALSE, iter = 9999)

summary(fit.common)
summary(fit.unique)
# allometry: does shape change with size?  
anova(fit.size)
plot(fit.size, type = "regression", reg.type = "RegScore", predictor = log(gdf$size), pch = shapes, col = colors)
# common allometric component (Mitteroecker 2004)
plotAllometry(fit.size, size = gdf$size, logsz = TRUE, method = "CAC", pch = shapes, col = colors)
# size-shape PCA (Mitteroecker 2004)
plotAllometry(fit.region, size = gdf$size, logsz = TRUE, method = "size.shape", pch = shapes, col = colors)
# do Gahagan biface forms from different regions express parallel, convergent, or divergent morphological characteristics?
form<-plotAllometry(fit.unique, size = gdf$size, logsz = TRUE, method = "PredLine", pch = shapes, col = colors)
picknplot.shape(form)
anova(fit.common, fit.unique, print.progress = FALSE)

# ANOVA: do Gahagan biface shapes differ by region?
anova(fit.region)

# morphological disparity: do either of the groups display greater shape variation among individuals relative to the other group?
morphol.disparity(fit.region, groups = qdata$region, data = gdf, print.progress = FALSE, iter = 9999)

#subset landmark coordinates to produce mean shapes for groups
new.coords<-coords.subset(A = Y.gpa$coords, group = qdata$region)
names(new.coords)
#group shape means
mean<-lapply(new.coords, mshape)
plot(mean$CTX)
plot(mean$SCA)
plotRefToTarget(mean$SCA,mean$CTX, method="vector",mag=2)
