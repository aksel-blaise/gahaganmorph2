# Function to read multiple CSV files
# Format of input files is 4 columns: the first is a label for each landmark and the rest are the XYZ coordinates
readmulti.csv<-function(filelist){   
  n<-length(filelist)
  names<-gsub(".csv","",filelist, ignore.case=T)
  landdata<-nland<-NULL
  for (i in 1:n){
    temp <-read.csv(filelist[i], header=TRUE,row.names = 1)
    p<-nrow(temp);k<-ncol(temp)
    nland<-rbind(nland,p)
    if (min(nland)!=max(nland)) {
      stop("Number of landmarks not the same in all files.") } 
    data<-matrix(as.numeric(unlist(temp)),ncol=3,byrow=F)
    landdata<-rbind(landdata,data)
  }
  coords<-arrayspecs(landdata,p,k)
  dimnames(coords)[[3]]<- as.list(names)
  return(coords=coords)
}