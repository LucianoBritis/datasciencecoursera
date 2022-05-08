#install.packages('jpeg')
# Read here - https://cran.r-project.org/web/packages/jpeg/jpeg.pdf
library(jpeg)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg" 

img <- download.file(fileUrl, 
                          destfile = "./quiz_data/img.jpg",
                          mode = "wb")

# read it also in native format
img <- readJPEG("./quiz_data/img.jpg", native = TRUE)

# What are the 30th and 80th quantiles of the resulting data? | ?quantile
quantile(img, prob = c(0.3,0.8))

# (some Linux systems may produce an answer 638 different for the 30th quantile)