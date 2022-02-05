```
# Console R
> getwd()
[1] "G:/Ambiente de Dev/Labs R/programing R/dataset"
```

```
# Terminal R
Programer@Britis-PC  /g/Ambiente de Dev/Labs R/programing R/dataset
$ ls -lh
drwxr-xr-x 1 Programer 197121    0 Feb  2 14:21 specdata

```

```
Programer@Britis-PC  /g/Ambiente de Dev/Labs R/programing R/dataset
$ cd specdata

Programer@Britis-PC  /g/Ambiente de Dev/Labs R/programing R/dataset/specdata
$ ls
001.csv  029.csv  057.csv  085.csv  113.csv  141.csv  169.csv  197.csv  225.csv  253.csv  281.csv  309.csv
002.csv  030.csv  058.csv  086.csv  114.csv  142.csv  170.csv  198.csv  226.csv  254.csv  282.csv  310.csv
003.csv  031.csv  059.csv  087.csv  115.csv  143.csv  171.csv  199.csv  227.csv  255.csv  283.csv  311.csv
004.csv  032.csv  060.csv  088.csv  116.csv  144.csv  172.csv  200.csv  228.csv  256.csv  284.csv  312.csv
005.csv  033.csv  061.csv  089.csv  117.csv  145.csv  173.csv  201.csv  229.csv  257.csv  285.csv  313.csv
006.csv  034.csv  062.csv  090.csv  118.csv  146.csv  174.csv  202.csv  230.csv  258.csv  286.csv  314.csv
007.csv  035.csv  063.csv  091.csv  119.csv  147.csv  175.csv  203.csv  231.csv  259.csv  287.csv  315.csv
008.csv  036.csv  064.csv  092.csv  120.csv  148.csv  176.csv  204.csv  232.csv  260.csv  288.csv  316.csv
009.csv  037.csv  065.csv  093.csv  121.csv  149.csv  177.csv  205.csv  233.csv  261.csv  289.csv  317.csv
010.csv  038.csv  066.csv  094.csv  122.csv  150.csv  178.csv  206.csv  234.csv  262.csv  290.csv  318.csv
011.csv  039.csv  067.csv  095.csv  123.csv  151.csv  179.csv  207.csv  235.csv  263.csv  291.csv  319.csv
012.csv  040.csv  068.csv  096.csv  124.csv  152.csv  180.csv  208.csv  236.csv  264.csv  292.csv  320.csv
013.csv  041.csv  069.csv  097.csv  125.csv  153.csv  181.csv  209.csv  237.csv  265.csv  293.csv  321.csv
014.csv  042.csv  070.csv  098.csv  126.csv  154.csv  182.csv  210.csv  238.csv  266.csv  294.csv  322.csv
015.csv  043.csv  071.csv  099.csv  127.csv  155.csv  183.csv  211.csv  239.csv  267.csv  295.csv  323.csv
016.csv  044.csv  072.csv  100.csv  128.csv  156.csv  184.csv  212.csv  240.csv  268.csv  296.csv  324.csv
017.csv  045.csv  073.csv  101.csv  129.csv  157.csv  185.csv  213.csv  241.csv  269.csv  297.csv  325.csv
018.csv  046.csv  074.csv  102.csv  130.csv  158.csv  186.csv  214.csv  242.csv  270.csv  298.csv  326.csv
019.csv  047.csv  075.csv  103.csv  131.csv  159.csv  187.csv  215.csv  243.csv  271.csv  299.csv  327.csv
020.csv  048.csv  076.csv  104.csv  132.csv  160.csv  188.csv  216.csv  244.csv  272.csv  300.csv  328.csv
021.csv  049.csv  077.csv  105.csv  133.csv  161.csv  189.csv  217.csv  245.csv  273.csv  301.csv  329.csv
022.csv  050.csv  078.csv  106.csv  134.csv  162.csv  190.csv  218.csv  246.csv  274.csv  302.csv  330.csv
023.csv  051.csv  079.csv  107.csv  135.csv  163.csv  191.csv  219.csv  247.csv  275.csv  303.csv  331.csv
024.csv  052.csv  080.csv  108.csv  136.csv  164.csv  192.csv  220.csv  248.csv  276.csv  304.csv  332.csv
025.csv  053.csv  081.csv  109.csv  137.csv  165.csv  193.csv  221.csv  249.csv  277.csv  305.csv
026.csv  054.csv  082.csv  110.csv  138.csv  166.csv  194.csv  222.csv  250.csv  278.csv  306.csv
027.csv  055.csv  083.csv  111.csv  139.csv  167.csv  195.csv  223.csv  251.csv  279.csv  307.csv
028.csv  056.csv  084.csv  112.csv  140.csv  168.csv  196.csv  224.csv  252.csv  280.csv  308.csv
```



## Part 1

#### My Code Resolution, file saved as *pollutantmean.R*

```
pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, pattern = ".csv", full.names = TRUE)
  datasets <- data.frame()
    for (i in id) {
      #loops through the files, rbinding them together
      datasets <- rbind(datasets, read.csv(files_list[i]))
    }
  mean(datasets[ ,pollutant], na.rm = TRUE)
}
```



#### You can test this function by running it a few different id's and pollutant:

```
> pollutantmean("specdata", "nitrate", 100)
[1] 0.575615
```

```
> pollutantmean("specdata", "nitrate", 1:100)
[1] 1.706047
```

```
> pollutantmean("specdata", "sulfate", 10:20)
[1] 1.355225
```





