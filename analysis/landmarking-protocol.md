3D Landmarking Protocol for Gahagan Bifaces
================
Robert Z. Selden, Jr.
October 26, 2019

While the landmarking protocol developed for this project bears some
visual similarities with the configuration used in the previous study
(Selden Jr., Dockall, and Shafer 2018), as well as other two-dimensional
geometric morphometric analyses (Buchanan and Collard 2010; Buchanan et
al. 2011; Ragan and Buchanan 2018), it differs in some fundamental ways.
The first and most obvious difference is that this is a
three-dimensional study. The second is the method of landmark placement,
where Geomagic Design X is used to generate a spline that is constrained
by a suite of reference points, planes, and vectors. The reference
geometry is used to populate the landmarks in a replicable manner using
a variety of mathematically-defined criteria. The goal was to increase
the precision of the study by including the z-dimension to capture the
axial twisting introduced through beveling.

![Fully-landmarked Gahagan biface.](./images/figbev.png)

### Generating the spline

Unlike the previous study, where the outline of each Gahagan biface was
projected onto a plane, this effort enlists a spline that is extracted
from the surface geometry of the 3D mesh. The spline follows the
contours of the highest curvature around the entirety of the lateral and
basal edge. The remainder of the landmarking protocol is based upon this
spline, which was subsequently split in four mathematically-defined
locations.

![Spline extracted along the highest contours of the
projectile.](./images/extractspline.png)

### Splitting the spline

The spline is split in four mathematically-defined locations. The first
is the horizontal tangent at the tip of each Gahagan biface. The
horizontal tangent is calculated by drawing a horizontal line above the
tip of the biface that uses the tangent as a common contraint, and the
horizontal plane as the independent constraint. To split the spline at
the location of the horizontal tangent, a reference point was inserted
at the location of the tangent, followed by a reference plane using the
pick point and normal axis function, where the reference point was used
as the pick point, and the Right plane as the normal axis. The spline
was then cut at the location where the reference plane intersected the
spline.

![Spline split at the horizontal tangent at the tip (left), and the
point of highest curvature on each side of the basal edge
(right).](./images/splinesplit1.png)

### References cited

<div id="refs" class="references">

<div id="ref-RN1754">

Buchanan, Briggs, and Mark Collard. 2010. “A Geometric
Morphometrics-Based Assessment of Blade Shape Differences among
Paleoindian Projectile Point Types from Western North America.” Journal
Article. *Journal of Archaeological Science* 37 (2): 350–59.
<https://doi.org/10.1016/j.jas.2009.09.047>.

</div>

<div id="ref-RN1736">

Buchanan, Briggs, Mark Collard, Marcus J. Hamilton, and Michael J.
O’Brien. 2011. “Points and Prey: A Quantitative Test of the Hypothesis
that Prey Size Influences early Paleoindian Projectile Point Form.”
Journal Article. *Journal of Archaeological Science* 38 (4): 852–64.
<https://doi.org/10.1016/j.jas.2010.11.007>.

</div>

<div id="ref-RN11731">

Ragan, Kathryn, and Briggs Buchanan. 2018. “Assessing Collector Bias: A
Geometric Morphometric Analysis of a Collection of Isolated Clovis
Points from the Midcontinent.” Journal Article. *Midcontinental Journal
of Archaeology* 43 (2): 91–111.
<https://doi.org/https://doi.org/10.1080/01461109.2018.1426430>.

</div>

<div id="ref-RN11783">

Selden Jr., Robert Z., John E. Dockall, and Harry J. Shafer. 2018.
“Lithic Morphological Organisation: Gahagan Bifaces from the Southern
Caddo Area.” Journal Article. *Digital Applications in Archaeology and
Cultural Heritage* 10: e00080.
<https://doi.org/10.1016/j.daach.2018.e00080>.

</div>

</div>
