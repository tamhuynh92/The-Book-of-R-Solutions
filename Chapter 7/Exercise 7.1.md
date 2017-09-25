
a. As closely as you can, re-create the following plot:





```python
> x<-  1
> y<-  1
> plot(x,y,type = "n", main = "", xlim=c(-3.25,3.25), ylim = c(6.75,13.25))
> segments(x0 = c(-3,3), y0 = c(7,7), x1 = c(-3,3), y1 = c(13,13), col = "red", lty = 2, lwd = 2)
> segments(x0 = c(-3,-3), y0 = c(7,13), x1 = c(3,3), y1 = c(7,13), col = "red", lty = 2, lwd = 2)
> segments(x0 = c(-3,3), y0 = c(6.5,6.5), x1 = c(-3,3), y1 = c(7,7),col = "red", lty = 1, lwd = 2)
> segments(x0 = c(-3,3), y0 = c(13,13), x1 = c(-3,3), y1 = c(13.5,13.5),col = "red", lty = 1, lwd = 2)
> segments(x0 = c(-3.5,-3.5), y0 = c(7,13), x1 = c(-3,-3), y1 = c(7,13),col = "red", lty = 1, lwd = 2)
>  segments(x0 = c(3,3), y0 = c(7,13), x1 = c(3.5,3.5), y1 = c(7,13),col = "red", lty = 1, lwd = 2)

> arrows(x0 = -2.5, y0= 10, x1 = -1, y1=10)
> arrows(x0 = 2.5, y0= 10, x1 = 1, y1=10)
> arrows(x0 = -2.5, y0= 7.5, x1 = -1, y1=9.5)
> arrows(x0 = 2.5, y0= 7.5, x1 = 1, y1=9.5)
> arrows(x0 = -2.5, y0= 12.5, x1 = -1, y1=10.5)
> arrows(x0 = 2.5, y0= 12.5, x1 = 1, y1=10.5)

> text(x=0, y=10, labels = "SOMETHING \n PROFOUND", cex = 0.5)



> weight <- c(55,86,75,42,93,63,58,75,89,67)
> height <- c(161,185,174,154,188,178,170,167,181,178)
> sex <- c("F", "M", "M", "F", "M", "M", "F", "M", "M", "F")
> plot(weight,height, type = "n", main = "Weight vs. Height", xlab =  "Weight", ylab = "Height")
> points(weight[sex=="M"], height[sex=="M"],pch = 4, col = "blue", cex = 2)
> points(weight[sex=="F"], height[sex=="F"],pch = 3, col = "red", cex = 2)
> legend("bottomright", legend = c("Male", "Female"), pch = c(4,3), col = c("blue", "red"))


```
