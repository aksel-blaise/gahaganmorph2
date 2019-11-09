Geometric morphometric analysis of Gahagan bifaces
================
Robert Z. Selden, Jr.
November 9, 2019

### Introduction

This document includes supplemental materials for the article, “Shape
difference or shape change? Inter-regional variation in Gahagan biface
morphology.” The study represents the first formal morphological
analysis to assess inter-regional variability in Gahagan biface shape.
This effort follows a recent 2D analysis of Gahagan biface shapes within
the southern Caddo area (Selden Jr., Dockall, and Shafer 2018), where
Gahgagan bifaces were found to differ in shape across the same geography
as the Smithport Plain and Hickory Engraved bottles (Selden Jr. 2018a,
2018b, 2019a, 2019b). The analysis builds upon previous discussions and
analyses conducted by Shafer (1973, 1974, 2006). A succinct overview of
the analytical procedures used in the analysis is provided in the
manuscript, and the analytical code provided in this document can be
used to reproduce the results exactly.

### Load geomorph and data

``` r
# load geomorph
devtools::install_github("geomorphR/geomorph", ref = "Stable", build_vignettes = TRUE)
```

    ## Skipping install of 'geomorph' from a github remote, the SHA1 (e423f85f) has not changed since last install.
    ##   Use `force = TRUE` to force installation

``` r
library(geomorph)
```

    ## Loading required package: RRPP

    ## Loading required package: rgl

``` r
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
```

### Generalised Procrustes Analysis

Landmark data were aligned to a global coordinate system (Kendall 1981,
1984; Slice 2001), achieved through generalised Procrustes
superimposition (Rohlf and Slice 1990) performed in R 3.6.1 (R Core
Development Team, 2019) using the `geomorph` library v.3.1.2 (Adams et
al. 2017; Adams and Otárola-Castillo 2013). Procrustes superimposition
translates, scales, and rotates the coordinate data to allow for
comparisons among objects (Gower 1975; Rohlf and Slice 1990). The
`geomorph` package uses a partial Procrustes superimposition that
projects the aligned specimens into tangent space subsequent to
alignment in preparation for the use of multivariate methods that assume
linear space (Rohlf 1999; Slice 2001).

``` r
Y.gpa<-gpagen(coords, PrinAxes = TRUE)
```

    ## 
      |                                                                       
      |                                                                 |   0%
      |                                                                       
      |=============                                                    |  20%
      |                                                                       
      |==========================                                       |  40%
      |                                                                       
      |=================================================================| 100%

``` r
plot(Y.gpa)
# quantify global integration relative to self-similarity (Bookstein 2015)
globalIntegration(Y.gpa$coords)
```

![](base-analysis_files/figure-gfm/gpa-1.png)<!-- -->

    ##     BEval 
    ## -1.349866

``` r
# geomorph data frame
gdf<-geomorph.data.frame(shape=Y.gpa$coords, size=Y.gpa$Csize, region=qdata$region) 
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
```

![](base-analysis_files/figure-gfm/gpa-2.png)<!-- -->

``` r
# plot consensus configuration in 2D to illustrate axial twisting
par(mfrow=c(1,3))
plot(Y.gpa$consensus[,c("Y", "X")], pch=20)
plot(Y.gpa$consensus[,c("Z", "X")], pch=20)
plot(Y.gpa$consensus[,c("Z", "Y")], pch=20)
```

![](base-analysis_files/figure-gfm/gpa-3.png)<!-- -->

``` r
# 3D GPA plot
knitr::include_graphics('images/gpa3d.png')
```

![](images/gpa3d.png)<!-- -->

``` r
fig.cap="Results of generalized Procrustes analysis."
```

### Principal Components Analysis

Principal components analysis (Jolliffe 2002) was used to visualise
shape variation among the bifaces. The shape changes described by each
principal axis are commonly visualised using thin-plate spline warping
of a reference 3D mesh (Klingenberg 2013; Sherratt et al. 2014).

