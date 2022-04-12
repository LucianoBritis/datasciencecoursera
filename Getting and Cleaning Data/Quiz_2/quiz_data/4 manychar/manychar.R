### How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: ?
setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_2")
library(httr)
library(RCurl)
#(Hint: the nchar() function in R may be helpful)

con <- url("https://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)

# The error allows the page to be read, pass the head function to see the result of reading the page
head(htmlCode)

# Using nchar count the characters of each line
count <- nchar(htmlCode, allowNA = FALSE)

# Extracting the result to the desired lines
result <- c(count[10], count[20], count[30], count[100])

#displaying the output
result
## Optional
# Testing the position of the first two elements, if the quantity is unique, they will bring the same value.
match(c(45, 31), count)
