#install.packages("data.table")
# Load packages
library("data.table")
library("dplyr")
library("plyr")


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

# Sort the data frame in descending order by GDP rank (so United States is last). 
mergeData <- arrange(join(fileUrl1, fileUrl2), desc(Ranking))
View(mergeData)

# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group ? 
rating <- ddply(mergeData,.(`Income Group`), summarize, Rating=mean(Ranking))

head(rating, n=2)
rating[2:1,]

