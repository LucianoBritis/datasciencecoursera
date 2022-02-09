## Part 3

#### My Code Resolution, file saved as *corr.R*

```
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

```



You can test this function by running directory it a few different threshold values and  passing in a new variable, ex 'cr'.

```
source("corr.R")
source("complete.R")
> cr <- corr("specdata", 150)
> head(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
```

```
> summary(cr)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
```

```
> cr <- corr("specdata")
> summary(cr)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000 
```

