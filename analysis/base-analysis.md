Geometric morphometric analysis of Gahagan bifaces
================
Robert Z. Selden, Jr.
November 10, 2019

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
source('readmulti.csv.R')

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
    ## -1.351334

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
    ##                                PC1          PC2          PC3          PC4
    ## Eigenvalues            0.003456919 0.0008015115 0.0003561083 0.0002230682
    ## Proportion of variance 0.624607819 0.1448198327 0.0643428572 0.0403047299
    ## Cumulative Proportion  0.624607819 0.7694276515 0.8337705087 0.8740752386
    ##                                 PC5          PC6          PC7          PC8
    ## Eigenvalues            0.0002015882 9.695004e-05 8.436491e-05 5.604465e-05
    ## Proportion of variance 0.0364236392 1.751726e-02 1.524334e-02 1.012634e-02
    ## Cumulative Proportion  0.9104988778 9.280161e-01 9.432595e-01 9.533858e-01
    ##                                 PC9         PC10         PC11         PC12
    ## Eigenvalues            4.496636e-05 2.705188e-05 2.237267e-05 1.879107e-05
    ## Proportion of variance 8.124675e-03 4.887826e-03 4.042370e-03 3.395234e-03
    ## Cumulative Proportion  9.615105e-01 9.663983e-01 9.704407e-01 9.738359e-01
    ##                                PC13        PC14         PC15         PC16
    ## Eigenvalues            1.540029e-05 1.10222e-05 1.040191e-05 8.987216e-06
    ## Proportion of variance 2.782577e-03 1.99153e-03 1.879453e-03 1.623841e-03
    ## Cumulative Proportion  9.766185e-01 9.78610e-01 9.804895e-01 9.821133e-01
    ##                                PC17         PC18         PC19         PC20
    ## Eigenvalues            8.549231e-06 7.318255e-06 6.361364e-06 5.314827e-06
    ## Proportion of variance 1.544704e-03 1.322287e-03 1.149393e-03 9.603011e-04
    ## Cumulative Proportion  9.836580e-01 9.849803e-01 9.861297e-01 9.870900e-01
    ##                                PC21         PC22         PC23         PC24
    ## Eigenvalues            0.0000048135 4.055466e-06 3.815912e-06 3.582330e-06
    ## Proportion of variance 0.0008697197 7.327553e-04 6.894719e-04 6.472675e-04
    ## Cumulative Proportion  0.9879597279 9.886925e-01 9.893820e-01 9.900292e-01
    ##                                PC25         PC26         PC27         PC28
    ## Eigenvalues            3.502677e-06 3.217001e-06 2.912249e-06 2.824778e-06
    ## Proportion of variance 6.328756e-04 5.812587e-04 5.261950e-04 5.103905e-04
    ## Cumulative Proportion  9.906621e-01 9.912434e-01 9.917696e-01 9.922799e-01
    ##                                PC29         PC30         PC31         PC32
    ## Eigenvalues            2.501451e-06 2.338948e-06 2.179895e-06 2.054475e-06
    ## Proportion of variance 4.519707e-04 4.226092e-04 3.938709e-04 3.712096e-04
    ## Cumulative Proportion  9.927319e-01 9.931545e-01 9.935484e-01 9.939196e-01
    ##                                PC33         PC34         PC35         PC36
    ## Eigenvalues            1.939460e-06 1.886723e-06 1.825971e-06 1.778283e-06
    ## Proportion of variance 3.504282e-04 3.408994e-04 3.299226e-04 3.213063e-04
    ## Cumulative Proportion  9.942700e-01 9.946109e-01 9.949409e-01 9.952622e-01
    ##                                PC37         PC38         PC39         PC40
    ## Eigenvalues            1.590082e-06 1.514771e-06 1.397118e-06 1.310930e-06
    ## Proportion of variance 2.873014e-04 2.736940e-04 2.524360e-04 2.368633e-04
    ## Cumulative Proportion  9.955495e-01 9.958232e-01 9.960756e-01 9.963125e-01
    ##                                PC41         PC42         PC43         PC44
    ## Eigenvalues            1.194399e-06 1.143650e-06 1.084226e-06 9.552894e-07
    ## Proportion of variance 2.158081e-04 2.066386e-04 1.959016e-04 1.726049e-04
    ## Cumulative Proportion  9.965283e-01 9.967349e-01 9.969308e-01 9.971034e-01
    ##                                PC45         PC46         PC47         PC48
    ## Eigenvalues            9.315217e-07 9.195995e-07 8.443341e-07 8.158839e-07
    ## Proportion of variance 1.683105e-04 1.661564e-04 1.525572e-04 1.474167e-04
    ## Cumulative Proportion  9.972717e-01 9.974379e-01 9.975904e-01 9.977378e-01
    ##                                PC49         PC50         PC51         PC52
    ## Eigenvalues            7.740278e-07 7.409568e-07 7.274802e-07 6.601754e-07
    ## Proportion of variance 1.398540e-04 1.338786e-04 1.314436e-04 1.192827e-04
    ## Cumulative Proportion  9.978777e-01 9.980116e-01 9.981430e-01 9.982623e-01
    ##                                PC53         PC54         PC55         PC56
    ## Eigenvalues            6.362967e-07 5.823384e-07 5.451563e-07 5.084281e-07
    ## Proportion of variance 1.149683e-04 1.052189e-04 9.850069e-05 9.186451e-05
    ## Cumulative Proportion  9.983773e-01 9.984825e-01 9.985810e-01 9.986729e-01
    ##                                PC57         PC58         PC59         PC60
    ## Eigenvalues            4.730999e-07 4.693756e-07 4.137549e-07 4.029531e-07
    ## Proportion of variance 8.548130e-05 8.480838e-05 7.475865e-05 7.280693e-05
    ## Cumulative Proportion  9.987583e-01 9.988431e-01 9.989179e-01 9.989907e-01
    ##                                PC61         PC62         PC63         PC64
    ## Eigenvalues            3.896934e-07 3.640047e-07 3.513582e-07 3.214590e-07
    ## Proportion of variance 7.041113e-05 6.576961e-05 6.348460e-05 5.808231e-05
    ## Cumulative Proportion  9.990611e-01 9.991269e-01 9.991904e-01 9.992485e-01
    ##                                PC65         PC66         PC67         PC68
    ## Eigenvalues            3.109272e-07 2.829565e-07 2.726509e-07 2.535682e-07
    ## Proportion of variance 5.617939e-05 5.112555e-05 4.926348e-05 4.581557e-05
    ## Cumulative Proportion  9.993046e-01 9.993558e-01 9.994050e-01 9.994508e-01
    ##                                PC69         PC70         PC71         PC72
    ## Eigenvalues            2.451162e-07 2.208437e-07 2.048010e-07 1.939748e-07
    ## Proportion of variance 4.428842e-05 3.990279e-05 3.700415e-05 3.504803e-05
    ## Cumulative Proportion  9.994951e-01 9.995350e-01 9.995720e-01 9.996071e-01
    ##                                PC73         PC74         PC75         PC76
    ## Eigenvalues            1.799088e-07 1.686135e-07 1.565266e-07 1.511512e-07
    ## Proportion of variance 3.250653e-05 3.046566e-05 2.828176e-05 2.731052e-05
    ## Cumulative Proportion  9.996396e-01 9.996701e-01 9.996983e-01 9.997257e-01
    ##                                PC77         PC78         PC79         PC80
    ## Eigenvalues            1.390248e-07 1.261566e-07 1.193091e-07 1.061959e-07
    ## Proportion of variance 2.511947e-05 2.279441e-05 2.155718e-05 1.918784e-05
    ## Cumulative Proportion  9.997508e-01 9.997736e-01 9.997951e-01 9.998143e-01
    ##                                PC81         PC82         PC83         PC84
    ## Eigenvalues            1.003169e-07 9.211420e-08 8.807852e-08 8.202944e-08
    ## Proportion of variance 1.812560e-05 1.664351e-05 1.591433e-05 1.482136e-05
    ## Cumulative Proportion  9.998324e-01 9.998491e-01 9.998650e-01 9.998798e-01
    ##                                PC85         PC86         PC87         PC88
    ## Eigenvalues            7.747428e-08 7.308202e-08 6.540498e-08 6.143040e-08
    ## Proportion of variance 1.399832e-05 1.320471e-05 1.181760e-05 1.109945e-05
    ## Cumulative Proportion  9.998938e-01 9.999070e-01 9.999188e-01 9.999299e-01
    ##                                PC89         PC90         PC91         PC92
    ## Eigenvalues            5.377298e-08 4.885162e-08 4.717929e-08 4.032719e-08
    ## Proportion of variance 9.715885e-06 8.826677e-06 8.524515e-06 7.286454e-06
    ## Cumulative Proportion  9.999397e-01 9.999485e-01 9.999570e-01 9.999643e-01
    ##                                PC93         PC94         PC95         PC96
    ## Eigenvalues            3.837790e-08 3.371702e-08 2.560840e-08 2.370383e-08
    ## Proportion of variance 6.934250e-06 6.092106e-06 4.627013e-06 4.282890e-06
    ## Cumulative Proportion  9.999712e-01 9.999773e-01 9.999819e-01 9.999862e-01
    ##                                PC97         PC98         PC99        PC100
    ## Eigenvalues            2.025422e-08 1.983573e-08 1.544332e-08 1.290993e-08
    ## Proportion of variance 3.659602e-06 3.583987e-06 2.790352e-06 2.332610e-06
    ## Cumulative Proportion  9.999899e-01 9.999935e-01 9.999963e-01 9.999986e-01
    ##                               PC101
    ## Eigenvalues            7.781498e-09
    ## Proportion of variance 1.405988e-06
    ## Cumulative Proportion  1.000000e+00

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
    ##            Df      SS       MS     Rsq      F      Z Pr(>F)    
    ## size        1 0.04166 0.041664 0.07453 8.0538 3.0348  6e-04 ***
    ## Residuals 100 0.51732 0.005173 0.92547                         
    ## Total     101 0.55899                                          
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
    ##            Df      SS       MS     Rsq      F      Z Pr(>F)    
    ## region      1 0.07773 0.077730 0.13905 16.151 3.8971  1e-04 ***
    ## Residuals 100 0.48126 0.004813 0.86095                         
    ## Total     101 0.55899                                          
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Call: procD.lm(f1 = shape ~ region, iter = 9999, data = gdf, print.progress = FALSE)

