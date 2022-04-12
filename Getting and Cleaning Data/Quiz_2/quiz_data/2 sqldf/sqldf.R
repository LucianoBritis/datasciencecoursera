

setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_2")

#Install.packages('sqldf')
library(RMySQL)
library(sqldf)

# Download the American Community Survey data
fileUrl <-
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

# Friendly name for the file
download.file(fileUrl, destfile = "./getdata.csv")

data <- read.csv("getdata.csv")

# Listing the downloaded file
list.files("./")

dateDownloaded <- date()
print(dateDownloaded)

# Convert
acs <- data.table::data.table(read.csv("getdata.csv"))
# Object Classes
class(acs)

AGEP <- unique(acs$AGEP)
# Object Classes
class(AGEP)

# Testing possibilities to find the real thing
test_a <- sqldf("select distinct pwgtp1 from acs")
test_b <- sqldf("select distinct AGEP from acs")
test_c <- sqldf("select unique AGEP from acs")
test_d <- sqldf("select AGEP where unique from acs")

# Grouping the outputs with the identical function

identical(as.data.frame(AGEP), test_a)
identical(as.data.frame(AGEP), test_b)
identical(as.data.frame(AGEP), test_c)
identical(as.data.frame(AGEP), test_d)

# Viewing the outputs for the true test paired with AGEP
view <- cbind(AGEP, test_b)
# top 5
head(view)
# last 5
tail(view)
