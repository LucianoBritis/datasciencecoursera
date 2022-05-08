#install.packages("data.table")
library("data.table")

# Reads URLs directly :
fileUrl1 = fread(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
  nrows = 190,
  #Reading starts at line 5
  skip = 5,
  select = c(1, 2, 4, 5),
    #new column names
  col.names = c(
    "CountryCode",
    "Ranking",
    "Economy",
    "US dollars"
    ),
  key = c("CountryCode")
)

fileUrl2 = fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
                 key = c("CountryCode")
                 )

View(fileUrl1)
View(fileUrl2)

# Match the data based on the country shortcode. 
match_data <- merge(fileUrl1, fileUrl2)
dim(match_data)
dim(fileUrl1)
dim(fileUrl2)

# How many of the IDs match?
nrow(new_data)
# Sort the data frame in descending order by GDP rank (so United States is last). 
th <- match_data[order(-Ranking)]
View(th)
# What is the 13th country in the resulting data frame?
head(th[13,3])


