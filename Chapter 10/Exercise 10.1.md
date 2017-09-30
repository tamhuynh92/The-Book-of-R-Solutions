a. Create the following two vectors:
```R
vec1 <- c(2,1,1,3,2,1,0)
vec2 <- c(3,8,2,2,0,0,0)
```
Without executing them, determine which of the following if statements would result in the string being printed to the console. Then confirm your answers in R.
```R
i.   if((vec1[1]+vec2[2])==10){ cat("Print me!") }
ii.  if(vec1[1]>=2&&vec2[1]>=2){ cat("Print me!") }
iii. if(all((vec2-vec1)[c(2,6)]<7)){ cat("Print me!") }
iv.  if(!is.na(vec2[3])){ cat("Print me!") }
```
b. Using vec1 and vec2 from (a), write and execute a line of code that multiplies the corresponding elements of the two vectors together if their sum is greater than 3. Otherwise, the code should simply sum the two elements.

c. 
In the editor, write R code that takes a square character matrix and checks if any of the character strings on the diagonal (top left to bottom right) begin with the letter g, lowercase or uppercase. If satisfied, these specific entries should be overwritten with the string "HERE". Otherwise, the entire matrix should be replaced with an identity matrix of the same dimensions. Then, try your code on the following matrices, checking the result each time:

```R
i.    mymat <- matrix(as.character(1:16),4,4)
ii.   mymat <- matrix(c("DANDELION","Hyacinthus","Gerbera", "MARIGOLD","geranium","ligularia", "Pachysandra", "SNAPDRAGON", "GLADIOLUS"),3,3)
iii.  mymat <- matrix(c("GREAT","exercises","right","here"),2,2,
byrow=T)
```
Hint: This requires some thought—you will find the functions diag from Section 3.2.1 and substr from Section 4.2.4 useful

***Solution***

***a***
```R

> if((vec1[1] + vec2[2] == 10)) { cat("Print me!")}
Print me!
> if(vec1[1] >= 2 && vec2[1] >=2 ) {cat("Print me!")}
Print me!
> if(all((vec2-vec1)[c(2,6)]<7)) {cat("Print me!")}
(Dont' print out anything)
> if(!is.na(vec2[3])) {cat("Print me!")}
Print me!
```

***b***
```R
> result <- ifelse(test=(vec1+vec2 == 3), yes = vec1*vec2, no = vec1 + vec2)
> result
[1] 5 9 2 5 2 1 0
```

***c.***
```R
test <- function(mtrx)
{
if(any((substr(diag(mtrx), 1,1) == 'g') | (substr(diag(mtrx), 1,1) == 'G')) == TRUE) 
{
    result <- which((substr(diag(mtrx), 1,1) == 'g') | (substr(diag(mtrx), 1,1) == 'G')) 
    for(i in result)
    {
        mtrx[i,i] <- "HERE"
    }
}else
{
    mtrx <- diag(nrow(mtrx))
}
mtrx
}

```
```R
> mymat <- matrix(as.character(1:16),4,4)
> test(mymat)
     [,1] [,2] [,3] [,4]
[1,]    1    0    0    0
[2,]    0    1    0    0
[3,]    0    0    1    0
[4,]    0    0    0    1

> mymat <- matrix(c("GREAT","exercises","right","here"),2,2, byrow=T)
> test(mymat)
     [,1]    [,2]       
[1,] "HERE"  "exercises"
[2,] "right" "here"     

> mymat <- matrix(c("DANDELION","Hyacinthus","Gerbera", "MARIGOLD","geranium","ligularia", "Pachysandra", "SNAPDRAGON", "GLADIOLUS"),3,3)
> test(mymat)
     [,1]         [,2]        [,3]         
[1,] "DANDELION"  "MARIGOLD"  "Pachysandra"
[2,] "Hyacinthus" "HERE"      "SNAPDRAGON" 
[3,] "Gerbera"    "ligularia" "HERE"       
```
