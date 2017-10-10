
```R
> hist(USArrests$UrbanPop,breaks=seq(0,100,10),col="gray",main="Histogram of the Porportions of Urban Population",xlab="UrbanPop")
> abline(v=c(quantile(USArrests$UrbanPop,prob=0.25),median(USArrests$UrbanPop),quantile(USArrests$UrbanPop,prob=0.75)),lty=c(1,2,3),lwd=2, col = 'red')
> legend("topleft",legend=c("1st Quartile","Median", "3rd Quartile"),lty=c(1,2,3),lwd=2)
```
