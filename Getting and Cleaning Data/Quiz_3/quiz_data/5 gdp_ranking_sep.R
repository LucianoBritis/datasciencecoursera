#install.packages("data.table")
#install.packages("Hmisc")

# Load packages
library("data.table")
library("plyr")
library("Hmisc")

# Reads URLs directly :
fileUrl1 = fread(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
  nrows = 190,
  #Reading starts at line 5
  skip = 5,
  select = c(1, 2, 4, 5),
  #new column names
  col.names = c("CountryCode",
                "Ranking",
                "Economy",
                "US dollars"),
  key = c("CountryCode")
)

fileUrl2 = fread(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
  key = c("CountryCode")
)
# Sort the data frame in ascending order by GDP rank (so United States is first)
mergeData <- arrange(join(fileUrl1, fileUrl2), Ranking)
View(mergeData)

# Cut the GDP ranking into 5 separate quantile groups.
mergeData$Cut = cut2(mergeData$Ranking, g=5)

# Make a table versus Income.Group
result <- table(mergeData$Cut, mergeData$`Income Group`)

# How many countries are Lower middle income but among the 38 nations with highest GDP ?
result[1,4]

 