### Introduction

For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file **specdata.zip** that you can download from the Coursera web site. 

**Although this is a programming assignment, you will be assessed using a separate** [quiz](https://github.com/LucianoBritis/datasciencecoursera/tree/master/R%20Programming/Quiz_2/Quiz).

### Data

The zip file containing the data can be downloaded here:

- [specdata.zip *](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip) [2.4MB]

The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:

- Date: the date of the observation in YYYY-MM-DD format (year-month-day)
- sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
- nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

For this programming assignment you will need to unzip this file and create the directory 'specdata'. Once you have unzipped the zip file, do not make any modifications to the files in the 'specdata' directory. In each file you'll notice that there are many days where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

### [Part 1](https://github.com/LucianoBritis/datasciencecoursera/tree/master/R%20Programming/Quiz_2/Air%20Pollution/Part%201)

Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows.

<div>
<img src="https://user-images.githubusercontent.com/13219648/153108272-f11c5939-c02a-49a6-96f4-a3851c943185.png">
</div>


Please save your code to a file named pollutantmean.R.

### [Part 2](https://github.com/LucianoBritis/datasciencecoursera/tree/master/R%20Programming/Quiz_2/Air%20Pollution/Part%202)

Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows.

<div>
<img src="https://user-images.githubusercontent.com/13219648/153108315-02397ef0-9f26-4b7d-a575-865e977e629a.png">
</div>


Please save your code to a file named complete.R.

### [Part 3](https://github.com/LucianoBritis/datasciencecoursera/tree/master/R%20Programming/Quiz_2/Air%20Pollution/Part%203)

Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows.

<div>
<img src="https://user-images.githubusercontent.com/13219648/153108346-bab6085a-5b21-481b-ac4f-265d4fbe4bc2.png">
</div>

For this function you will need to use the 'cor' function in R which calculates the correlation between two vectors. Please read the help page for this function via '?cor' and make sure that you know how to use it.

Please save your code to a file named corr.R.

## **Note***

To begin, download file above and unzip it into your R working directory.

You can do this in R with the following code:

```
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip", exdir = "specdata")
file.remove("specdata.zip")
```

If you’re not sure where your working directory is, you can find out with the getwd() command. Alternatively,
you can view/change it through the Tools > Global Options menu in R Studio.

So assuming you’ve unzipped the file into your R directory, you should have a folder called specdata. In
that folder there are 332 files. Let’s get a list of those files:

```
list.files("specdata")
```

Okay, so we have 332 files. Let’s take a look at one to see what’s inside:

```
> read_file <- read.csv("specdata/001.csv")
> head(read_file)
        Date sulfate nitrate ID
1 2003-01-01      NA      NA  1
2 2003-01-02      NA      NA  1
3 2003-01-03      NA      NA  1
4 2003-01-04      NA      NA  1
5 2003-01-05      NA      NA  1
6 2003-01-06      NA      NA  1
```

