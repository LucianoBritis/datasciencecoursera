# Before starting to solve the problem, we need to prepare the environment
setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_1")

#install.packages("XML")

# Load the package required to read XML files.
library(XML)

# Also load the other required package.
# library("methods")

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

# Reading XML File
doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)

# Print the result.
rootNode <- xmlRoot(doc)

# Exract the root node form the xml file.
xmlName(rootNode)

# Applies a function to each of the children of an XMLNode
#xmlApply(rootNode, xmlValue)

## How many restaurants have zipcode 21231 ? 

# Get the Elements of a Node
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)

# Sum Elements
sum(zipcode == "21231")



