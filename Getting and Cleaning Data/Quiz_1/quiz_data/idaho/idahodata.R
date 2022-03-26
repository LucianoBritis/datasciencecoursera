# Before starting to solve the problem, we need to prepare the environment.
setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_1")

# Checking for and creating directories
file.exists("idaho")
dir.create("idaho")

if(!file.exists("idaho")){
  dir.create("./idaho")
}

# Download the 2006 microdata survey about housing for the state of Idaho
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# Friendly name for the file
download.file(fileUrl, destfile = "./idaho/idahodata.csv" )

#listing the downloaded file
list.files("./idaho")

#Reading Local File
idahodata <- read.table("./idaho/idahodata.csv", sep = ',' ,header = TRUE)

# the latest released version from CRAN with
#install.packages("dplyr")

#load requerid library
library("dplyr") # for functions

# How many properties are worth $1,000,000 or more ? 

# As described in the "code book" we have that: Property value ==  Column "VAL" 

data <- tbl_df(idahodata)

# Removing the original data frame
rm(idahodata)

# Property value greater than a 24
mydf <- filter(data, VAL >= 24 )

# Showing values with filter applied
select(mydf, VAL)

# Using counter and getting the answer to the question
count(mydf)




