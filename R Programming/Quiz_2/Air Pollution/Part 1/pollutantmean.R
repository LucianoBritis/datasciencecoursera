# Part 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, pattern = ".csv", full.names = TRUE)
  
  datasets <- data.frame()
    for (i in id) {
      #loops through the files, rbinding them together
      datasets <- rbind(datasets, read.csv(files_list[i]))
    }
  
  mean(datasets[ ,pollutant], na.rm = TRUE)
  
}

# You can test this function by running it a few different id's and pollutant:

# > pollutantmean("specdata", "nitrate", 100)
## [1] 0.575615

# > pollutantmean("specdata", "nitrate", 1:100)
## [1] 1.706047

# > pollutantmean("specdata", "sulfate", 10:20)
## [1] 1.355225



