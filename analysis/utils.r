#uTILS
# defining curves
# Chord distance for spline curves
cumchord <- function(M){
  cumsum(sqrt(apply((M - rbind(M[1, ], M[-nrow(M),]))^2, 1, sum)))
}
# cubic spline
spline3d <- function(pts, npts = 100, proj = FALSE, mesh){
  z <- cumchord(pts)
  zz <- seq(0, max(z), length.out = npts)
  sdata <- data.frame(
    x = splinefun(z, pts[, 1])(zz),
    y = splinefun(z, pts[, 2])(zz),
    z = splinefun(z, pts[, 3])(zz))
  if (proj) sdata <- projRead(as.matrix(sdata), mesh)
  sdata
}