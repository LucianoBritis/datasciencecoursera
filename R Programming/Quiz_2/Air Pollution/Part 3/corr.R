# Part 3
## 'directory' is a character vector of length 1 indicating the location of the CSV files
## 'threshold' is the numeric vector of length 1 indicating the number of completely observed obervations
## Return a numeric vector of correlations
## NOTE: Do not round the results

# vector to hold results of cor()
corr <- function(directory, threshold = 0, id = 1:332) {
  files_list <- list.files(directory, pattern = ".csv", full.names = TRUE)
  result <- c()
  
  for (i in id) {
    datasets <- read.csv((files_list[i]))
    tmp <- datasets[complete.cases(datasets), ]
    if(nrow(tmp) > threshold){
      result <- c(result, cor(tmp$sulfate, tmp$nitrate))
    }
    else 0
  }
  return(result)
}















