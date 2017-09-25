In Exercise 7.1 (b), you used base R graphics to plot some weight and height data, distinguishing males and females using different points or colors. Repeat this task using ggplot2.


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
```R
> library("ggplot2")
> qplot(weight,height, geom="blank", main = "Weight vs. Height", xlab = "Weight", ylab = "Height" )
> ptype <- rep(NA, length(weight))
> ptype
 [1] NA NA NA NA NA NA NA NA NA NA
> ptype[sex == "M"] <- "Male"
> ptype[sex == "F"] <- "Female"
> ptype <- factor(ptype)
> ptype
 [1] Female Male   Male   Female Male   Male   Female Male   Male   Female
Levels: Female Male
> qplot(weight,height, color=ptype, shape = ptype)
```

