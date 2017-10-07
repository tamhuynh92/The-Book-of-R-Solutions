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