``` r
# principal components analysis
PCA<-gm.prcomp(Y.gpa$coords)
summary(PCA)
```

    ## Importance of components: 
    ##                               PC1          PC2          PC3          PC4
    ## Eigenvalues            0.00338155 0.0008027175 0.0003486284 0.0002279888
    ## Proportion of variance 0.62035718 0.1472613248 0.0639570922 0.0418253385
    ## Cumulative Proportion  0.62035718 0.7676185054 0.8315755976 0.8734009360
    ##                                 PC5          PC6          PC7          PC8
    ## Eigenvalues            0.0002058417 9.803674e-05 8.370516e-05 5.002559e-05
    ## Proportion of variance 0.0377623772 1.798518e-02 1.535600e-02 9.177368e-03
    ## Cumulative Proportion  0.9111633133 9.291485e-01 9.445045e-01 9.536819e-01
    ##                                 PC9         PC10         PC11         PC12
    ## Eigenvalues            4.398544e-05 2.725389e-05 2.051878e-05 1.920348e-05
    ## Proportion of variance 8.069282e-03 4.999821e-03 3.764241e-03 3.522945e-03
    ## Cumulative Proportion  9.617511e-01 9.667510e-01 9.705152e-01 9.740382e-01
    ##                                PC13         PC14         PC15         PC16
    ## Eigenvalues            1.512707e-05 1.081947e-05 1.018681e-05 9.006077e-06
    ## Proportion of variance 2.775114e-03 1.984869e-03 1.868805e-03 1.652196e-03
    ## Cumulative Proportion  9.768133e-01 9.787981e-01 9.806669e-01 9.823191e-01
    ##                                PC17         PC18         PC19         PC20
    ## Eigenvalues            8.575010e-06 7.382869e-06 6.388130e-06 5.176412e-06
    ## Proportion of variance 1.573115e-03 1.354413e-03 1.171925e-03 9.496309e-04
    ## Cumulative Proportion  9.838923e-01 9.852467e-01 9.864186e-01 9.873682e-01
    ##                                PC21         PC22         PC23         PC24
    ## Eigenvalues            4.259039e-06 4.047015e-06 3.829567e-06 3.619699e-06
    ## Proportion of variance 7.813356e-04 7.424390e-04 7.025474e-04 6.640464e-04
    ## Cumulative Proportion  9.881496e-01 9.888920e-01 9.895945e-01 9.902586e-01
    ##                                PC25         PC26         PC27         PC28
    ## Eigenvalues            3.299102e-06 3.008597e-06 2.941672e-06 2.672031e-06
    ## Proportion of variance 6.052317e-04 5.519377e-04 5.396600e-04 4.901933e-04
    ## Cumulative Proportion  9.908638e-01 9.914158e-01 9.919554e-01 9.924456e-01
    ##                                PC29         PC30         PC31         PC32
    ## Eigenvalues            2.395328e-06 2.289746e-06 2.101556e-06 1.993766e-06
    ## Proportion of variance 4.394313e-04 4.200619e-04 3.855377e-04 3.657634e-04
    ## Cumulative Proportion  9.928850e-01 9.933051e-01 9.936906e-01 9.940564e-01
    ##                                PC33         PC34         PC35         PC36
    ## Eigenvalues            1.909324e-06 1.856880e-06 1.786563e-06 1.695501e-06
    ## Proportion of variance 3.502722e-04 3.406511e-04 3.277513e-04 3.110456e-04
    ## Cumulative Proportion  9.944067e-01 9.947473e-01 9.950751e-01 9.953861e-01
    ##                                PC37         PC38         PC39         PC40
    ## Eigenvalues            1.585280e-06 1.443562e-06 1.347013e-06 1.224309e-06
    ## Proportion of variance 2.908251e-04 2.648265e-04 2.471142e-04 2.246037e-04
    ## Cumulative Proportion  9.956770e-01 9.959418e-01 9.961889e-01 9.964135e-01
    ##                                PC41         PC42         PC43         PC44
    ## Eigenvalues            1.160409e-06 1.129004e-06 1.076762e-06 9.621221e-07
    ## Proportion of variance 2.128811e-04 2.071197e-04 1.975357e-04 1.765047e-04
    ## Cumulative Proportion  9.966264e-01 9.968335e-01 9.970310e-01 9.972075e-01
    ##                                PC45         PC46         PC47         PC48
    ## Eigenvalues            9.135749e-07 8.687516e-07 8.391349e-07 7.688563e-07
    ## Proportion of variance 1.675985e-04 1.593755e-04 1.539422e-04 1.410494e-04
    ## Cumulative Proportion  9.973751e-01 9.975345e-01 9.976885e-01 9.978295e-01
    ##                                PC49         PC50         PC51         PC52
    ## Eigenvalues            7.614027e-07 7.055700e-07 6.769154e-07 6.550003e-07
    ## Proportion of variance 1.396820e-04 1.294393e-04 1.241825e-04 1.201621e-04
    ## Cumulative Proportion  9.979692e-01 9.980986e-01 9.982228e-01 9.983430e-01
    ##                                PC53         PC54         PC55         PC56
    ## Eigenvalues            6.197894e-07 5.503534e-07 5.186643e-07 5.056015e-07
    ## Proportion of variance 1.137025e-04 1.009642e-04 9.515077e-05 9.275436e-05
    ## Cumulative Proportion  9.984567e-01 9.985576e-01 9.986528e-01 9.987455e-01
    ##                                PC57         PC58         PC59         PC60
    ## Eigenvalues            4.496021e-07 4.190243e-07 4.002626e-07 3.877036e-07
    ## Proportion of variance 8.248107e-05 7.687147e-05 7.342957e-05 7.112558e-05
    ## Cumulative Proportion  9.988280e-01 9.989049e-01 9.989783e-01 9.990494e-01
    ##                                PC61         PC62         PC63         PC64
    ## Eigenvalues            3.635844e-07 3.550770e-07 3.296260e-07 3.198325e-07
    ## Proportion of variance 6.670082e-05 6.514011e-05 6.047104e-05 5.867439e-05
    ## Cumulative Proportion  9.991162e-01 9.991813e-01 9.992418e-01 9.993004e-01
    ##                                PC65         PC66         PC67         PC68
    ## Eigenvalues            2.860714e-07 2.706483e-07 2.558246e-07 2.455031e-07
    ## Proportion of variance 5.248080e-05 4.965137e-05 4.693192e-05 4.503840e-05
    ## Cumulative Proportion  9.993529e-01 9.994026e-01 9.994495e-01 9.994945e-01
    ##                                PC69         PC70         PC71         PC72
    ## Eigenvalues            2.261904e-07 2.114591e-07 1.999902e-07 1.820446e-07
    ## Proportion of variance 4.149541e-05 3.879291e-05 3.668890e-05 3.339671e-05
    ## Cumulative Proportion  9.995360e-01 9.995748e-01 9.996115e-01 9.996449e-01
    ##                                PC73         PC74         PC75         PC76
    ## Eigenvalues            1.676346e-07 1.600405e-07 1.500849e-07 1.464530e-07
    ## Proportion of variance 3.075315e-05 2.935999e-05 2.753359e-05 2.686732e-05
    ## Cumulative Proportion  9.996757e-01 9.997050e-01 9.997326e-01 9.997594e-01
    ##                                PC77         PC78         PC79         PC80
    ## Eigenvalues            1.321007e-07 1.187120e-07 1.098235e-07 1.000682e-07
    ## Proportion of variance 2.423434e-05 2.177813e-05 2.014750e-05 1.835786e-05
    ## Cumulative Proportion  9.997837e-01 9.998054e-01 9.998256e-01 9.998439e-01
    ##                                PC81         PC82         PC83         PC84
    ## Eigenvalues            8.947071e-08 8.569252e-08 7.956782e-08 7.936743e-08
    ## Proportion of variance 1.641371e-05 1.572059e-05 1.459699e-05 1.456023e-05
    ## Cumulative Proportion  9.998604e-01 9.998761e-01 9.998907e-01 9.999052e-01
    ##                                PC85         PC86         PC87         PC88
    ## Eigenvalues            6.682209e-08 6.524882e-08 6.174415e-08 5.582519e-08
    ## Proportion of variance 1.225875e-05 1.197012e-05 1.132718e-05 1.024133e-05
    ## Cumulative Proportion  9.999175e-01 9.999295e-01 9.999408e-01 9.999510e-01
    ##                                PC89         PC90         PC91         PC92
    ## Eigenvalues            4.336502e-08 4.060151e-08 3.828800e-08 3.031194e-08
    ## Proportion of variance 7.955464e-06 7.448488e-06 7.024068e-06 5.560830e-06
    ## Cumulative Proportion  9.999590e-01 9.999664e-01 9.999735e-01 9.999790e-01
    ##                                PC93         PC94         PC95         PC96
    ## Eigenvalues            2.517212e-08 2.406643e-08 2.046099e-08 1.761356e-08
    ## Proportion of variance 4.617913e-06 4.415071e-06 3.753640e-06 3.231269e-06
    ## Cumulative Proportion  9.999836e-01 9.999881e-01 9.999918e-01 9.999950e-01
    ##                                PC97         PC98
    ## Eigenvalues            1.501413e-08 1.202364e-08
    ## Proportion of variance 2.754395e-06 2.205779e-06
    ## Cumulative Proportion  9.999978e-01 1.000000e+00

