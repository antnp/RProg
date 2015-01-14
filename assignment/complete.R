# complete.R

complete <-function(directory, id = 1:332) {
  counter <- 0
  z1 <- '0'
  z2 <- '00'
  resultset <- c()
  
  for (i in id) {
    counter <- 0
    
    if (nchar(i)==1) filen <- paste(z2,i,sep="")
    if (nchar(i)==2) filen <- paste(z1,i,sep="")
    if (nchar(i)==3) filen <- i
    
    filelocation <- paste(directory,"/",filen,".csv",sep="")
    data <- read.csv(filelocation)
    length <- nrow(data)
    
    for (j in 1:length) 
    { 
      ## Determine the number of NA records in the file
      if (is.na(data[j,'sulfate']) | is.na(data[j,'nitrate']))
        counter <- counter + 1
    }
    
    ## Subtrace the NA record number from total record number
    result <- (length - counter)
    
    ## Add result of file to running file
    resultset <- append(resultset, result)
  }
  
  output <- data.frame(id = id, nobs = resultset)
  
  return(output)
  
}
