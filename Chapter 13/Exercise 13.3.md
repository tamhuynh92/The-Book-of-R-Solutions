***a***

Using the chickwts data frame, compute the 10th, 30th, and 90th percentiles of all the chick weights and then use tapply to determine which feed type is associated with the highest sample variance of weights


***b***

Turn to the seismic event data in quakes and complete the following tasks:

i. Find the IQR of the recorded depths.

ii. Find the five-number summary of all magnitudes of seismic events that occur at a depth of 400 km or deeper. Compare
this to the summary values found in Section 13.2.3 of those events occurring at less than 400 km and briefly comment on what you notice.

iii. Use your knowledge of cut (Section 4.3.3) to create a new factor vector called depthcat that identifies four evenly spaced categories of quakes$depth so that when you use levels(depthcat), it gives the following:
```
R> levels(depthcat)
[1] "[40,200)" "[200,360)" "[360,520)" "[520,680]"
```
iv. Find the sample mean and standard deviation of the magnitudes of the events associated with each category of depth
according to depthcat.

v. Use tapply to compute the 0.8th quantile of the magnitudes of the seismic events in quakes, split by depthcat.

#### SOLUTION 
***a***
```R
> quantile(chickwts$weight, pro=c(.10,.30,.90))
10% 30% 90% 
153 217 359 
> tapply(chickwts$weight, INDEX = chickwts$feed, function(x) var(x))
   casein horsebean   linseed  meatmeal   soybean sunflower 
 4151.720  1491.956  2728.568  4212.091  2929.956  2384.992 
 ```
 ***b***
 ```R
 #i
 > IQR(quakes$depth)
[1] 444

#ii
> summary(quakes$mag[quakes$depth>=400])
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  4.000   4.200   4.500   4.545   4.700   5.900 
> summary(quakes$mag[quakes$depth<400])
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   4.00    4.40    4.60    4.67    4.90    6.40 
  
#iii
> depthcat <- cut(quakes$depth,breaks = c(40,200,360,520,680), right = F, include.lowest = T)
> levels(depthcat)
[1] "[40,200)"  "[200,360)" "[360,520)" "[520,680]"

#iv
> mylist <- list(NULL, NULL, NULL, NULL)
> names(mylist) <- levels(depthcat)
> for(i in 1:nrow(quakes)) {
    for(j in 1:length(levels(depthcat))) {
        if(depthcat[i] == levels(depthcat)[j]) {
            mylist[[j]] <- c(mylist[[1]],quakes$mag[i])
        }
    }
}
> average <- NULL
> standard.deviation <- NULL
> for(i in mylist) {
    average <- c(average,round(mean(i), digit =5)) 
    standard.deviation <- c(standard.deviation,round(sd(i), digit =3)) 
}
> names(average) <- levels(depthcat)
> names(standard.deviation) <- levels(depthcat)

> average
 [40,200) [200,360) [360,520) [520,680] 
  4.73549   4.73245   4.73221   4.73253 
> standard.deviation
 [40,200) [200,360) [360,520) [520,680] 
    0.404     0.400     0.400     0.401 
    
  ```
