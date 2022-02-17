## Week 3 Quiz



### 1. Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:

```
library(datasets)
data(iris)

```

A description of the dataset can be found by running

```
?iris
```

There will be an object called 'iris' in your workspace. In this dataset, what is the mean of **'Sepal.Length'** for the species **virginica** ? **Please round your answer to the nearest whole number**.

(Only enter the numeric result and nothing else.)

- To get the answer here, you can use 'tapply' to calculate the mean of 'Sepal.Length' within each species.

```
7
```

- **Load the dataset**

  ```
  > ?iris
  ```

  *iris is a data frame with 150 cases (rows) and 5 variables (columns) named* 

```
> library(datasets)
> data(iris)
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
>
```

- *Summarizing the output (optional)*

```
> tapply(iris$Sepal.Length,iris$Species, summary)
$setosa
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  4.300   4.800   5.000   5.006   5.200   5.800 

$versicolor
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  4.900   5.600   5.900   5.936   6.300   7.000 

$virginica
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  4.900   6.225   6.500   6.588   6.900   7.900 
```

- *Getting the average*

```
> tapply(iris$Sepal.Length,iris$Species, mean)
    setosa versicolor  virginica 
     5.006      5.936      6.588 
>
```

- *Rounding the result*

```
> round(tapply(iris$Sepal.Length,iris$Species, mean))
    setosa versicolor  virginica 
         5          6          7 
> 
```

#### **Answer**

- 7

### 2. Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

- Accessing specified columns('Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width')	

```
> head(iris[,1:4])
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1          5.1         3.5          1.4         0.2
2          4.9         3.0          1.4         0.2
3          4.7         3.2          1.3         0.2
4          4.6         3.1          1.5         0.2
5          5.0         3.6          1.4         0.2
6          5.4         3.9          1.7         0.4
> 
```

- Getting the average

```
> apply(iris[, 1:4], 2, mean)
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
    5.843333     3.057333     3.758000     1.199333 
> 
```

#### **Answer**

- **apply(iris[, 1:4], 2, mean)**



### 3. Load the 'mtcars' dataset in R with the following code

```
library(datasets)
data(mtcars)
```

There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running

```
?mtcars
```

How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

- **Load the dataset**

  ```
  > ?mtcars
  ```

  *A data frame with 32 observations on 11 (numeric) variables.*

```
> library(datasets)
> data(mtcars)
> head(mtcars)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
>
```

- Calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl).

```
> sapply(split(mtcars$mpg, mtcars$cyl), mean)
       4        6        8 
26.66364 19.74286 15.10000 
```

```
> with(mtcars, tapply(mpg, cyl, mean))
       4        6        8 
26.66364 19.74286 15.10000 
>
```

#### **Answer**

- **sapply(split(mtcars$mpg, mtcars$cyl), mean)**

- **with(mtcars, tapply(mpg, cyl, mean))**



### 4. Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

(**Please round your final answer to the nearest whole number**. Only enter the numeric result and nothing else.)

- *Summarizing the output (optional)*

```
> tapply(mtcars$hp, mtcars$cyl, summary)
$`4`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  52.00   65.50   91.00   82.64   96.00  113.00 

$`6`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  105.0   110.0   110.0   122.3   123.0   175.0 

$`8`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  150.0   176.2   192.5   209.2   241.2   335.0 

>
```

- *Difference of index 1 and 3 with rounding*

```
> calc <- tapply(mtcars$hp, mtcars$cyl, mean)
> round(calc[3] - calc[1])
  8 
127
```



### 5. If you run 

```
debug(ls)
```

what happens when you next call the 'ls' function?

The 'ls' function will return an error.

- ```
  > debug(ls)
  Warning message:
  R graphics engine version 14 is not supported by this version of RStudio. The Plots tab will be disabled until a newer version of RStudio is installed.
  debugging in: ls(vars, all.names = T)
  	
  Browse[2]>
  ```
  
  #### **Answer**
  
  - *Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.*

 



