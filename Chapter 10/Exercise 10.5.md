a. Continuing on from the most recent example in the text, write an implicit loop that calculates the product of all the column elements of the matrix returned by the call to apply(foo,1,sort,decreasing=TRUE).

b. Convert the following for loop to an implicit loop that does exactly the same thing:
```
> matlist <- list(matrix(c(T,F,T,T),2,2), matrix(c("a","c","b","z","p","q"),3,2), matrix(1:8,2,4))
> matlist
> for(i in 1:length(matlist)){
    matlist[[i]] <- t(matlist[[i]])
   }
> matlist
```

c. In R, store the following 4 × 4 × 2 × 3 array as the object qux:
```
R> qux <- array(96:1,dim=c(4,4,2,3))
```
That is, it is a four-dimensional array comprised of three blocks, with each block being an array made up of two layers of 4 × 4 matrices. Then, do the following:

i. Write an implicit loop that obtains the diagonal elements of all second-layer matrices only to produce the following matrix:
```
      [,1]  [,2] [,3]
[1,]    80    48    16
[2,]    75    43    11
[3,]    70    38    6
[4,]    65    33    1
```
ii. Write an implicit loop that will return the dimensions of each of the three matrices formed by accessing the fourth column
of every matrix in qux, regardless of layer or block, wrapped by another implicit loop that finds the row sums of that returned structure, resulting simply in the following vector:
```
[1] 12 6
```

***SOLUTION***
***a***
```R
> foo1 <- apply(foo,1,sort,decreasing=TRUE)
> foo1
     [,1] [,2] [,3] [,4]
[1,]    9   10   11   12
[2,]    5    6    7    8
[3,]    1    2    3    4
> for(i in 1:ncol(foo1)) {
     for(j in 1:nrow(foo1)){
         product[i] = product[i] * foo1[j,i]
     }
 }
> product
[1]  45 120 231 384
```

***b***
```R
> for(i in matlist) {
     i = t(i)
 }
> matlist
```
***c***
***i***

```R
> apply(qux[,,2,], 3, FUN = diag)
     [,1] [,2] [,3]
[1,]   80   48   16
[2,]   75   43   11
[3,]   70   38    6
[4,]   65   33    1
```
