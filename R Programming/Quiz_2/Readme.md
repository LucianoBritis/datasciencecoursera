### Introduction

For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file **specdata.zip** that you can download from the Coursera web site. 

**Although this is a programming assignment, you will be assessed using a separate quiz**.

### Data

The zip file containing the data can be downloaded here:

- [specdata.zip](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip) [2.4MB]

The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:

- Date: the date of the observation in YYYY-MM-DD format (year-month-day)
- sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
- nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

For this programming assignment you will need to unzip this file and create the directory 'specdata'. Once you have unzipped the zip file, do not make any modifications to the files in the 'specdata' directory. In each file you'll notice that there are many days where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

### Part 1

Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows.

<div>
<img src="https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/AniR5o00EeWk4wrqfRkIMQ_26d94fc4f878a8b60240f6fda6e17f6c_Screen-Shot-2015-11-17-at-9.03.29-AM.png?expiry=1644105600000&hmac=W8037NVZKph6r39f9kPXxC2W6CKn0gn-zkR8rq5sVQU">
</div>

Please save your code to a file named pollutantmean.R.

### Part 2

Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows.

<div>
<img src="https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Jnt5oY00EeWisRLkE7o57Q_2713e281672695ec59b29f83ec95f7b1_Screen-Shot-2015-11-17-at-9.04.23-AM.png?expiry=1644105600000&hmac=3u94p8LNNv26n1EwPtsQKCL8vYL4nW-s-d4Kmc6-Qes">
</div>

Please save your code to a file named complete.R.

### Part 3

Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows.

<div>
<img src="https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/OXaiR400EeWk4wrqfRkIMQ_dafbb49ef127335cf1f9468fcadbd4ee_Screen-Shot-2015-11-17-at-9.05.01-AM.png?expiry=1644105600000&hmac=6E6WpjkI6DuaJTvHC7Bu0zLi0nLXIqVromK0C0zLO9Y">
</div>

For this function you will need to use the 'cor' function in R which calculates the correlation between two vectors. Please read the help page for this function via '?cor' and make sure that you know how to use it.
