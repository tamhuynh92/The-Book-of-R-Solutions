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
