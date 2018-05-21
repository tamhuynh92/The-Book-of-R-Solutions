a. Obtain, rounded to two decimal places, the proportion of seismic events in the quakes data frame that occurred at a depth of 300 km or deeper.

b. Remaining with the quakes data set, calculate the mean and median magnitudes of the events that occurred at a depth of 300 km or deeper.

c. Using the chickwts data set, write a for loop that gives you the mean weight of chicks for each feed type—the same as the results given by the tapply function in Section 13.2.1. Display the results rounded to one decimal place and, when printing, ensure each mean is labeled with the appropriate feed type. 


Another ready-to-use data set (in the automatically loaded datasets package) is InsectSprays. It contains data on the number of insects found on various agricultural units, as well as the type of insect spray that was used on each unit. Ensure you can access the data frame at the prompt; then study the help file ?InsectSprays to get an idea of R’s representation of the two variables.

d. Identify the two variable types in InsectSprays (as per the definitions in Section 13.1.1 and Section 13.1.2).

e. Calculate the modes of the distribution of insect counts, regardless of spray type.

f. Use tapply to report the total insect counts by each spray type.

g. Using the same kind of for loop as in (c), compute the percentage of agricultural units in each spray type group that had   at least five bugs on them. When printing to the screen, round the percentages to the nearest whole number.

h. Obtain the same numeric results as in (g), with rounding, but use tapply and a disposable function

#### SOLUTION 

***a***
```R
> length(quakes$depth[quakes$depth>=300])/nrow(quakes)
[1] 0.453
```
***b***
> mean(quakes$mag[quakes$depth>=300])
[1] 4.527373
> median(quakes$mag[quakes$depth>=300])
[1] 4.5
***c***
```R
> feed = levels(chickwts$feed)
> total.weight.each = matrix(0, 3, length(levels(chickwts$feed)), dimnames = list(c("Name","Count", "Mean"), levels(chickwts$feed)))

> for(i in 1:nrow(chickwts)) 
{
  for(j in 1:length(feed)) 
  {
      if((chickwts$feed[i] == feed[j]))
      {
          total.weight.each["Name",j] <- total.weight.each["Name",j] + chickwts$weight[i]
          total.weight.each["Count",j] <- total.weight.each["Count",j] + 1
      }
  }
}
> total.weight.each["Mean",] = round(total.weight.each["Name",]/total.weight.each["Count",], digit = 1)
> total.weight.each
```
```R
      casein horsebean linseed meatmeal soybean sunflower
Name  3883.0    1602.0  2625.0   3046.0  3450.0    3947.0
Count   12.0      10.0    12.0     11.0    14.0      12.0
Mean   323.6     160.2   218.8    276.9   246.4     328.9
```
***d***
Two variable types: discrete numeric variable for count, nomial categorical variable for spray

***e***
```R
> table(InsectSprays$count)

 0  1  2  3  4  5  6  7  9 10 11 12 13 14 15 16 17 19 20 21 22 23 24 26 
 2  6  4  8  4  7  3  3  1  3  3  2  4  4  2  2  4  1  2  2  1  1  1  2 
 > max(table(InsectSprays$count))
[1] 8
```

***f***
```R
> tapply(InsectSprays$count, INDEX = InsectSprays$spray, FUN = sum)
  A   B   C   D   E   F 
174 184  25  59  42 200 
```
***g***
```R
> sprays.type = levels(InsectSprays$spray)
> mytable = matrix(0, 3, length(levels(InsectSprays$spray)), dimnames = list(c("Count","Total", "Percentage"), levels(InsectSprays$spray)))
> for(i in 1:nrow(InsectSprays)) 
 {
     for(j in 1:length(sprays.type)) 
     {
         if((InsectSprays$spray[i] == sprays.type[j]))
         {
             mytable["Total",j] <- mytable["Total",j] + 1
             if(InsectSprays$count[i] >=5)
             {
                 mytable["Count",j] <- mytable["Count",j] + 1
             }
         }
     }
 }
> mytable["Percentage",] = round(mytable["Count",]/mytable["Total",]*100, digit=0) 
> mytable
             A   B  C  D  E   F
Count       12  12  1  7  4  12
Total       12  12 12 12 12  12
Percentage 100 100  8 58 33 100
```
***h***
```R
> tapply(InsectSprays$count, INDEX = InsectSprays$spray, FUN =function(x) round(length(which(x>=5))/length(x)*100, digit=0))
  A   B   C   D   E   F 
100 100   8  58  33 100 
```