``` r
# set plot parameters
colors <- c("dodgerblue4","indianred4") # baseball colors, naturally
colors <- colors[as.numeric(qdata$region)]
shapes <- c(2,4) # open triangle (ctx) and X (sca)
shapes <- shapes[as.numeric(qdata$region)]
# plotPCA
PCAplot<-plot(PCA, col = colors, pch = shapes)
```

![](base-analysis_files/figure-gfm/pca-1.png)<!-- -->

``` r
knitr::include_graphics('images/pca-warp-ref.png')
```

![](images/pca-warp-ref.png)<!-- -->

``` r
fig.cap="Results of PCA with central Texas sample in blue triangles, and southern Caddo area in red X's. Reference shapes include the consensus configuration (gray) and the shape at the extreme of each PC in black. Reference shapes do not articulate with any specimens used in this analysis."
```

### Define models

A residual randomisation permutation procedure (RRPP; n = 10,000
permutations) was used for all Procrustes ANOVAs (Adams and Collyer
2015; Collyer and Adams 2018), which has higher statistical power and a
greater ability to identify patterns in the data should they be present
(Anderson and Ter Braak 2003). To assess whether shape changes with size
(allometry), and differs by group (region), Procrustes ANOVAs (Goodall
1991) were run that enlist effect-sizes (z-scores) computed as standard
deviates of the generated sampling distributions (Collyer, Sekora, and
Adams 2015).

