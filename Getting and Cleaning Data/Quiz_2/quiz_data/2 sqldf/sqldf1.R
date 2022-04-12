setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_2")
# install.packages('sqldf')
library(sqldf)

# Download the American Community Survey data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

# Friendly name for the file

download.file(fileUrl, destfile = "./getdata.csv")

data <- read.csv("getdata.csv")

class(data)
class(acs)

setDT(data)
# Listing the downloaded file
list.files("./")

dateDownloaded <- date()
print(dateDownloaded)

# convert data.frame to data.table
acs <- data.table::data.table(read.table("getdata.csv"))

names(acs)

sqldf("select pwgtp1 from acs where AGEP < 50")
