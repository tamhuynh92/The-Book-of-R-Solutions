a. Write another Fibonacci sequence function, naming it myfib4. This function should provide an option to perform either the operations available in myfib2, where the sequence is simply printed to the console, or the operations in myfib3, where a vector of the sequence is formally returned. Your function should take two arguments: the first, thresh, should define the limit of the sequence (just as in myfib2 or myfib3); the second, printme, should be a logical value. If TRUE, then myfib4 should just print;
if FALSE, then myfib4 should return a vector. Confirm the correct results arise from the following calls:

– myfib4(thresh=150,printme=TRUE)
– myfib4(1000000,T)
– myfib4(150,FALSE)
– myfib4(1000000,printme=F)

b. In Exercise 10.4 on page 203, you were tasked with writing a while loop to perform integer factorial calculations.

i. Using your factorial while loop (or writing one if you didn’t do so earlier), write your own R function, myfac, to compute the factorial of an integer argument int (you may assume int will always be supplied as a non-negative integer). Perform a quick test of the function by computing 5 factorial, which is 120; 12 factorial, which is 479,001,600; and 0 factorial, which is 1. 

ii. Write another version of your factorial function, naming it myfac2. This time, you may still assume int will be supplied as an integer but not that it will be non-negative. If negative, the function should return NaN. Test myfac2 on the same three values as previously, but also try using int=-6.

#### ***SOLUTION***

***a***
```R
myfib4 <- function(thresh,printme)
{
    if(printme == 'TRUE' || printme == 'T'){
        fib.a <- 1
        fib.b <- 1
        cat(fib.a,", ",fib.b,", ",sep="")
        repeat{
            temp <- fib.a+fib.b
            fib.a <- fib.b
            fib.b <- temp
            cat(fib.b,", ",sep="")
            if(fib.b>thresh){
                cat("BREAK NOW...")
                break
            }
        }
    }else {
            fibseq <- c(1,1)
            counter <- 2
            repeat{
                fibseq <- c(fibseq,fibseq[counter-1]+fibseq[counter])
                counter <- counter+1
                if(fibseq[counter]>thresh){
                    break
                }
            }
            return(fibseq)
        }
}

> myfib4(thresh=150, printme = TRUE)
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, BREAK NOW...

> myfib4(1000000, T)
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, BREAK NOW...

> myfib4(150, FALSE)
 [1]   1   1   2   3   5   8  13  21  34  55  89 144 233
 
> myfib4(1000000, printme = F)
 [1]       1       1       2       3       5       8      13      21      34
[10]      55      89     144     233     377     610     987    1597    2584
[19]    4181    6765   10946   17711   28657   46368   75025  121393  196418
[28]  317811  514229  832040 1346269
```
***b***
```R
> factorial <- function(number){
    product <- 1
    if(number == 0 ){ 
        product = 1
    } else if (number >0){
        while(number >1) {
            product <- product * number
            number <- number - 1
        }
    }
    return(product)
}

> factorial(5)
[1] 120
> factorial(0)
[1] 1
> factorial(129)
[1] 4.974504e+217
> factorial(120)
[1] 6.689503e+198
> factorial(12)
[1] 479001600
```
```R
myfac2 <- function(number){
    product <- 1
    if(number == 0 ){ 
        product = 1
    } else if (number >0){
        while(number >1) {
            product <- product * number
            number <- number - 1
        }
    } else {
        product <- NaN
    }
    return(product)
}
> myfac2(0)
[1] 1
> myfac2(5)
[1] 120
> myfac2(12)
[1] 479001600
> myfac2(-6)
[1] NaN
```