``` r
# define models
fit.size<-procD.lm(shape ~ size, data = gdf, print.progress = FALSE, iter = 9999)
fit.region<-procD.lm(shape ~ region, data = gdf, print.progress = FALSE, iter = 9999)
fit.unique<-procD.lm(shape ~ size * region, data = gdf, print.progress = FALSE, iter = 9999)
```

### Allometry

``` r
# allometry: does shape change with size?  
anova(fit.size)
```

    ## 
    ## Analysis of Variance, using Residual Randomization
    ## Permutation procedure: Randomization of null model residuals 
    ## Number of permutations: 10000 
    ## Estimation method: Ordinary Least Squares 
    ## Sums of Squares and Cross-products: Type I 
    ## Effect sizes (Z) based on F distributions
    ## 
    ##           Df      SS       MS     Rsq      F      Z Pr(>F)   
    ## size       1 0.03582 0.035819 0.06705 6.9715 2.8699 0.0014 **
    ## Residuals 97 0.49838 0.005138 0.93295                        
    ## Total     98 0.53420                                         
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Call: procD.lm(f1 = shape ~ size, iter = 9999, data = gdf, print.progress = FALSE)

``` r
plot(fit.size, type = "regression", reg.type = "RegScore", predictor = log(gdf$size), pch = shapes, col = colors)
```

![](base-analysis_files/figure-gfm/allometry-1.png)<!-- -->

``` r
    # common allometric component (Mitteroecker 2004)
plotAllometry(fit.size, size = gdf$size, logsz = TRUE, method = "CAC", pch = shapes, col = colors)
```

![](base-analysis_files/figure-gfm/allometry-2.png)<!-- -->

``` r
    # size-shape PCA (Mitteroecker 2004)
plotAllometry(fit.region, size = gdf$size, logsz = TRUE, method = "size.shape", pch = shapes, col = colors)
```

![](base-analysis_files/figure-gfm/allometry-3.png)<!-- -->

``` r
    # do Gahagan biface forms from different regions express parallel, convergent, or divergent morphological characteristics?
test<-plotAllometry(fit.unique, size = gdf$size, logsz = TRUE, method = "PredLine", pch = shapes, col = colors)
```

![](base-analysis_files/figure-gfm/allometry-4.png)<!-- -->

### Shape \~ Region?

