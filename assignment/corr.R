corr <- function(directory, threshold = 0) {
  filelist <- list.files(directory)
  
  z1 <- '0'
  z2 <- '00'
  corvalues <- c()
  
  for (i in filelist) {
    
    filelocation <- paste(directory,"/",i,sep="")
    
    df <- read.csv(filelocation)
    
    result <- nrow(na.omit(df))
    
    
    if (result >= threshold) {
      temp <- na.omit(df)
      corvalues <- append(corvalues,cor(temp$sulfate, temp$nitrate))
    }
  }
  
  if (length(corvalues) == 0) {
    corvalues <- numeric(length = 0)
  }
  
  return(corvalues)
  
}

