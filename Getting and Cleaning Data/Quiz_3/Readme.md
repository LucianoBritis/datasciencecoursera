# Week 3 Quiz

### 1.  The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf ](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf)

Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. 

 which(agricultureLogical) 

What are the first 3 values that result?

- [x] 125, 238,262

### My Answer

```
[Workspace loaded from D:/Ambiente de Dev/Data Science/scriptsR/Getting_and_Cleaning_Data/.RData]

> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
> 
> # Friendly name for the file
> download.file(fileUrl, destfile = "./quiz3_data.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
Content type 'text/csv' length 4246554 bytes (4.0 MB)
downloaded 4.0 MB

> 
> #Reading Local File
> data <- read.csv("quiz3_data.csv")
> 
> # Create a logical vector that identifies the households on greater than 10 acres(ACR >= 3)who sold more than $10,000 worth of agriculture products(AGS >= 6 ).
> 
> # Assign that logical vector to the variable agricultureLogical.
> agriculturaLogical <- (data$ACR >= 3 & data$AGS >=6)
> 
> # Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
> head(which(agricultureLogical))
[1] 125 238 262 470 555 568
> 
> # What are the first 3 values that result?
> head(which(agricultureLogical), n = 3)
[1] 125 238 262
> 
```



### 2.  Using the jpeg package read in the following picture of your instructor into R

[ https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg ](https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg)

Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

- [x] -15259150 -10575416 

### My Answer

```
> #install.packages('jpeg')
> # Read here - https://cran.r-project.org/web/packages/jpeg/jpeg.pdf
> library(jpeg)
> 
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg" 
> 
> img <- download.file(fileUrl, 
+                           destfile = "./quiz_data/img.jpg",
+                           mode = "wb")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
Content type 'image/jpeg' length 23849 bytes (23 KB)
downloaded 23 KB

> 
> # read it also in native format
> img <- readJPEG("./quiz_data/img.jpg", native = TRUE)
> 
> # What are the 30th and 80th quantiles of the resulting data? | ?quantile
> quantile(img, prob = c(0.3,0.8))
      30%       80% 
-15259150 -10575416 
> 
> # (some Linux systems may produce an answer 638 different for the 30th quantile)
> 
```



### 3. Load the Gross Domestic Product data for the 190 ranked countries in this data set:

[ https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv) 

Load the educational data from this data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?

Original data sources: 

http://data.worldbank.org/data-catalog/GDP-ranking-table

http://data.worldbank.org/data-catalog/ed-stats

- [x] 189 matches, 13th country is St. Kitts and Nevis

### My Answer

```
> #install.packages("data.table")
> library("data.table")
> # Reads URLs directly :
> fileUrl1 = fread(
+   "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
+   nrows = 190,
+   #Reading starts at line 5
+   skip = 5,
+   select = c(1, 2, 4, 5),
+     #new column names
+   col.names = c(
+     "CountryCode",
+     "Ranking",
+     "Economy",
+     "US dollars"
+     ),
+   key = c("CountryCode")
+ )
 [100%] Downloaded 9630 bytes...
> 
> fileUrl2 = fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
+                  key = c("CountryCode")
+                  )
 [100%] Downloaded 59792 bytes...
> 
> View(fileUrl1)
> View(fileUrl2)
> 
> # Match the data based on the country shortcode. 
> match_data <- merge(fileUrl1, fileUrl2)
> dim(match_data)
[1] 189  34
> dim(fileUrl1)
[1] 190   4
> dim(fileUrl2)
[1] 234  31
> 
> # How many of the IDs match?
> nrow(new_data)
[1] 189
> # Sort the data frame in descending order by GDP rank (so United States is last). 
> th <- match_data[order(-Ranking)]
> View(th)
> # What is the 13th country in the resulting data frame?
> head(th[13,3])
               Economy
1: St. Kitts and Nevis
> 
```

### 4. What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group ?  

- [x] 32.96667, 91.91304

### My Answer

```
> #install.packages("data.table")
> # Load packages
> library("data.table")
> library("dplyr")
> library("plyr")
> 
> 
> # Reads URLs directly :
> fileUrl1 = fread(
+   "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
+   nrows = 190,
+   #Reading starts at line 5
+   skip = 5,
+   select = c(1, 2, 4, 5),
+   #new column names
+   col.names = c("CountryCode",
+                 "Ranking",
+                 "Economy",
+                 "US dollars"),
+   key = c("CountryCode")
+ )
 [100%] Downloaded 9630 bytes...
> 
> fileUrl2 = fread(
+   "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
+   key = c("CountryCode")
+ )
 [100%] Downloaded 59792 bytes...
> 
> # Sort the data frame in descending order by GDP rank (so United States is last). 
> mergeData <- arrange(join(fileUrl1, fileUrl2), desc(Ranking))
Joining by: CountryCode
> View(mergeData)
> 
> # What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group ? 
> rating <- ddply(mergeData,.(`Income Group`), summarize, Rating=mean(Ranking))
> 
> head(rating, n=2)
          Income Group   Rating
1 High income: nonOECD 91.91304
2    High income: OECD 32.96667
> rating[2:1,]
          Income Group   Rating
2    High income: OECD 32.96667
1 High income: nonOECD 91.91304
> 
```



### 5. Cut the GDP ranking into 5 separate quantile groups.  Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP ?

https://www.coursera.org/learn/data-cleaning/lecture/e5qVi/summarizing-data

- [x] 5

### My Answer

```
> #install.packages("data.table")
> #install.packages("Hmisc")
> 
> # Load packages
> library("data.table")
> library("plyr")
> library("Hmisc")
> # Reads URLs directly :
> fileUrl1 = fread(
+   "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
+   nrows = 190,
+   #Reading starts at line 5
+   skip = 5,
+   select = c(1, 2, 4, 5),
+   #new column names
+   col.names = c("CountryCode",
+                 "Ranking",
+                 "Economy",
+                 "US dollars"),
+   key = c("CountryCode")
+ )
 [100%] Downloaded 9630 bytes...
> 
> fileUrl2 = fread(
+   "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
+   key = c("CountryCode")
+ )
 [100%] Downloaded 59792 bytes...
> # Sort the data frame in ascending order by GDP rank (so United States is first)
> mergeData <- arrange(join(fileUrl1, fileUrl2), Ranking)
Joining by: CountryCode
> View(mergeData)
> 
> # Cut the GDP ranking into 5 separate quantile groups.
> mergeData$Cut = cut2(mergeData$Ranking, g=5)
> 
> # Make a table versus Income.Group
> result <- table(mergeData$Cut, mergeData$`Income Group`)
> 
> # How many countries are Lower middle income but among the 38 nations with highest GDP ?
> result[1,4]
[1] 5
> 
```