``` r
# ANOVA: do Gahagan biface shapes differ by region?
anova(fit.region)
```

    ## 
    ## Analysis of Variance, using Residual Randomization
    ## Permutation procedure: Randomization of null model residuals 
    ## Number of permutations: 10000 
    ## Estimation method: Ordinary Least Squares 
    ## Sums of Squares and Cross-products: Type I 
    ## Effect sizes (Z) based on F distributions
    ## 
    ##           Df     SS       MS     Rsq      F     Z Pr(>F)    
    ## region     1 0.0702 0.070198 0.13141 14.675 3.821  1e-04 ***
    ## Residuals 97 0.4640 0.004783 0.86859                        
    ## Total     98 0.5342                                         
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Call: procD.lm(f1 = shape ~ region, iter = 9999, data = gdf, print.progress = FALSE)

### Morphological disparity

``` r
# morphological disparity: do either of the groups display greater shape variation among individuals relative to the other group?
morphol.disparity(fit.region, groups = qdata$region, data = gdf, iter = 9999)
```

    ## 
    ## 
    ## Performimg pairwise comparisons of disparity
    ## 
      |                                                                       
      |                                                                 |   0%
      |                                                                       
      |                                                                 |   1%
      |                                                                       
      |=                                                                |   1%
      |                                                                       
      |=                                                                |   2%
      |                                                                       
      |==                                                               |   2%
      |                                                                       
      |==                                                               |   3%
      |                                                                       
      |==                                                               |   4%
      |                                                                       
      |===                                                              |   4%
      |                                                                       
      |===                                                              |   5%
      |                                                                       
      |====                                                             |   5%
      |                                                                       
      |====                                                             |   6%
      |                                                                       
      |====                                                             |   7%
      |                                                                       
      |=====                                                            |   7%
      |                                                                       
      |=====                                                            |   8%
      |                                                                       
      |======                                                           |   8%
      |                                                                       
      |======                                                           |   9%
      |                                                                       
      |======                                                           |  10%
      |                                                                       
      |=======                                                          |  10%
      |                                                                       
      |=======                                                          |  11%
      |                                                                       
      |=======                                                          |  12%
      |                                                                       
      |========                                                         |  12%
      |                                                                       
      |========                                                         |  13%
      |                                                                       
      |=========                                                        |  13%
      |                                                                       
      |=========                                                        |  14%
      |                                                                       
      |=========                                                        |  15%
      |                                                                       
      |==========                                                       |  15%
      |                                                                       
      |==========                                                       |  16%
      |                                                                       
      |===========                                                      |  16%
      |                                                                       
      |===========                                                      |  17%
      |                                                                       
      |===========                                                      |  18%
      |                                                                       
      |============                                                     |  18%
      |                                                                       
      |============                                                     |  19%
      |                                                                       
      |=============                                                    |  19%
      |                                                                       
      |=============                                                    |  20%
      |                                                                       
      |=============                                                    |  21%
      |                                                                       
      |==============                                                   |  21%
      |                                                                       
      |==============                                                   |  22%
      |                                                                       
      |===============                                                  |  22%
      |                                                                       
      |===============                                                  |  23%
      |                                                                       
      |===============                                                  |  24%
      |                                                                       
      |================                                                 |  24%
      |                                                                       
      |================                                                 |  25%
      |                                                                       
      |=================                                                |  25%
      |                                                                       
      |=================                                                |  26%
      |                                                                       
      |=================                                                |  27%
      |                                                                       
      |==================                                               |  27%
      |                                                                       
      |==================                                               |  28%
      |                                                                       
      |===================                                              |  28%
      |                                                                       
      |===================                                              |  29%
      |                                                                       
      |===================                                              |  30%
      |                                                                       
      |====================                                             |  30%
      |                                                                       
      |====================                                             |  31%
      |                                                                       
      |====================                                             |  32%
      |                                                                       
      |=====================                                            |  32%
      |                                                                       
      |=====================                                            |  33%
      |                                                                       
      |======================                                           |  33%
      |                                                                       
      |======================                                           |  34%
      |                                                                       
      |======================                                           |  35%
      |                                                                       
      |=======================                                          |  35%
      |                                                                       
      |=======================                                          |  36%
      |                                                                       
      |========================                                         |  36%
      |                                                                       
      |========================                                         |  37%
      |                                                                       
      |========================                                         |  38%
      |                                                                       
      |=========================                                        |  38%
      |                                                                       
      |=========================                                        |  39%
      |                                                                       
      |==========================                                       |  39%
      |                                                                       
      |==========================                                       |  40%
      |                                                                       
      |==========================                                       |  41%
      |                                                                       
      |===========================                                      |  41%
      |                                                                       
      |===========================                                      |  42%
      |                                                                       
      |============================                                     |  42%
      |                                                                       
      |============================                                     |  43%
      |                                                                       
      |============================                                     |  44%
      |                                                                       
      |=============================                                    |  44%
      |                                                                       
      |=============================                                    |  45%
      |                                                                       
      |==============================                                   |  45%
      |                                                                       
      |==============================                                   |  46%
      |                                                                       
      |==============================                                   |  47%
      |                                                                       
      |===============================                                  |  47%
      |                                                                       
      |===============================                                  |  48%
      |                                                                       
      |================================                                 |  48%
      |                                                                       
      |================================                                 |  49%
      |                                                                       
      |================================                                 |  50%
      |                                                                       
      |=================================                                |  50%
      |                                                                       
      |=================================                                |  51%
      |                                                                       
      |=================================                                |  52%
      |                                                                       
      |==================================                               |  52%
      |                                                                       
      |==================================                               |  53%
      |                                                                       
      |===================================                              |  53%
      |                                                                       
      |===================================                              |  54%
      |                                                                       
      |===================================                              |  55%
      |                                                                       
      |====================================                             |  55%
      |                                                                       
      |====================================                             |  56%
      |                                                                       
      |=====================================                            |  56%
      |                                                                       
      |=====================================                            |  57%
      |                                                                       
      |=====================================                            |  58%
      |                                                                       
      |======================================                           |  58%
      |                                                                       
      |======================================                           |  59%
      |                                                                       
      |=======================================                          |  59%
      |                                                                       
      |=======================================                          |  60%
      |                                                                       
      |=======================================                          |  61%
      |                                                                       
      |========================================                         |  61%
      |                                                                       
      |========================================                         |  62%
      |                                                                       
      |=========================================                        |  62%
      |                                                                       
      |=========================================                        |  63%
      |                                                                       
      |=========================================                        |  64%
      |                                                                       
      |==========================================                       |  64%
      |                                                                       
      |==========================================                       |  65%
      |                                                                       
      |===========================================                      |  65%
      |                                                                       
      |===========================================                      |  66%
      |                                                                       
      |===========================================                      |  67%
      |                                                                       
      |============================================                     |  67%
      |                                                                       
      |============================================                     |  68%
      |                                                                       
      |=============================================                    |  68%
      |                                                                       
      |=============================================                    |  69%
      |                                                                       
      |=============================================                    |  70%
      |                                                                       
      |==============================================                   |  70%
      |                                                                       
      |==============================================                   |  71%
      |                                                                       
      |==============================================                   |  72%
      |                                                                       
      |===============================================                  |  72%
      |                                                                       
      |===============================================                  |  73%
      |                                                                       
      |================================================                 |  73%
      |                                                                       
      |================================================                 |  74%
      |                                                                       
      |================================================                 |  75%
      |                                                                       
      |=================================================                |  75%
      |                                                                       
      |=================================================                |  76%
      |                                                                       
      |==================================================               |  76%
      |                                                                       
      |==================================================               |  77%
      |                                                                       
      |==================================================               |  78%
      |                                                                       
      |===================================================              |  78%
      |                                                                       
      |===================================================              |  79%
      |                                                                       
      |====================================================             |  79%
      |                                                                       
      |====================================================             |  80%
      |                                                                       
      |====================================================             |  81%
      |                                                                       
      |=====================================================            |  81%
      |                                                                       
      |=====================================================            |  82%
      |                                                                       
      |======================================================           |  82%
      |                                                                       
      |======================================================           |  83%
      |                                                                       
      |======================================================           |  84%
      |                                                                       
      |=======================================================          |  84%
      |                                                                       
      |=======================================================          |  85%
      |                                                                       
      |========================================================         |  85%
      |                                                                       
      |========================================================         |  86%
      |                                                                       
      |========================================================         |  87%
      |                                                                       
      |=========================================================        |  87%
      |                                                                       
      |=========================================================        |  88%
      |                                                                       
      |==========================================================       |  88%
      |                                                                       
      |==========================================================       |  89%
      |                                                                       
      |==========================================================       |  90%
      |                                                                       
      |===========================================================      |  90%
      |                                                                       
      |===========================================================      |  91%
      |                                                                       
      |===========================================================      |  92%
      |                                                                       
      |============================================================     |  92%
      |                                                                       
      |============================================================     |  93%
      |                                                                       
      |=============================================================    |  93%
      |                                                                       
      |=============================================================    |  94%
      |                                                                       
      |=============================================================    |  95%
      |                                                                       
      |==============================================================   |  95%
      |                                                                       
      |==============================================================   |  96%
      |                                                                       
      |===============================================================  |  96%
      |                                                                       
      |===============================================================  |  97%
      |                                                                       
      |===============================================================  |  98%
      |                                                                       
      |================================================================ |  98%
      |                                                                       
      |================================================================ |  99%
      |                                                                       
      |=================================================================|  99%
      |                                                                       
      |=================================================================| 100%

    ## 
    ## Call:
    ## morphol.disparity(f1 = fit.region, groups = qdata$region, iter = 9999,  
    ##     data = gdf) 
    ## 
    ## 
    ## 
    ## Randomized Residual Permutation Procedure Used
    ## 10000 Permutations
    ## 
    ## Procrustes variances for defined groups
    ##         CTX         SCA 
    ## 0.004906590 0.004595798 
    ## 
    ## 
    ## Pairwise absolute differences between variances
    ##              CTX          SCA
    ## CTX 0.0000000000 0.0003107921
    ## SCA 0.0003107921 0.0000000000
    ## 
    ## 
    ## P-Values
    ##       CTX   SCA
    ## CTX 1.000 0.815
    ## SCA 0.815 1.000

