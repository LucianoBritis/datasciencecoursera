setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_1")

file.exists("communities")
dir.create("communities")

if (!file.exists("communities")){
  dir.create("./communities")
}

## Download the 2006 microdata survey about housing for the state of Idaho
#install.packages("data.table")

# Download from a url:
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

# Friendly name for the file
download.file(url, destfile = "./communities/communities.csv")

#listing the downloaded file
list.files("./communities")

# load the data.table package using library()
library(data.table)
input <- "communities/communities.csv"
DT <- fread(input)

file <-tempfile()
write.table(DT, file = file, row.names = FALSE, col.names = TRUE, sep = ",", quote = FALSE)
system.time(fread(file))


#---------------------------------------

system.time(DT[,mean(pwgtp15),by=SEX])
#---------------------------------------
system.time(rowMeans(DT)[DT$SEX==1]);system.time(rowMeans(DT)[DT$SEX==2])
#---------------------------------------
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
#---------------------------------------
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
#---------------------------------------
system.time(mean(DT[DT$SEX==1,]$pwgtp15));system.time(mean(DT[DT$SEX==2,]$pwgtp15))
#---------------------------------------
system.time(mean(DT$pwgtp15,by=DT$SEX))
#---------------------------------------

