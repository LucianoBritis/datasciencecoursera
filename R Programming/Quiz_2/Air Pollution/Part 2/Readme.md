## Part 2

#### My Code Resolution, file saved as *complete.R*

```
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
```



You can test this function by running it a few different id's or with random values in a vector:

```
> complete("specdata", 1:10)
	id nobs
1   1  117
2   2 1041
3   3  243
4   4  474
5   5  402
6   6  228
7   7  442
8   8  192
9   9  275
10 10  148
```

```
> complete("specdata", 1)
  id nobs
1  1  117
```

```
> complete("specdata", 1)
  id nobs
1  1  117
```

```
> complete("specdata", c(2, 4, 8, 10, 12))
  id nobs
1  2 1041
2  4  474
3  8  192
4 10  148
5 12   96
```

```
> complete("specdata", 30:25)
  id nobs
1 30  932
2 29  711
3 28  475
4 27  338
5 26  586
6 25  463
```

```
> complete("specdata", 3)
  id nobs
1  3  243
```