### References cited

<div id="refs" class="references">

<div id="ref-RN1655">

Adams, D. C., and M. L. Collyer. 2015. “Permutation Tests for
Phylogenetic Comparative Analyses of High-Dimensional Shape Data: What
you Shuffle Matters.” Journal Article. *Evolution* 69 (3): 823–9.
<https://doi.org/10.1111/evo.12596>.

</div>

<div id="ref-RN11530">

Adams, Dean C., Michael L. Collyer, Antigoni Kaliontzopoulou, and Emma
Sherratt. 2017. “Package ’geomorph’: Geometric Morphometric Analyses of
2D/3D Landmark Data. R package version 3.0.5.” Journal Article.
<http://geomorphr.github.io/geomorph/>.

</div>

<div id="ref-RN1774">

Adams, Dean C., and Erik Otárola-Castillo. 2013. “geomorph: An R Package
for the Collection and Analysis of Geometric Morphometric Shape Data.”
Journal Article. *Methods in Ecology and Evolution* 4 (4): 393–99.
<https://doi.org/10.1111/2041-210x.12035>.

</div>

<div id="ref-RN1719">

Anderson, M. J., and C. J. F. Ter Braak. 2003. “Permutation Tests for
Multi-Factoral Analysis of Variance.” Journal Article. *Journal of
Statistical Computation and Simulation* 73 (2): 85–113.
<https://doi.org/10.1080=0094965021000015558>.

