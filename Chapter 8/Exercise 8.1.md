***a. In R’s built-in datasets library is the data frame quakes. Make sure you can access this object and view the corresponding help file to get an idea of what this data represents. Then, do the following:***

i. Select only those records that correspond to a magnitude (mag) of greater than or equal to 5 and write them to a table-format file called q5.txt in an existing folder on your machine. Use a delimiting character of ! and do not include any row names.

ii. Read the file back into your R workspace, naming the object q5.dframe

***b. In the contributed package car, there’s a data frame called Duncan, which provides historical data on perceived job prestige in 1950. Install the car package and access the Duncan data set and its help file. Then, do the following:***

i. Write R code that will plot education on the x-axis and income on the y-axis, with both x- and y-axis limits fixed to be [0,100]. Provide appropriate axis labels. For jobs with a prestige value of less than or equal to 80, use a black ◦ as the point character. For jobs with prestige greater than 80, use a blue •.

ii. Add a legend explaining the difference between the two types of points and then save a 500 × 500 pixel .png file of the image.
    
***c. Create a list called exer that contains the three data sets quakes, q5.dframe, and Duncan. Then, do the following:***

i. Write the list object directly to disk, calling it Exercise8-1.txt. Briefly inspect the contents of the file in a text editor.
ii. Read Exercise8-1.txt back into your workspace; call the resulting object list.of.dataframes. Check that list.of.dataframes does indeed contain the three data frame objects.
    
***d. In Section 7.4.3, you created a ggplot2 graphic of 20 observations displayed as the bottom image of Figure 7-11 on page 144. Use ggsave to save a copy of this plot as a .tiff file.***


***Solution***
***a***

```R
> write.table(x=quakes[quakes$mag>=5,], file="/Users/tamhuynh/Desktop/R Programming/q5.txt", 
sep = "!", quote=FALSE, row.names = FALSE)
> q5.dframe <- read.table(file="/Users/tamhuynh/Desktop/R Programming/q5.txt", header = TRUE,
sep = "!", stringsAsFactors = FALSE)
```

b.
```R
> install.packages("car")
> library("car")
> data('Duncan')
> x <- Duncan$education
> y <- Duncan$income
> png(filename="/Users/tamhuynh/Desktop/R Programming/EducationvsIncome.png", width = 500, height = 500)
> plot(x,y,type="n", main="Education vs. Income", xlab = "Education", ylab = "Income", xlim = c(0,100), ylim = c(0,100))
> points(x[Duncan$prestige <=80], y[Duncan$prestige <=80], col = "black")
> points(x[Duncan$prestige > 80], y[Duncan$prestige > 80], col = "blue", pch = 19)
> legend("bottomright", legend = c("Prestige <= 80", "Prestige > 80"), pch = c(NA,19), col = c("black", "blue"))
> dev.off()
RStudioGD 
        2 
```
![Image](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%208/EducationvsIncome.png?raw=true)

c.
```R
> dput(lst, file="/Users/tamhuynh/Desktop/R Programming/Exercise8-1.txt")
> newlst <- dget(file="/Users/tamhuynh/Desktop/R Programming/Exercise8-1.txt")
> newlst
```

d.
```R
> ggsave(filename="/Users/tamhuynh/Desktop/R Programming/Figure 7.11.tiff")
```
![Image2](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%208/Figure%207.11.tiff)
