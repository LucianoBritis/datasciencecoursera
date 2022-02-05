

## Week 1 Quiz

### 1. The R language is a dialect of which of the following programming languages?

#### Answer

- **S**

#### Explanation

R is a dialect of the S language which was developed at Bell Labs.



### 2.The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?  Select all that apply.

- **The freedom to restrict access to the source code for the software.**

- **The freedom to prevent users from using the software for undesirable purposes.**

- **The freedom to sell the software for any price.**

### 3. In R the following are all atomic data types EXCEPT: (Select all that apply)

- **table**

- **array**

- **data frame**

- **matrix**

- **list**

  

### 4. If I execute the expression x <- 4 in R, what is the class of the object `x' as determined by the `class()' function?

#### Answer

- **numeric**

#### Explanation

```
> x <- 4
> class(x)
[1] "numeric"
> 
```



### 5. What is the class of the object defined by x <- c(4, TRUE)?

#### Answer

- **numeric**

#### Explanation

```
> x <- c(4, TRUE)
> class(x)
[1] "numeric"
> 
```

When different objects are mixed in a vector, coersion accurs so that every element in the vector is of the same class.



### 6. If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?

#### Answer

- **a matrix with 2 columns and 3 rows **

#### Explanation

```
> x <- c(1,3, 5)
> y <- c(3, 2, 10)
> cbind(x, y)
     x  y
[1,] 1  3
[2,] 3  2
[3,] 5 10
> 
```

The 'cbind' function treats vectors as if they were columns of a matrix. It then takes those vectors and binds them together column-wise to create a matrix.



### 7. A key property of vectors in R is that

#### Answer

- **elements of a vector all must be of the same class**



### 8. Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me? Select all that apply.

- **a numeric vector containing the element 2.**

#### Explanation

```
> x <- list(2, "a", "b", TRUE)
> x[[1]]
[1] 2
> 
```



### 9. Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y ?

#### Answer

- **an integer vector with the values 3, 5, 5, 7** 

#### Explanation

```
> x <- 1:4
> y <- 2:3
> x + y
[1] 3 5 5 7
> 
```



### 10. Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this? Select all that apply.

#### Answer

1.  **x[x < 6] <- 0**

2. **x[x %in% 1:5] <- 0**

#### Explanation

1.

```
> x <- c(3, 5, 1, 10, 12, 6)
```

```
> x[x < 6] <- 0
> x
[1]  0  0  0 10 12  6

```

2.

```
> x[x %in% 1:5] <- 0
> x
[1]  0  0  0 10 12  6
> 

```



### 11. Use the [Week 1 Quiz Data Set](https://d396qusza40orc.cloudfront.net/rprog/data/quiz1_data.zip) to answer questions 11-20.

Connection dataset 

```
> getwd()
[1] "G:/Ambiente de Dev/Labs R/programing R/dataset"
> con <- file("G:/Ambiente de Dev/Labs R/programing R/dataset/hw1_data.csv")
> dataquiz <- read.csv(con)
> 
```

In the dataset provided for this Quiz, what are the column names of the dataset ? 

#### Answer

- **Ozone, Solar.R, Wind, Temp, Month, Day**

You can get the column names of a data frame with the `names()' function.

#### Explanation

```
> names(dataquiz)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"    
>
```



### 12. Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

```
> head(dataquiz)
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6
> 
```

You can extract the first two rows using the [ operator and an integer sequence to index the rows.

#### Explanation

```
> dataquiz[1:2,]
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
> 
```



### 13. How many observations (i.e. rows) are in this data frame?

#### Answer

- 153

You can use the `nrows()' function to compute the number of rows in a data frame.

#### Explanation

```
> nrow(dataquiz)
[1] 153
> 
```



### 14. Extract the *last* 2 rows of the data frame and print them to the console. What does the output look like?

#### Answer

```
> tail(dataquiz, n=2)
    Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30
>
```

####  Explanation

The `tail()' function is an easy way to extract the last few elements of an R object.

### 15. What is the value of Ozone in the 47th row ?

```
> head(dataquiz[1])
  Ozone
1    41
2    36
3    12
4    18
5    NA
6    28
> 
```

#### Answer

- 21

#### Explanation

The single bracket [ operator can be used to extract individual rows of a data frame.

```
> dataquiz[47,1]
[1] 21
```



### 16. How many missing values are in the Ozone column of this data frame?

#### Answer 

- 37

#### Explanation

```
> head(is.na(dataquiz[1]))
     Ozone
[1,] FALSE
[2,] FALSE
[3,] FALSE
[4,] FALSE
[5,]  TRUE
[6,] FALSE
> 
```

The `is.na' function can be used to test for missing values.

```
> sum(is.na(dataquiz[1]))
> [1] 37
```



### 17. What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

#### Answer

- 42.1

#### Explanation

The `mean' function can be used to calculate the mean.

```
> !is.na(dataquiz[1])
> dataquiz[1][!is.na(dataquiz[1])]
> mean(dataquiz[1][!is.na(dataquiz[1])])
[1] 42.12931
> 
```



### 18. Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

#### Answer 

- 212.8

#### Explanation

Ozone values are above 31

```
> dataquiz[(dataquiz$Ozone > 31),]
```

Temp values are above 90

```
> dataquiz[(dataquiz$Temp > 90),]
```

conditional and (&)

```
> dataquiz[(dataquiz$Ozone > 31 & dataquiz$Temp > 90),]
```

with the column $Solar.R

```
> (dataquiz[(dataquiz$Ozone > 31 & dataquiz$Temp > 90),]$Solar.R)
 [1]  NA  NA 267 272  NA  NA 203 225 237 188 167 197 183 189
> 
```

return the indices of the object which return true for the logical operation

```
> (dataquiz[which(dataquiz$Ozone > 31 & dataquiz$Temp > 90),]$Solar.R)
 [1] 267 272 203 225 237 188 167 197 183 189
> 
```

extracting the mean

```
> mean(dataquiz[which(dataquiz$Ozone > 31 & dataquiz$Temp > 90),]$Solar.R)
[1] 212.8
> 
```

You need to construct a logical vector in R to match the question's requirements. Then use that logical vector to subset the data frame.

**which()** function in R Programming Language is used to return the position of the specified values in the logical vector.



### 19. What is the mean of "Temp" when "Month" is equal to 6? 

#### Answer

- 79.1

#### Explanation

Month equal to 6

```
> dataquiz[(dataquiz$Month == 6),]
```

with the column $Temp

```
> (dataquiz[(dataquiz$Month == 6),]$Temp)
 [1] 78 74 67 84 85 79 82 87 90 87 93 92 82 80 79 77 72 65 73 76 77 76 76 76 75
[26] 78 73 80 77 83
```

extracting the average

```
> mean(dataquiz[(dataquiz$Month == 6),]$Temp)
[1] 79.1
> 
```



### 20. What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?

#### Answer

- 115

#### Explanation

Filter

```
> dataquiz[(dataquiz$Month == 5),]
```

By Ozone

```
> dataquiz[(dataquiz$Month == 5),]$Ozone
 [1]  41  36  12  18  NA  28  23  19   8  NA   7  16  11  14  18  14  34   6  30
[20]  11   1  11   4  32  NA  NA  NA  23  45 115  37
> 
```

Add ''na.rm = True'', remove na values

```
> max(dataquiz[which(dataquiz$Month == 5),]$Ozone, na.rm = TRUE)
[1] 115
> 
```