</div>

<div id="ref-RN11775">

Collyer, Michael L., and Dean C. Adams. 2018. “RRPP: An R Package for
Fitting Linear Models to High-Dimensional Data using Residual
Randomization.” Journal Article. *Methods in Ecology and Evolution* 9
(7): 1772–9. <https://doi.org/https://doi.org/10.1111/2041-210X.13029>.

</div>

<div id="ref-RN1756">

Collyer, M. L., D. J. Sekora, and D. C. Adams. 2015. “A Method for
Analysis of Phenotypic Change for Phenotypes Described by
High-Dimensional Data.” Journal Article. *Heredity* 115 (4): 357–65.
<https://doi.org/10.1038/hdy.2014.75>.

</div>

<div id="ref-RN1749">

Goodall, Colin. 1991. “Procrustes Methods in the Statistical Analysis of
Shape.” Journal Article. *Journal of the Royal Statistical Society.
Series B (Methodological)* 53 (2): 285–339.

</div>

<div id="ref-RN11564">

Gower, J. C. 1975. “Generalized Procrustes Analysis.” Journal Article.
*Psychometrika* 40 (1): 33–51.
<https://doi.org/https://doi.org/10.1007/BF02291478>.

</div>

<div id="ref-RN1746">

Jolliffe, Ian T. 2002. *Principal Component Analysis*. Book. New York:
Springer.

</div>

<div id="ref-RN11622">

Kendall, D. 1981. “The Statistics of Shape.” Book Section. In
*Interpreting Multivariate Data*, edited by V. Barnett, 75–80. New York:
Wiley.

</div>

<div id="ref-RN11623">

