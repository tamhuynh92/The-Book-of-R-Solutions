a. In Exercise 11.3 (b) on page 238, your task was to write a recursive R function to compute integer factorials, given some supplied non-negative integer x. Now, modify your function so that it throws an error (with an appropriate message) if x is negative. Test your new function responses by using the following:
```
i. x as 5
ii. x as 8
iii. x as -8
```
b. The idea of matrix inversion, briefly discussed in Section 3.3.6, is possible only for certain square matrices (those with an equal number of columns as rows). These inversions can be computed using the solve function, for example:
```R
R> solve(matrix(1:4,2,2))
    [,1] [,2]
[1,] -2 1.5
[2,] 1 -0.5
```
Note that solve throws an error if the supplied matrix cannot be inverted. With this in mind, write an R function that
attempts to invert each matrix in a list, according to the following guidelines:

– The function should take four arguments.

  * The list x whose members are to be tested for matrix inversion
  * A value noninv to fill in results where a given matrix member of x cannot be inverted, defaulting to NA
  * A character string nonmat to be the result if a given member of x is not a matrix, defaulting to "not a matrix"
  * A logical value silent, defaulting to TRUE, to be passed to try in the body code
  
– The function should first check whether x is in fact a list. If not, it should throw an error with an appropriate message.
– Then, the function should ensure that x has at least one member. If not, it should throw an error with an appropriate message.
– Next, the function should check whether nonmat is a character string. If not, it should try to coerce it to a character string using an appropriate “as-dot” function (see Section 6.2.4), and it should issue an appropriate warning. 
– After these checks, a loop should search each member i of the list x.
  * If member i is a matrix, attempt to invert it with try. If it’s invertible without error, overwrite member i of x with the result. If an error is caught, then member i of x should be overwritten with the value of noninv.
  * If member i is not a matrix, then member i of x should be overwritten with the value of nonmat.
– Finally, the modified list x should be returned. Now, test your function using the following argument values to make sure it responds as expected:

i. x as
```
list(1:4,matrix(1:4,1,4),matrix(1:4,4,1),matrix(1:4,2,2))
```
and all other arguments at default.

ii. x as in (i), noninv as Inf, nonmat as 666, silent at default.

iii. Repeat (ii), but now with silent=FALSE.

iv. x as
```
list(diag(9),matrix(c(0.2,0.4,0.2,0.1,0.1,0.2),3,3), 
rbind(c(5,5,1,2),c(2,2,1,8),c(6,1,5,5),c(1,0,2,0)), 
matrix(1:6,2,3),cbind(c(3,5),c(6,5)),as.vector(diag(2)))
```
and noninv as "unsuitable matrix"; all other values at default.

Finally, test the error messages by attempting calls to your function with the following:

v. x as "hello"

vi. x as list()

#### SOLUTION
*** a ***
```R
myfactorial <- function(n) {
    if(n==0) {
        return(1)
    } else if(n>0) {
        return(myfactorial(n-1) * n)
    } else {
        stop("'n' is less than or equal to 0... TERMINATE")
    }
}

> myfactorial(5)
[1] 120
> myfactorial(8)
[1] 40320
> myfactorial(-8)
Error in myfactorial(-8) : 'n' is less than or equal to 0... TERMINATE
> myfactorial(0)
[1] 1
```

*** b ***
```R
inversemtrx <- function(x, noninv = NA, nonmat = "not a matrix", silent = TRUE) 
{
    if(is.list(x)) 
    {
        if(length(x) == 0) {
            stop("x doesn't have any member")
        }
    } else {
        stop("x is not a list")
    }
    
    if(is.character(nonmat) == FALSE) {
        nonmat <- as.character(nonmat)
        warning("nonmat is not a character string. System is automatic convert to character string.")
    } 
    
    for(i in 1:length(x)) 
    {
       if(is.matrix(x[[i]]) == TRUE) {
           attempt <- try(solve(x[[i]]), silent)
           if(class(attempt)=="try-error")
           {
               x[[i]] <- noninv
           } else {
               x[[i]] <- attempt
               
           }
       } else {
           x[[i]] <- nonmat
       }
    }
    return(x)
}
```
```R
> x <- list(1:4,matrix(1:4,1,4),matrix(1:4,4,1),matrix(1:4,2,2))
> inversemtrx(x, noninv= Inf, nonmat =666)
[[1]]
[1] "666"

[[2]]
[1] Inf

[[3]]
[1] Inf

[[4]]
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

Warning message:
In inversemtrx(x, noninv = Inf, nonmat = 666) :
  nonmat is not a character string. System is automatic convert to character string.
> x <- list(1:4,matrix(1:4,1,4),matrix(1:4,4,1),matrix(1:4,2,2))
> inversemtrx(x, noninv= Inf, nonmat =666, silent = FALSE)
Error in solve.default(x[[i]]) : 'a' (1 x 4) must be square
In addition: Warning message:
In inversemtrx(x, noninv = Inf, nonmat = 666, silent = FALSE) :
  nonmat is not a character string. System is automatic convert to character string.
Error in solve.default(x[[i]]) : 'a' (4 x 1) must be square
[[1]]
[1] "666"

[[2]]
[1] Inf

[[3]]
[1] Inf

[[4]]
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

> x <- list(diag(9),matrix(c(0.2,0.4,0.2,0.1,0.1,0.2),3,3),  rbind(c(5,5,1,2),c(2,2,1,8),c(6,1,5,5),c(1,0,2,0)), 
+           matrix(1:6,2,3),cbind(c(3,5),c(6,5)),as.vector(diag(2)))
> inversemtrx(x, noninv= "unsuitable matrix")
[[1]]
      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]
 [1,]    1    0    0    0    0    0    0    0    0
 [2,]    0    1    0    0    0    0    0    0    0
 [3,]    0    0    1    0    0    0    0    0    0
 [4,]    0    0    0    1    0    0    0    0    0
 [5,]    0    0    0    0    1    0    0    0    0
 [6,]    0    0    0    0    0    1    0    0    0
 [7,]    0    0    0    0    0    0    1    0    0
 [8,]    0    0    0    0    0    0    0    1    0
 [9,]    0    0    0    0    0    0    0    0    1

[[2]]
[1] "unsuitable matrix"

[[3]]
             [,1]       [,2]        [,3]        [,4]
[1,]  0.019900498 -0.2288557  0.35820896 -0.79104478
[2,]  0.203980100  0.1542289 -0.32835821  0.64179104
[3,] -0.009950249  0.1144279 -0.17910448  0.89552239
[4,] -0.054726368  0.1293532  0.01492537 -0.07462687

[[4]]
[1] "unsuitable matrix"

[[5]]
           [,1] [,2]
[1,] -0.3333333  0.4
[2,]  0.3333333 -0.2

[[6]]
[1] "not a matrix"

> x <- "hello"
> inversemtrx(x)
Error in inversemtrx(x) : x is not a list
> x <- list()
> inversemtrx(x)
Error in inversemtrx(x) : x doesn't have any member
```
