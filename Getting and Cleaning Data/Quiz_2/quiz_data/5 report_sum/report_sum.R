## Analyzing the file structure
con <-
  url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
htmlCode <- readLines(con)
close(con)

# create a dataframe
htmlCode <- as.data.frame(htmlCode)
head(htmlCode)

#Reading a Fixed Width Format Files.
data_read <-
  read.fwf(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
    skip = 4,
    #Reading starts at line 4
    width = c(12, 7, 4, 9, 4, 9, 4, 9, 4),
    #length of values in each column
    #new column names
    col.names = c(
      "Week",
      "Nino12SST",
      "Nino12SSTA",
      "Nino3SST",
      "Nino3SSTA",
      "Nino34SST",
      "Nino34SSTA",
      "Nino4SST",
      "Nino4SSTA"
    )
  )
class(data_read)
head(data_read, 3)
sum_col_4 <- sum(data_read$Nino3SST)
sum_col_4