Kendall, David G. 1984. “Shape Manifolds, Procrustean Metrics, and
Complex Projective Spaces.” Journal Article. *Bulletin of the London
Mathematical Society* 16 (2): 81–121.
<https://doi.org/10.1112/blms/16.2.81>.

</div>

<div id="ref-RN1731">

Klingenberg, Christian Peter. 2013. “Visualizations in Geometric
Morphometrics: How to Read and How to Make Graphs Showing Shape
Changes.” Journal Article. *Hystrix* 24 (1): 15–24.
<https://doi.org/http://dx.doi.org/10.4404/hystrix-24.1-7691>.

</div>

<div id="ref-R">

R Core Development Team, 2019. *R: A Language and Environment for
Statistical Computing*. Vienna, Austria: R Foundation for Statistical
Computing. <http://www.R-project.org/>.

</div>

<div id="ref-RN1646">

Rohlf, F. James. 1999. “Shape Statistics: Procrustes Superimpositions
and Tangent Spaces.” Journal Article. *Journal of Classification* 16
(2): 197–223. <https://doi.org/10.1007/s003579900054>.

</div>

<div id="ref-RN478">

Rohlf, F. James, and Dennis Slice. 1990. “Extensions of the Procrustes
Method for the Optimal Superimposition of Landmarks.” Journal Article.
*Systematic Zoology* 39 (1): 40–59. <https://doi.org/10.2307/2992207>.

</div>

<div id="ref-RN11801">

Selden Jr., Robert Z. 2018a. “A Preliminary Study of Smithport Plain
Bottle Morphology in the Southern Caddo Area.” *Bulletin of the Texas
Archeological Society* 89: 63–89.

</div>

<div id="ref-RN11782">

———. 2018b. “Ceramic Morphological Organisation in the Southern Caddo
Area: Quiddity of Shape for Hickory Engraved Bottles.” *Journal of
Archaeological Science: Reports* 21: 884–96.
<https://doi.org/10.1016/j.jasrep.2018.08.045>.

</div>

<div id="ref-RN11716">

———. 2019a. “Ceramic Morphological Organisation in the Southern Caddo
Area: The Clarence H. Webb Collections.” *Journal of Cultural Heritage*
35: 41–55.
<https://doi.org/https://doi.org/10.1016/j.culher.2018.07.002>.

</div>

<div id="ref-RN20852">

———. 2019b. “Louisiana Limitrophe: An Iterative Morphological Exegesis
of Caddo Bottle and Biface Production.” *SocArXiv*.
<https://doi.org/10.31235/osf.io/rpnd5>.

</div>

<div id="ref-RN11783">

Selden Jr., Robert Z., John E. Dockall, and Harry J. Shafer. 2018.
“Lithic Morphological Organisation: Gahagan Bifaces from the Southern
Caddo Area.” *Digital Applications in Archaeology and Cultural Heritage*
10: e00080. <https://doi.org/10.1016/j.daach.2018.e00080>.

</div>

<div id="ref-RN3684">

Shafer, Harry J. 1973. “Lithic Technology at the George C. Davis Site,
Cherokee County, Texas.” Unpublished Ph.D. Dissertation, The University
of Texas at Austin.

</div>

<div id="ref-RN20701">

———. 1974. “Lithic Reduction Strategies at the George C. Davis Site.”
*Louisiana Archaeology* 1: 66–74.
<https://docs.wixstatic.com/ugd/fefb33_71a3f0c39e5d47a2b55af09847e6d821.pdf>.

</div>

<div id="ref-RN4924">

———. 2006. “People of the Prairie: A Possible Connection to the Davis
Site Caddo.” Texas Department of Transportation; Prewitt & Associates,
Inc.

</div>

<div id="ref-RN479">

Sherratt, E., D. J. Gower, C. P. Klingenberg, and M. Wilkinson. 2014.
“Evolution of Cranial Shape in Caecilians (Amphibia: Gymnophiona).”
Journal Article. *Evolutionary Biology* 41 (4): 528–45.
<https://doi.org/https://doi.org/10.1007/s11692-014-9287-2>.

</div>

<div id="ref-RN11563">

Slice, Dennis E. 2001. “Landmark Coordinates Aligned by Procrustes
Analysis Do Not Lie in Kendall’s Shape Space.” Journal Article.
*Systematic Biology* 50 (1): 141–49.
<https://doi.org/10.1080/10635150119110>.

</div>

</div>
