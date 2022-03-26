#Before starting to solve the problem, we need to prepare the environment.
setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_1")

# Checking for and creating directories
file.exists("ngap")
dir.create("ngap")

if(!file.exists("ngap")){
  dir.create("./ngap")
}

# install.packages('xlsx')
library(xlsx)

# Download the 2006 microdata survey about housing for the state of Idaho
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

# Friendly name for the file
download.file(fileUrl, destfile = "./ngap/ngap.xlsx", mode = 'wb')

# Listing the downloaded file
list.files("./ngap")
print(ans)

# Reading Local File
ngaData <- read.xlsx2("./ngap/ngap.xlsx", sheetIndex = 1 , header = TRUE)

# Checking dimensions
dim(ngaData)

colIndex <- 7:15
rowIndex <- 18:23 

# Reading data
dat <- read.xlsx("./ngap/ngap.xlsx", sheetIndex = 1 , colIndex = colIndex, rowIndex = rowIndex)

# Sum the value
sum(dat$Zip*dat$Ext,na.rm=T)