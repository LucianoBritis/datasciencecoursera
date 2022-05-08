fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# Friendly name for the file
download.file(fileUrl, destfile = "./quiz3_data.csv")

#Reading Local File
data <- read.csv("quiz3_data.csv")

# Create a logical vector that identifies the households on greater than 10 acres(ACR >= 3)who sold more than $10,000 worth of agriculture products(AGS >= 6 ).

# Assign that logical vector to the variable agricultureLogical.
agriculturaLogical <- (data$ACR >= 3 & data$AGS >=6)

# Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
head(which(agricultureLogical))

# What are the first 3 values that result?
head(which(agricultureLogical), n = 3)
