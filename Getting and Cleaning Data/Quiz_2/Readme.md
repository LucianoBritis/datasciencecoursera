## Week 2 Quiz

### 1. Register an application with the Github API here https://github.com/settings/applications. Access the API to get information on your instructors repositories (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). Use this data to find the time that the datasharing repo was created. What time was it created?

This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). You may also need to run the code in the base R package and not R studio.

- [x] 2013-11-07T13:25:07Z

### My Answer

```
> #install.packages("httr")
> library(httr)
> 
> #install.packages("jsonlite")
> library(jsonlite)
> 
> #install.packages("httpuv")
> library(httpuv)
> 
> 
> # 1. Find OAuth settings for github:
> #    http://developer.github.com/v3/oauth/
> 
> oauth_endpoints("github")
<oauth_endpoint>
 authorize: https://github.com/login/oauth/authorize
 access:    https://github.com/login/oauth/access_token
> 
> # 2. To make your own application, register at
> #    https://github.com/settings/developers. Use any URL for the homepage URL
> #    (http://github.com is fine) and  http://localhost:1410 as the callback url
> #
> #    Replace your key and secret below.
> myapp <- oauth_app("github",
+                    key = "7410ab95f294460841db",
+                    secret = "*****5411868e"
+ )
> 
> # 3. Get OAuth credentials
> github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
> 
> # 4. Use API
> gtoken <- config(token = github_token)
> # get the repo weblink: https://api.github.com/users/jtleek/repos using token
> req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
> 
> stop_for_status(req)
> 
> # Authentication complete. Please close this page and return to R.
> 
> # Extract content from a request
> json1 <- content(req)
> 
> # Convert to a data.frame
> df = jsonlite::fromJSON(jsonlite::toJSON(json1))
> 
> # Find “datasharing”
> df$name
[[1]]
[1] "2018"

[[2]]
[1] "ads2020"

[[3]]
[1] "advdatasci"

[[4]]
[1] "advdatasci-project"

[[5]]
[1] "advdatasci-swirl"

[[6]]
[1] "advdatasci15"

[[7]]
[1] "advdatasci16"

[[8]]
[1] "advdatasci_swirl"

[[9]]
[1] "alg-fairness-app-wireframe"

[[10]]
[1] "ballgown"

[[11]]
[1] "big_course"

[[12]]
[1] "bookdown-start"

[[13]]
[1] "books"

[[14]]
[1] "capitalIn21stCenturyinR"

[[15]]
[1] "careerplanning"

[[16]]
[1] "coc"

[[17]]
[1] "courses"

[[18]]
[1] "COVID-19"

[[19]]
[1] "crsra"

[[20]]
[1] "cshlcg-labs"

[[21]]
[1] "data"

[[22]]
[1] "dataanalysis"

[[23]]
[1] "datascientist"

[[24]]
[1] "datasharing"

[[25]]
[1] "datawomenontwitter"

[[26]]
[1] "day1"

[[27]]
[1] "derfinder"

[[28]]
[1] "derfinder-1"

[[29]]
[1] "DSM"

[[30]]
[1] "EDA-Project"

> 
> #What time "datasharing" was it created ?
> 
> df$created_at[24]
[[1]]
[1] "2013-11-07T13:25:07Z"
> 
```



### 2. The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL. 

Download the American Community Survey data and load it into an R object called 

```
1 acs
```

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?

- [x] sqldf("select pwgtp1 from acs where AGEP < 50")

### My Answer

```
setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_2")
# install.packages('sqldf')
library(sqldf)

# Download the American Community Survey data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

# Friendly name for the file
download.file(fileUrl, destfile = "./getdata.csv")

data <- read.csv("getdata.csv")

class(data)
class(acs)

setDT(data)
# Listing the downloaded file
list.files("./")

dateDownloaded <- date()
print(dateDownloaded)

# convert data.frame to data.table
acs <- data.table::data.table(read.table("getdata.csv"))

names(acs)

sqldf("select pwgtp1 from acs where AGEP < 50")
```



### 3. Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)

- [x] sqldf("select distinct AGEP from acs")

### My Answer

```
> AGEP <- unique(acs$AGEP)
 [1] 43 42 16 14 29 40 15 28 30  4  1 18 37 39  3 87 70 49 45 50 60 59 61 64 35 12 19 31  9  0 33 32 20 88 53
[36] 58 69 68 48 24 27 74 56 75 17 38 55 26 23 86 81 77  7 51 13 11 82 47 46 80 21 54 78 67 22  2 76  6 71 34
[71] 10  5 65 62 63 57 52 79 83 66 25 93  8 36 41 44 84 72 73 85 89
> # Object Classes
> class(AGEP)
[1] "integer"

```

**Equivalent function**

```
> setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_2")
> # install.packages('sqldf')
> library(sqldf)
> 
> # Download the American Community Survey data
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
> 
> # Friendly name for the file
> download.file(fileUrl, destfile = "./getdata.csv")
tentando a URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
Content type 'text/csv' length 11462469 bytes (10.9 MB)
downloaded 10.9 MB

> 
> data <- read.csv("getdata.csv")
> 
> # Listing the downloaded file
> list.files("./")
[1] "getdata.csv" "Github.R"    "sqldf.R"     "teste2.R"   
> 
> dateDownloaded <- date()
> print(dateDownloaded)
[1] "Sun Apr 11 21:16:33 2022"
> 
> # convert 
> acs <- data.table::data.table(read.csv("getdata.csv"))
> # Object Classes
> class(acs)
[1] "data.table" "data.frame"
> 
> AGEP <- unique(acs$AGEP)
> # Object Classes
> class(AGEP)
[1] "integer"
> 
```