### Morphological disparity

``` r
# morphological disparity: do either of the groups display greater shape variation among individuals relative to the other group?
morphol.disparity(fit.region, groups = qdata$region, data = gdf, print.progress = FALSE, iter = 9999)
```

    ## 
    ## Call:
    ## morphol.disparity(f1 = fit.region, groups = qdata$region, iter = 9999,  
    ##     data = gdf, print.progress = FALSE) 
    ## 
    ## 
    ## 
    ## Randomized Residual Permutation Procedure Used
    ## 10000 Permutations
    ## 
    ## Procrustes variances for defined groups
    ##         CTX         SCA 
    ## 0.005043922 0.004582514 
    ## 
    ## 
    ## Pairwise absolute differences between variances
    ##              CTX          SCA
    ## CTX 0.0000000000 0.0004614077
    ## SCA 0.0004614077 0.0000000000
    ## 
    ## 
    ## P-Values
    ##        CTX    SCA
    ## CTX 1.0000 0.7113
    ## SCA 0.7113 1.0000

### Mean shapes

``` r
shape<-Y.gpa$coords
mean<-mshape(shape)
```

### References cited

<div id="refs" class="references">

<div id="ref-RN1655">

Adams, Dean C., and Michael L. Collyer. 2015. “Permutation Tests for
Phylogenetic Comparative Analyses of High-Dimensional Shape Data: What
you Shuffle Matters.” *Evolution* 69 (3): 823–9.
<https://doi.org/10.1111/evo.12596>.

