#mesh processing (uniform remesh and decimation)
#all meshes pre-processed in ScanStudioHD to remove errors and texture
devtools::install_github("zarquon42b/Rvcg")
library(Rvcg)
library(rgl)
#set working directory
setwd(getwd())
###################

dir.create("rePLY")
dir.create("data3d/lowres",recursive=T)

processmesh <- function(x) {
    mesh<-vcgImport(x, updateNormals = TRUE, clean = TRUE, silent = FALSE)
    meshname <- gsub(".ply","",basename(x))
    #check for existance and validity of vertices, faces and vertex normals
    meshintegrity(mesh, facecheck = TRUE, normcheck = TRUE)
    #identify resolution of mesh for use as voxelSize in remesh
    mres<-vcgMeshres(mesh)
    #uniform remesh
    remesh<-vcgUniformRemesh(mesh, voxelSize = mres$res, offset = 0)
    #export as OFF to data3d file
    vcgOffWrite(mesh, filename = paste0("data3d/",meshname))
    #export as PLY to rePLY folder
    vcgPlyWrite(remesh, filename = "rePLY/", meshname, ascii = TRUE)
    #decimate mesh
    decimated<-vcgQEdecim(mesh, percent = 0.25)
    #export as OFF to lowres file
    vcgOffWrite(decimated, filename =paste0("data3d/lowres/", meshname))
}

#batch loop assuming all ply files are stored in a folder called ply
myplys <- list.files("ply",pattern=".ply",full.names=T)
runall <- lapply(myplys,processmesh)
#end of script