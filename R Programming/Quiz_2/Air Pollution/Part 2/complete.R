# Part 2
complete <- function(directory, id = 1:332){
  files_list <- list.files(directory, pattern = ".csv", full.names = TRUE)
  #count
  nobs <- numeric()
  
  for (i in id) {
    #loops through the files.
    datasets <- (read.csv(files_list[i]))
    #transform nobs and complete cases into vector
    nobs <- c(nobs, sum(complete.cases(datasets))) 
  }
  #add nobs and id in a dataframe
  data.frame(id, nobs)
}



