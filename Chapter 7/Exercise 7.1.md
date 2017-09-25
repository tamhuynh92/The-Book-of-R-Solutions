
a. As closely as you can, re-create the following plot:

![Image 1](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%207/Untitled.png?raw=true)

b. With the following data, create a plot of weight on the x-axis and height on the y-axis. Use different point characters or colors to distinguish between males and females and provide a matching legend. Label the axes and give the plot a title.

|Weight(kg) | Height(cm)  | Sex   |
|-----------|-------------|-------|
|55         |161          |Female |
|85         |185          |Male   |
|75         |174          |Male   |
|42         |154          |Female |
|93         |188          |Male   |
|63         |178          |Male   |
|58         |170          |Female |
|75         |167          |Male   |
|89         |181          |Male   |
|67         |178          |Female |

**Solution**

**a**
```R

> x<-  1
> y<-  1
> plot(x,y,type = "n", main = "", xlim=c(-3.25,3.25), ylim = c(6.75,13.25))
> segments(x0 = c(-3,3), y0 = c(7,7), x1 = c(-3,3), y1 = c(13,13), col = "red", lty = 2, lwd = 2)
> segments(x0 = c(-3,-3), y0 = c(7,13), x1 = c(3,3), y1 = c(7,13), col = "red", lty = 2, lwd = 2)
> segments(x0 = c(-3,3), y0 = c(6.5,6.5), x1 = c(-3,3), y1 = c(7,7),col = "red", lty = 1, lwd = 2)
> segments(x0 = c(-3,3), y0 = c(13,13), x1 = c(-3,3), y1 = c(13.5,13.5),col = "red", lty = 1, lwd = 2)
> segments(x0 = c(-3.5,-3.5), y0 = c(7,13), x1 = c(-3,-3), y1 = c(7,13),col = "red", lty = 1, lwd = 2)
> segments(x0 = c(3,3), y0 = c(7,13), x1 = c(3.5,3.5), y1 = c(7,13),col = "red", lty = 1, lwd = 2)

> arrows(x0 = -2.5, y0= 10, x1 = -1, y1=10)
> arrows(x0 = 2.5, y0= 10, x1 = 1, y1=10)
> arrows(x0 = -2.5, y0= 7.5, x1 = -1, y1=9.5)
> arrows(x0 = 2.5, y0= 7.5, x1 = 1, y1=9.5)
> arrows(x0 = -2.5, y0= 12.5, x1 = -1, y1=10.5)
> arrows(x0 = 2.5, y0= 12.5, x1 = 1, y1=10.5)

> text(x=0, y=10, labels = "SOMETHING \n PROFOUND", cex = 0.5)
```
![Image2](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%207/Ex%207.2%20a.png?raw=true)

**b**
```R
> weight <- c(55,86,75,42,93,63,58,75,89,67)
> height <- c(161,185,174,154,188,178,170,167,181,178)
> sex <- c("F", "M", "M", "F", "M", "M", "F", "M", "M", "F")
> plot(weight,height, type = "n", main = "Weight vs. Height", xlab =  "Weight", ylab = "Height")
> points(weight[sex=="M"], height[sex=="M"],pch = 4, col = "blue", cex = 2)
> points(weight[sex=="F"], height[sex=="F"],pch = 3, col = "red", cex = 2)
> legend("bottomright", legend = c("Male", "Female"), pch = c(4,3), col = c("blue", "red"))


```
![Image3](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%207/Ex.%207.1%20Weight%20vs.%20Height.png?raw=true)
