a. Given a list whose members are character string vectors of varying lengths, use a disposable function with lapply to paste an exclamation mark onto the end of each element of each member, with an empty string as the separation character (note that the default behavior of paste when applied to character vectors is to perform the concatenation on each element). Execute your line of code on the list given by the following:
```
foo <- list("a",c("b","c","d","e"),"f",c("g","h","i"))
```

b. Write a recursive version of a function implementing the non-negative integer factorial operator (see Exercise 10.4 on
page 203 for details of the factorial operator). The stopping rule should return the value 1 if the supplied integer is 0. Confirm that your function produces the same results as earlier.
```
i. 5 factorial is 120.
ii. 120 factorial is 479,001,600.
iii. 0 factorial is 1.
```

c. For this problem, I’ll introduce the geometric mean. The geometric mean is a particular measure of centrality, different from the more common arithmetic mean. Given n observations denoted x1, x2, . . ., xn, their geometric mean g ¯ is computed as follows:

![Image](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%2011/Screenshot%202017-10-02%2000.11.32.png?raw=true)

For example, to find the geometric mean of the data 4.3, 2.1, 2.2, 3.1, calculate the following:

g ¯ = (4.3 × 2.1 × 2.2 × 3.1)^(1/4) = 61.5846^(0.25) = 2.8

(This is rounded to 1 d.p.)
Write a function named geolist that can search through a specified list and compute the geometric means of each member per the following guidelines:

– Your function must define and use an internal helper function that returns the geometric mean of a vector argument.

– Assume the list can only have numeric vectors or numeric matrices as its members. Your function should contain an
appropriate loop to inspect each member in turn.

– If the member is a vector, compute the geometric mean of that vector, overwriting the member with the result, which should be a single number.

– If the member is a matrix, use an implicit loop to compute the geometric mean of each row of the matrix, overwriting the member with the results.

– The final list should be returned to the user. Now, as a quick test, check that your function matches the following two calls:

i.
```
R> foo <- list(1:3,matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),4,2),
matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),2,4))
R> geolist(foo)
[[1]]
[1] 1.817121

[[2]]
[1] 3.896152 3.794733 2.946184 4.442972

[[3]]
[1] 3.388035 4.106080
```
ii.
```
R> bar <- list(1:9,matrix(1:9,1,9),matrix(1:9,9,1),matrix(1:9,3,3))
R> geolist(bar)
[[1]]
[1] 4.147166

[[2]]
[1] 4.147166

[[3]]
[1] 1 2 3 4 5 6 7 8 9

[[4]]
[1] 3.036589 4.308869 5.451362
```
#### SOLUTION
***a***
```R
> foo <- list("a",c("b","c","d","e"),"f",c("g","h","i"))
> lapply(foo, FUN = function(x){paste(x, "!", sep= " ")} )
[[1]]
[1] "a !"

[[2]]
[1] "b !" "c !" "d !" "e !"

[[3]]
[1] "f !"

[[4]]
[1] "g !" "h !" "i !"
```
***b***
```R
myfactorial <- function(n) {
    if(n==0) {
        return(1)
    } else if(n>0) {
        return(myfactorial(n-1) * n)
    }
}
> myfactorial(0)
[1] 1
> myfactorial(5)
[1] 120
> myfactorial(120)
[1] 6.689503e+198
> myfactorial(12)
[1] 479001600
```
***c***
```R
geolist <- function(foo) 
{
    geovector <- function(vect) {
        product <- 1
        for(i in vect) {
            product <- product * i
        }
        geometric.result <- product^(1/length(vect))
        return(geometric.result)
    }
    
    geomatrix <- function(mtrx) {
        product.result <- rep(1, nrow(mtrx))
        for(i in 1:nrow(mtrx)) {
            for(j in 1:ncol(mtrx)) {
                product.result[i] <- product.result[i] * mtrx[i,j]
            }
        }
        geometric.result <- product.result^(1/ncol(mtrx))
        return(geometric.result)
    }
    
    
    if(is.list(foo)) {
        geometric.list <- list()
        counter <- 1
        for( lst in foo )
        {
            if(is.vector(lst)) {
                geometric.list[[counter]] <-  geovector(lst)
                counter <- counter + 1
            } else if(is.matrix(lst)) {
               geo.mtrx <- geomatrix(lst)
               geometric.list[[counter]] <-  geo.mtrx
               counter <- counter + 1
            }
        }
    }
    return(geometric.list)
    
}
```
```R
> foo <- list(1:3,matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),4,2),
+             matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),2,4))
> geolist(foo)
[[1]]
[1] 1.817121

[[2]]
[1] 3.896152 3.794733 2.946184 4.442972

[[3]]
[1] 3.388035 4.106080

> bar <- list(1:9,matrix(1:9,1,9),matrix(1:9,9,1),matrix(1:9,3,3))
> geolist(bar)
[[1]]
[1] 4.147166

[[2]]
[1] 4.147166

[[3]]
[1] 1 2 3 4 5 6 7 8 9

[[4]]
[1] 3.036589 4.308869 5.451362
```