- **Testing possibilities to find the real thing**

```
> test_a <- sqldf("select distinct pwgtp1 from acs")
> test_b <- sqldf("select distinct AGEP from acs")
> test_c <- sqldf("select unique AGEP from acs")
Erro: near "unique": syntax error
> test_d <- sqldf("select AGEP where unique from acs")
Erro: near "unique": syntax error
> 
> #Grouping the outputs with the identical function
> 
> identical(as.data.frame(AGEP), test_a)
[1] FALSE
> identical(as.data.frame(AGEP), test_b)
[1] TRUE
> identical(as.data.frame(AGEP), test_c)
Error in identical(as.data.frame(AGEP), test_c) : 
  objeto 'test_c' não encontrado
> identical(as.data.frame(AGEP), test_d)
Error in identical(as.data.frame(AGEP), test_d) : 
  objeto 'test_d' não encontrado
> 

```

- **Viewing the outputs for the true test paired with AGEP**

```
> view <- cbind(AGEP, test_b)
> # top 5
> head(view)
  AGEP AGEP
1   43   43
2   42   42
3   16   16
4   14   14
5   29   29
6   40   40
> # last 5
> tail(view)
   AGEP AGEP
86   44   44
87   84   84
88   72   72
89   73   73
90   85   85
91   89   89
> 
```



### 4. How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:

http://biostat.jhsph.edu/~jleek/contact.html

(Hint: the nchar() function in R may be helpful)

- [x] 45 31  7 25

### **My Answer**

- > *The last value is divergent due to the alteration of the page in the course of time, so the function is correct and the value of the answer in the question is also based on the time in which it was prepared.*

```
> ### How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: ?
> setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_2")
> library(httr)
> library(RCurl)
> #(Hint: the nchar() function in R may be helpful)
> 
> con <- url("https://biostat.jhsph.edu/~jleek/contact.html")
> htmlCode <-readLines(con)
Error in readLines(con) : não é possível abrir a conexão
Além disso: Warning message:
In readLines(con) :
  falha em InternetOpenUrl: 'O nome do host deste certificado não é válido ou não coincide'
> 
> # The error allows the page to be read, pass the head function to see the result of reading the page
> head(htmlCode)
[1] "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">"
[2] ""                                                                                                                 
[3] "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">"                                        
[4] ""                                                                                                                 
[5] "<head>"                                                                                                           
[6] ""                                                                                                                 
> 
> # Using nchar count the characters of each line
> count <- nchar(htmlCode, allowNA = FALSE)
> 
> # Extracting the result to the desired lines
> result <- c(count[10], count[20], count[30], count[100])
> 
> #displaying the output
> result
[1] 45 31  7  4
> ## Optional
> # Testing the position of the first two elements, if the quantity is unique, they will bring the same value.
> match(c(45, 31), count)
[1] 10 20
> 
```



### 5. Read this data set into R and report the sum of the numbers in the fourth of the nine columns.

https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for

(Hint this is a fixed width file format)

- [x] 32426.7

### **My Answer**

```
> ## Analyzing the file structure
> con <-
+   url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
> htmlCode <- readLines(con)
> close(con)
> 
> # create a dataframe
> htmlCode <- as.data.frame(htmlCode)
> head(htmlCode)
                                                        htmlCode
1               Weekly SST data starts week centered on 3Jan1990
2                                                               
3                  Nino1+2      Nino3        Nino34        Nino4
4  Week          SST SSTA     SST SSTA     SST SSTA     SST SSTA
5  03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3
6  10JAN1990     23.4-0.8     25.2-0.3     26.6 0.1     28.6 0.3
> 
> #Reading a Fixed Width Format Files.
> data_read <-
+   read.fwf(
+     "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
+     skip = 4,
+     #Reading starts at line 4
+     width = c(12, 7, 4, 9, 4, 9, 4, 9, 4),
+     #length of values in each column
+     #new column names
+     col.names = c(
+       "Week",
+       "Nino12SST",
+       "Nino12SSTA",
+       "Nino3SST",
+       "Nino3SSTA",
+       "Nino34SST",
+       "Nino34SSTA",
+       "Nino4SST",
+       "Nino4SSTA"
+     )
+   )
> class(data_read)
[1] "data.frame"
> head(data_read, 3)
          Week Nino12SST Nino12SSTA Nino3SST Nino3SSTA Nino34SST Nino34SSTA Nino4SST Nino4SSTA
1  03JAN1990        23.4       -0.4     25.1      -0.3      26.6        0.0     28.6       0.3
2  10JAN1990        23.4       -0.8     25.2      -0.3      26.6        0.1     28.6       0.3
3  17JAN1990        24.2       -0.3     25.3      -0.3      26.5       -0.1     28.6       0.3
> sum_col_4 <- sum(data_read$Nino3SST)
> sum_col_4
[1] 32426.7
> 
```