</div>

<div id="ref-RN11530">

Adams, Dean C., Michael L. Collyer, Antigoni Kaliontzopoulou, and Emma
Sherratt. 2017. “Package ’geomorph’: Geometric Morphometric Analyses of
2D/3D Landmark Data. R package version 3.0.5.”
<http://geomorphr.github.io/geomorph/>.

</div>

<div id="ref-RN1774">

Adams, Dean C., and Erik Otárola-Castillo. 2013. “geomorph: An R Package
for the Collection and Analysis of Geometric Morphometric Shape Data.”
*Methods in Ecology and Evolution* 4 (4): 393–99.
<https://doi.org/10.1111/2041-210x.12035>.

</div>

<div id="ref-RN1719">

Anderson, M. J., and C. J. F. Ter Braak. 2003. “Permutation Tests for
Multi-Factoral Analysis of Variance.” *Journal of Statistical
Computation and Simulation* 73 (2): 85–113.
<https://doi.org/10.1080=0094965021000015558>.

</div>

<div id="ref-RN11775">

Collyer, Michael L., and Dean C. Adams. 2018. “RRPP: An R Package for
Fitting Linear Models to High-Dimensional Data using Residual
Randomization.” *Methods in Ecology and Evolution* 9 (7): 1772–9.
<https://doi.org/https://doi.org/10.1111/2041-210X.13029>.

