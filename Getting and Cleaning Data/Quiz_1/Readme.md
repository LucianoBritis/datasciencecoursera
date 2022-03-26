## Week 1 Quiz

### 1.  The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf ](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf)

How many properties are worth $1,000,000 or more?

<div>
  <input type="radio" id="one" name="one" value="53" checked = "checked" >
  <label for="one">53</label>
</div>
<div>
  <input type="radio" id="one" name="one" value="25">
  <label for="one">25</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="2076">
  <label for="one">2076</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="164">
  <label for="one">164</label>
</div>

## My Solution

	> # Before starting to solve the problem, we need to prepare the environment.
	> setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_1")
	> 
	> # Checking for and creating directories
	> file.exists("idaho")
	[1] TRUE
	> dir.create("idaho")
	Warning message:
	In dir.create("idaho") : 'idaho' já existe
	> 
	> if(!file.exists("idaho")){
	+   dir.create("./idaho")
	+ }
	> 
	> # Download the 2006 microdata survey about housing for the state of Idaho
	> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
	> 
	> # Friendly name for the file
	> download.file(fileUrl, destfile = "./idaho/idahodata.csv" )
	tentando a URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
	Content type 'text/csv' length 4246554 bytes (4.0 MB)
	downloaded 4.0 MB
	 
	> #listing the downloaded file
	> list.files("./idaho")
	[1] "idahodata.csv"
	> 
	> #Reading Local File
	> idahodata <- read.table("./idaho/idahodata.csv", sep = ',' ,header = TRUE)
	> 
	> # the latest released version from CRAN with
	> #install.packages("dplyr")
	> 
	> #load requerid library
	> library("dplyr") # for functions
	> 
	> # How many properties are worth $1,000,000 or more ? 
	> 
	> # As described in the "code book" we have that: Property value ==  Column "VAL" 
	> 
	> data <- tbl_df(idahodata)
	> 
	> # Removing the original data frame
	> rm(idahodata)
	> 
	> # Property value greater than a 24
	> mydf <- filter(data, VAL >= 24 )
	> 
	> # Showing values with filter applied
	> select(mydf, VAL)
	# A tibble: 53 x 1
	     VAL
	   <int>
	 1    24
	 2    24
	 3    24
	 4    24
	 5    24
	 6    24
	 7    24
	 8    24
	 9    24
	10    24
	# ... with 43 more rows
	> 
	> # Using counter and getting the answer to the question
	> count(mydf)
	# A tibble: 1 x 1
	      n
	  <int>
	1    53
	>

### 2.  Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate? 

<div>
  <input type="radio" id="one" name="one" value="Each variable in a tidy data set has been transformed to be interpretable. ">
  <label for="one">Each variable in a tidy data set has been transformed to be interpretable. </label>
</div>

<div>
  <input type="radio" id="one" name="one" value="Numeric values in tidy data can not represent categories. ">
  <label for="one">Numeric values in tidy data can not represent categories.</label>
</div>
<div>
  <input type="radio" id="one" name="one" value="Tidy data has variable values that are internally consistent. ">
  <label for="one">Tidy data has variable values that are internally consistent. </label>
</div>

<div>
  <input type="radio" id="one" name="one" value="Tidy data has one variable per column." checked = "checked">
  <label for="one">Tidy data has one variable per column.</label>
</div>



1. FES

   - Family type and employment status

   



### 3. Download the Excel spreadsheet on Natural Gas Aquisition Program here: 

[ https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx)

Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:

```
1 dat
```

What is the value of:

```
1 sum(dat$Zip*dat$Ext,na.rm=T)
```

