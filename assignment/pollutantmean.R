# pollutantmean.R
# Write a function named 'pollutantmean' that calculates the mean of a 
# pollutant (sulfate or nitrate) across a specified list of monitors. 
# 
# The function 'pollutantmean' takes three arguments: 'directory', 
# 'pollutant', and 'id'. 
# 
# Given a vector monitor ID numbers, 
# 'pollutantmean' reads that monitors' particulate matter data from 
# the directory specified in the 'directory' argument and returns 
# the mean of the pollutant across all of the monitors, ignoring 
# any missing values coded as NA. A prototype of the function is as follows

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  # Get list of file names
  filenames = list.files(directory)
  
  # Create object to store values
  readings = array()
  
  # loop through IDs
  for (i in id) {
    # Create filename and with padding
    filename = sprintf("%03d.csv", i)
    filepath = paste(directory, filename, sep = "/")
    
    # load data
    data = read.csv(filepath)
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    # Subset data frame to include all rows for pollutant column
    dataCol = data[, pollutant]
    
    # append data to readings object
    readings = c(readings, dataCol)
  }
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  # round to 3 places
  round(mean(readings, na.rm = TRUE), 3)
}
