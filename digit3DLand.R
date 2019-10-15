#digitizing landmarks and semilandmarks on Gahagan bifaces

#import most recent library
require(devtools)
install_github("morphOptics/digit3DLand", local=FALSE)
#load library, dependencies, and utils.r
library(digit3DLand)
library(magrittr)
library(abind)
source('utils.r')

#folder with meshes
setwd(getwd())

foldMesh <- "data"

#decimated all meshes 
tmp <- decimMesh(foldMesh, tarface = 20000)
deciOpt <- setDecimOptions(makeDecimation = FALSE)

#graphics options
grOpt <- setGraphicOptions(zoomSeeLm = TRUE, zoomPercDist = 0.75)
FiOpt <- setFileOptions(foldMesh) #saveTPS = "coords.tps", append=TRUE)

#digitize landmarks and semilandmarks
TeOpt <- setTemplOptions(54, template = TRUE, idxTemplate = 1:4, full.files = FALSE)
out <- digitMesh(foldMesh, fixed = 54, GrOpt = grOpt, DeOpt = deciOpt, TeOpt=TeOpt)

#get names to match ply file
nms <- dimnames(out)[[3]]

#defining curves
fix <- c(1:4)
 curves <- list(c(1,5:24,2),
                c(3,26:29,4),
                c(4,30:34,3),
                c(3,35:54,1)) #more here as needed - one list for each curve

npts <- 1000 #number of pts on the spline
if (is.list(curves)){
  nslds <- sapply(curves, length) - 2 #number of semilandmarks on each curve
}else{
  nslds <- length(curves) - 2
}

#definie 3d view
windowRect <- c(758,  396, 1930, 1420)
verbose <- FALSE

coords <- array(NA, c(sum(nslds) + length(fix), dim(out)[2:3]))
coords[1:length(fix),,] <- out[fix,,]
dimnames(coords)[[3]] <- dimnames(out)[[3]]
for (id in nms){
  #read meshes
  msh <- vcgPlyRead(paste0(foldMesh, "/", id, '.ply'))
  
  #cubic spline
  ctrl_pts <- lapply(curves, function(idx) out[idx, , id])
  sdat <- lapply(ctrl_pts, function(x) spline3d(as.matrix(x), npts = npts))
  
  #resampled curve
  smLds0 <- lapply(1:length(sdat), function(idx) sdat[[idx]][seq(1, npts, by = ceiling(npts/nslds[[idx]])), ])
  #reprojected semilds on mesh
  psmLds0 <- lapply(smLds0, function(x) t(projRead(as.matrix(x), msh)$vb[-4, ]))
  
  #visualizing curves 
  if (verbose) {
    open3d()
    par3d(windowRect = windowRect)
    shade3d(msh, col ='gray')
    spheres3d(out[fix, , id], col = 'red', radius = 0.35)
    #ctrl pts
    tmp <- curves %>% lapply(function(idx) 
      spheres3d(out[idx, , id], col = 'gray25', radius = 0.15))
    tmp <- sdat %>% lapply(function(x) 
      lines3d(x$x, x$y, x$z, col = "orange", lwd = 2))  # before reprojection on mesh
    tmp <- lapply(psmLds0, function(x) 
      spheres3d(x, col = 'orange', radius = 0.2))
  }
  tmp <- NULL
  for (ii in 1:length(psmLds0)) 
    tmp <- rbind(tmp, psmLds0[[ii]])
  coords[-c(1:length(fix)),, id] <- as.matrix(tmp)
}

for (id in nms){
  dd <- dim(coords)
  full.name <- paste0(foldMesh, '/coordsProj.tps')
  write(paste0(paste0("LM3","="), dd[1]), full.name, append = TRUE)
  write(t(coords[,,id]), full.name, ncolumns=3, append=TRUE)
  write(paste0("ID=", id), full.name, append=TRUE)
}

#rewrite in tps
sdir <- "gahagan_bifaces"
FiOpt <- setFileOptions(sdir, saveTPS="coord.tps", append=TRUE)
out <- digitMesh(sdir, 76, FiOpt=FiOpt, GrOpt=grOpt, DeOpt=deciOpt, TeOpt = TeOpt)
#end of script