(original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

<div>
  <input type="radio" id="one" name="one" value="NA">
  <label for="one">NA</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="154339">
  <label for="one">154339</label>
</div>


<div>
  <input type="radio" id="one" name="one" value="36534720" checked = "checked" >
  <label for="one">36534720</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="0">
  <label for="one">0</label>
</div>
## My Solution

```
> #Before starting to solve the problem, we need to prepare the environment.
> setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_1")
> 
> # Checking for and creating directories
> file.exists("ngap")
[1] TRUE
> dir.create("ngap")
Warning message:
In dir.create("ngap") : 'ngap' já existe
> 
> if(!file.exists("ngap")){
+   dir.create("./ngap")
+ }
> 
> # install.packages('xlsx')
> library(xlsx)
> 
> # Download the 2006 microdata survey about housing for the state of Idaho
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
> 
> # Friendly name for the file
> download.file(fileUrl, destfile = "./ngap/ngap.xlsx", mode = 'wb')
tentando a URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
Content type 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' length 16197 bytes (15 KB)
downloaded 15 KB
> 
> # Listing the downloaded file
> list.files("./ngap")
[1] "ngap.xlsx"
> print(ans)
[1] "Date Downloaded: Fri Mar 25 21:32:53 2022"
> 
> # Reading Local File
> ngaData <- read.xlsx2("./ngap/ngap.xlsx", sheetIndex = 1 , header = TRUE)
> 
> # Checking dimensions
> dim(ngaData)
[1] 94  2
> 
> colIndex <- 7:15
> rowIndex <- 18:23 
> 
> # Reading data
> dat <- read.xlsx("./ngap/ngap.xlsx", sheetIndex = 1 , colIndex = colIndex, rowIndex = rowIndex)
> 
> # Sum the value
> sum(dat$Zip*dat$Ext,na.rm=T)
[1] 36534720
> 
```



### 4. Read the XML data on Baltimore restaurants from here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml ](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml)

How many restaurants have zipcode 21231? 



<div>
  <input type="radio" id="one" name="one" value="100">
  <label for="one">100</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="127" checked = "checked">
  <label for="one">127</label>
</div>
<div>
  <input type="radio" id="one" name="one" value="156">
  <label for="one">156</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="17">
  <label for="one">17</label>
</div>
## My Solution

```
> # Before starting to solve the problem, we need to prepare the environment
> setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/w1")
Error in setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/w1") : 
  não é possível mudar o diretório de trabalho
> 
> #install.packages("XML")
> 
> # Load the package required to read XML files.
> library(XML)
> 
> # Also load the other required package.
> # library("methods")
> 
> fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
> 
> # Reading XML File
> doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)
> 
> # Print the result.
> rootNode <- xmlRoot(doc)
> 
> # Exract the root node form the xml file.
> xmlName(rootNode)
[1] "response"
> 
> # Applies a function to each of the children of an XMLNode
> #xmlApply(rootNode, xmlValue)
> 
> ## How many restaurants have zipcode 21231 ? 
> 
> # Get the Elements of a Node
> zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
> 
> # Sum Elements
> sum(zipcode == "21231")
[1] 127
> 
```




### 5. The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

using the fread() command load the data into an R object

```
1 DT
```

The following are ways to calculate the average value of the variable

```
1 pwgtp15
```

broken down by sex. Using the data.table package, which will deliver the fastest user time? 

<div>
  <input type="radio" id="one" name="one" value="DT[,mean(pwgtp15),by=SEX]"
         checked = "checked">
  <label for="one">DT[,mean(pwgtp15),by=SEX]</label>
</div>


<div>
  <input type="radio" id="one" name="one" value="rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]"
         checked>
  <label for="one">rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]</label>
</div>

<div>
  <input type="radio" id="two" name="two" value="tapply(DT$pwgtp15,DT$SEX,mean)">
  <label for="two">tapply(DT$pwgtp15,DT$SEX,mean)</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="sapply(split(DT$pwgtp15,DT$SEX),mean)"
         checked>
  <label for="one">sapply(split(DT$pwgtp15,DT$SEX),mean)</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)"
         checked>
  <label for="one">mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)</label>
</div>

<div>
  <input type="radio" id="one" name="one" value="mean(DT$pwgtp15,by=DT$SEX)"
         checked>
  <label for="one">mean(DT$pwgtp15,by=DT$SEX)</label>
</div>
## My Solution


```
> setwd("G:/Ambiente de Dev/Labs R/programing R/dataset/gcd/quiz_1")
> 
> file.exists("communities")
[1] TRUE
> dir.create("communities")
Warning message:
In dir.create("communities") : 'communities' já existe
> 
> if (!file.exists("communities")){
+   dir.create("./communities")
+ }
> 
> ## Download the 2006 microdata survey about housing for the state of Idaho
> #install.packages("data.table")
> 
> # Download from a url:
> url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
> 
> # Friendly name for the file
> download.file(url, destfile = "./communities/communities.csv")
tentando a URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
Content type 'text/csv' length 11462469 bytes (10.9 MB)
downloaded 10.9 MB

> 
> #listing the downloaded file
> list.files("./communities")
[1] "communities.csv"
> 
> # load the data.table package using library()
> library(data.table)
> input <- "communities/communities.csv"
> 
> DT <- fread(input)
> file <-tempfile()
> write.table(DT, file = file, row.names = FALSE, col.names = TRUE, sep = ",", quote = FALSE)
> system.time(fread(file))
  usuário   sistema decorrido 
     0.15      0.00      0.75 
> 
> # Using the data.table package, which will deliver the fastest user time? 
> #---------------------------------------
> 
> system.time(DT[,mean(pwgtp15),by=SEX])
  usuário   sistema decorrido 
        0         0         0 
> #---------------------------------------
> system.time(rowMeans(DT)[DT$SEX==1]);system.time(rowMeans(DT)[DT$SEX==2])
Error in rowMeans(DT) : 'x' deve ser numérico
Timing stopped at: 1.71 0.04 1.75
> #---------------------------------------
> system.time(tapply(DT$pwgtp15,DT$SEX,mean))
  usuário   sistema decorrido 
        0         0         0 
> #---------------------------------------
> system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
  usuário   sistema decorrido 
        0         0         0 
> #---------------------------------------
> system.time(mean(DT[DT$SEX==1,]$pwgtp15));system.time(mean(DT[DT$SEX==2,]$pwgtp15))
  usuário   sistema decorrido 
        0         0         0 
  usuário   sistema decorrido 
     0.00      0.00      0.02 
> #---------------------------------------
> system.time(mean(DT$pwgtp15,by=DT$SEX))
  usuário   sistema decorrido 
        0         0         0 
> 
```