</div>

<div id="ref-RN1756">

Collyer, M. L., D. J. Sekora, and D. C. Adams. 2015. “A Method for
Analysis of Phenotypic Change for Phenotypes Described by
High-Dimensional Data.” *Heredity* 115 (4): 357–65.
<https://doi.org/10.1038/hdy.2014.75>.

</div>

<div id="ref-RN1749">

Goodall, Colin. 1991. “Procrustes Methods in the Statistical Analysis of
Shape.” *Journal of the Royal Statistical Society. Series B
(Methodological)* 53 (2): 285–339.

</div>

<div id="ref-RN11564">

Gower, J. C. 1975. “Generalized Procrustes Analysis.” *Psychometrika* 40
(1): 33–51. <https://doi.org/https://doi.org/10.1007/BF02291478>.

</div>

<div id="ref-RN1746">

Jolliffe, Ian T. 2002. *Principal Component Analysis*. New York:
Springer.

</div>

<div id="ref-RN11622">

Kendall, David G. 1981. “The Statistics of Shape.” In *Interpreting
Multivariate Data*, edited by V. Barnett, 75–80. New York: Wiley.

</div>

<div id="ref-RN11623">

———. 1984. “Shape Manifolds, Procrustean Metrics, and Complex Projective
Spaces.” *Bulletin of the London Mathematical Society* 16 (2): 81–121.
<https://doi.org/10.1112/blms/16.2.81>.

</div>

<div id="ref-RN1731">

Klingenberg, Christian Peter. 2013. “Visualizations in Geometric
Morphometrics: How to Read and How to Make Graphs Showing Shape
Changes.” *Hystrix* 24 (1): 15–24.
<https://doi.org/http://dx.doi.org/10.4404/hystrix-24.1-7691>.

</div>

<div id="ref-R">

R Core Development Team, 2019. *R: A Language and Environment for
Statistical Computing*. Vienna, Austria: R Foundation for Statistical
Computing. <http://www.R-project.org/>.

</div>

<div id="ref-RN1646">

Rohlf, F. James. 1999. “Shape Statistics: Procrustes Superimpositions
and Tangent Spaces.” *Journal of Classification* 16 (2): 197–223.
<https://doi.org/10.1007/s003579900054>.

</div>

<div id="ref-RN478">

Rohlf, F. James, and Dennis Slice. 1990. “Extensions of the Procrustes
Method for the Optimal Superimposition of Landmarks.” *Systematic
Zoology* 39 (1): 40–59. <https://doi.org/10.2307/2992207>.

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
*Evolutionary Biology* 41 (4): 528–45.
<https://doi.org/https://doi.org/10.1007/s11692-014-9287-2>.

</div>

<div id="ref-RN11563">

Slice, Dennis E. 2001. “Landmark Coordinates Aligned by Procrustes
Analysis Do Not Lie in Kendall’s Shape Space.” *Systematic Biology* 50
(1): 141–49. <https://doi.org/10.1080/10635150119110>.

</div>

</div>
