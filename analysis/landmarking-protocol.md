3D Landmarking Protocol for Gahagan Bifaces
================
Robert Z. Selden, Jr.
October 30, 2019

The landmarking protocol developed for this project bears some visual
similarities with the configuration used in the previous study (Selden
Jr., Dockall, and Shafer 2018), as well as other two-dimensional
geometric morphometric analyses (Buchanan and Collard 2010; Buchanan et
al. 2011; Ragan and Buchanan 2018); however, it differs in some
fundamental ways. The first and most obvious difference is that this is
a three-dimensional study. The second is the method of landmark
placement, where *Geomagic Design X* (Build Version 2019.0.2 \[Build
Number: 78\]) was used to generate a spline around the periphery of each
biface, and to populate the landmarks and semilandmarks in a replicable
manner using a variety of mathematically-defined criteria. The goal of
this effort was to increase the precision and rigour of the study by
including the z-dimension to capture those morphological characteristics
associated with axial twisting introduced through the practice of
bifacial beveling.

``` r
knitr::include_graphics('images/figbev.png')
```

![](images/figbev.png)<!-- -->

``` r
fig.cap="Gahagan biface 545 from the Gahagan Mound site, illustrating axial twisting. \\label{figbev}"
```

### Generating the spline

Unlike the previous study, where the outline of each Gahagan biface was
projected onto a 2D plane, this effort enlists a spline extracted from
the surface geometry of the mesh itself. The spline follows the highest
curvature contours around the periphery of the lateral and basal edges.
The remainder of the landmarking protocol is based upon this spline,
which was subsequently split at four mathematically-defined locations.

``` r
knitr::include_graphics('images/extractspline.png')
```

![](images/extractspline.png)<!-- -->

``` r
fig.cap="Spline extracted along the highest contours of the projectile. \\label{figspline}"
```

### Splitting the spline

The characteristic points and tangents developed for this protocol were
inspired by the work of Birkhoff (1933). The first is the horizontal
tangent located at the tip of each Gahagan biface. The horizontal
tangent is calculated by drawing a horizontal line above the tip of the
biface using the tangent as a common contraint, and the horizontal plane
as the independent constraint (below image, left).

To split the 3D spline at the location of the horizontal tangent, a
reference point was inserted at the location of the tangent in the 2D
sketch (light blue point labeled h-tangent in below image, left),
followed by a reference plane using the pick point and normal function
where the reference point (h-tangent) was used as the pick point, and
the Right plane as the normal (below image, left). The 3D spline was
then cut at the location where the reference plane intersected with the
spline (below image, right).

``` r
knitr::include_graphics('images/lm1.png')
```

![](images/lm1.png)<!-- -->

``` r
fig.cap="Identify horizontal tangent, insert reference point and reference plane (left). Use reference plane to cut spline at the location of the horizontal tangent (right). \\label{figlm1}"
```

The point of highest curvature on either side of the basal edge was
calculated using the curvature function in the Accuracy Analyser. This
function displays the curvature flow as a continuous colour plot across
the area of the curve. In this instance, curvature is defined as the
amount by which a geometric shape deviates from being flat or straight
in the case of a line. The curvature is displayed in different colours
according to the local radius, and is calculated in only one direction
(U or V) along the curve. Using this tool, the two points of highest
curvature were located between the basal and lateral edges on either
side of each biface where the local radius measure was largest. The
alignment and orientation of each biface was dictated by the *auto3dgm*
output (see Figure 7a in the manuscript), and the landmarking protocol
follows the orientation in that figure, where LM2 was always placed on
the right side of the basal edge, and LM3 on the left.

``` r
knitr::include_graphics('images/splinesplit1.png')
```

![](images/splinesplit1.png)<!-- -->

``` r
fig.cap="Identify points of hightest curvature (light blue) at left/right intersection of lateral and basal edges. \\label{figsplinesplitlr}"
```

One additional landmark (LM4) was placed at the centre of the base. The
location of this landmark was identified by calculating the linear
distance between LM2 and LM3, and placing a reference point (ctrl-div in
image below) at that location. A reference plane was added using the
ctrl-div as the pick point, and the Right plane as the normal. The
spline was split at the intersection of the reference plane and the
basal spline.

``` r
knitr::include_graphics('images/lm4.png')
```

![](images/lm4.png)<!-- -->

``` r
fig.cap="Calculate linear distance between LM2 and LM3, insert reference plane coplanar to Right plane equidistant between LM2 and LM3, and use the reference plane to cut the spline.  \\label{figlm4}"
```

### Landmark placement

Landmarks 1-4 were placed at each spline split (blue points, below).
Equidistant semilandmarks were added to each of the four splines; 20
between LM1 and LM2, five between LM2 and LM4, five between LM4 and LM3,
and 20 between LM3 and LM1.

``` r
knitr::include_graphics('images/lmslm-all.png')
```

![](images/lmslm-all.png)<!-- -->

``` r
fig.cap="3D spline with landmarks (blue) and equidistant semilandmarks (white) applied, with top, right, and front planes. Semilandmarks are renumbered in post.  \\label{figlmslm-all}"
```

Superficially, this constellation of landmarks and semilandmarks appears
similar to those used in recent 2D studies. However, this rigourous
protocol for applying landmarks and semilandmarks aids in capturing the
morphological variation that articulates with axial twisting introduced
by knappers through the practice of beveling. Thus, this constellation
of landmarks and semilandmarks provides for greater precision in the
geometric morphometric analysis, marking a substantive advancement in
the analytical protocols used to analyse Gahagan biface morphology.

``` r
knitr::include_graphics('images/figbevlm.png')
```

![](images/figbevlm.png)<!-- -->

``` r
fig.cap="Mesh for Gahagan biface 545 from Gahagan Mound with landmarks and equidistant semilandmarks applied. \\label{figbevlm}"
```

### References cited

<div id="refs" class="references">

<div id="ref-RN11786">

Birkhoff, George D. 1933. *Aesthetic Measure*. Cambridge: Harvard
University Press.

</div>

<div id="ref-RN1754">

Buchanan, Briggs, and Mark Collard. 2010. “A Geometric
Morphometrics-Based Assessment of Blade Shape Differences among
Paleoindian Projectile Point Types from Western North America.” *Journal
of Archaeological Science* 37 (2): 350–59.
<https://doi.org/10.1016/j.jas.2009.09.047>.

</div>

<div id="ref-RN1736">

Buchanan, Briggs, Mark Collard, Marcus J. Hamilton, and Michael J.
O’Brien. 2011. “Points and Prey: A Quantitative Test of the Hypothesis
that Prey Size Influences early Paleoindian Projectile Point Form.”
*Journal of Archaeological Science* 38 (4): 852–64.
<https://doi.org/10.1016/j.jas.2010.11.007>.

</div>

<div id="ref-RN11731">

Ragan, Kathryn, and Briggs Buchanan. 2018. “Assessing Collector Bias: A
Geometric Morphometric Analysis of a Collection of Isolated Clovis
Points from the Midcontinent.” *Midcontinental Journal of Archaeology*
43 (2): 91–111. <https://doi.org/10.1080/01461109.2018.1426430>.

</div>

<div id="ref-RN11783">

Selden Jr., Robert Z., John E. Dockall, and Harry J. Shafer. 2018.
“Lithic Morphological Organisation: Gahagan Bifaces from the Southern
Caddo Area.” *Digital Applications in Archaeology and Cultural Heritage*
10: e00080. <https://doi.org/10.1016/j.daach.2018.e00080>.

</div>

</div>
