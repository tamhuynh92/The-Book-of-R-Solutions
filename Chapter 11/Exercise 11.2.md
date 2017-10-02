***a.***

Accruing annual compound interest is a common financial benefit for investors. Given a principal investment amount P,
an interest rate per annum i (expressed as a percentage), and a frequency of interest paid per year t, the final amount F after y years is given as follows:

![Equation](http://latex.codecogs.com/gif.latex?F%3D%20P%5Cleft%20%281%20&plus;%20%5Cfrac%7Bi%7D%7B100t%7D%20%5Cright%20%29%5E%7Bty%7D)

Write a function that can compute F as per the following
notes:

– Arguments must be present for P, i, t, and y. The argument for t should have a default value of 12.

– Another argument giving a logical value that determines whether to plot the amount F at each integer time should be 
included. For example, if plotit=TRUE (the default) and y is 5 years, the plot should show the amount F at y = 1,2,3,4,5.

– If this function is plotted, the plot should always be a stepplot, so plot should always be called with type="s".

– If plotit=FALSE, the final amount F should be returned as a numeric vector corresponding to the same integer times, as shown earlier.

– An ellipsis should also be included to control other details of plotting, if it takes place.

Now, using your function, do the following:

i. Work out the final amount after a 10-year investment of a principal of $5000, at an interest rate of 4.4 percent per annum compounded monthly.

ii. Re-create the following step-plot, which shows the result of $100 invested at 22.9 percent per annum, compounded monthly, for 20 years:

![Image1](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%2011/Screen%20Shot%202017-10-01%20at%209.55.02%20PM.png?raw=true)

iii. Perform another calculation based on the same parameters as in (ii), but this time, assume the interest is compounded
annually. Return and store the results as a numeric vector. Then, use lines to add a second step-line, corresponding to this annually accrued amount, to the plot created previously. Use a different color or line type and make use of the legend function so the two lines can be differentiated.

***b***

A quadratic equation in the variable x is often expressed in the following form:
![Image1](http://latex.codecogs.com/gif.latex?k_%7B1%7Dx%5E2%20&plus;%20k_%7B2%7Dx%20&plus;%20k_%7B3%7D%20%3D%200)
Here, k1, k2, and k3 are constants. Given values for these constants, you can attempt to find up to two real roots—values of x that satisfy the equation. Write a function that takes k1, k2, and k3 as arguments and finds and returns any solutions (as a numeric vector) in such a situation. This is achieved as follows:

– Evaluate ![Image2](http://latex.codecogs.com/gif.latex?k_%7B2%7D%5E2%20-%204k_%7B1%7Dk_%7B3%7D). If this is negative, there are no solutions, and an appropriate message should be printed to the console.

– If ![Image2](http://latex.codecogs.com/gif.latex?k_%7B2%7D%5E2%20-%204k_%7B1%7Dk_%7B3%7D)is zero, then there is one solution, computed by −k2/2k1.

– If ![Image2](http://latex.codecogs.com/gif.latex?k_%7B2%7D%5E2%20-%204k_%7B1%7Dk_%7B3%7D) is positive, then there are two solutions, given by ![Image3](http://latex.codecogs.com/gif.latex?%28-k_%7B2%7D-%28k_%7B2%7D%5E2%20-%204k_%7B1%7Dk_%7B3%7D%29%5E%7B0.5%7D%29/%7B2k_%7B1%7D%20%7D) and ![Image4](http://latex.codecogs.com/gif.latex?%28-k_%7B2%7D&plus;%28k_%7B2%7D%5E2%20-%204k_%7B1%7Dk_%7B3%7D%29%5E%7B0.5%7D%29/%7B2k_%7B1%7D%20%7D)

– No default values are needed for the three arguments, but the function should check to see whether any are missing. If so, an appropriate character string message should be returned to the user, informing the user that the calculations are not possible. Now, test your function.

i. Confirm the following:
* 2x^2 − x − 5 has roots 1.850781 and −1.350781.
* x^2 + x + 1 has no real roots.

ii. Attempt to find solutions to the following quadratic equations:
* 1.3x^2 − 8x − 3.13
* 2.25x^2 − 3x + 1
* 1.4x^2 − 2.2x − 5.1
* −5x^2 + 10.11x − 9.9

iii. Test your programmed response in the function if one of the arguments is missing.

#### SOLUTION

##### a

```R
final.amount <- function(P, i, t=12, y, plotit = TRUE, type = "s",...) 
{
    amountseq <- c(P)
    counter <- 1
    repeat{
        amountseq <- c(amountseq, P * (1 + i/(100*t))^(t*counter))
        counter <- counter + 1
        if(counter > y) {
            break
        }
    }
    
    if(plotit == FALSE) 
    {
        return(amountseq)
    } else {
        plot(1:length(amountseq), amountseq, type = "s", ...)
    }
}
```
###### i
```R
> final.amount(P = 5000, i = 4.4, y = 10, plotit=FALSE)
 [1] 5000.000 5224.491 5459.062 5704.164 5960.271 6227.877 6507.498 6799.674
 [9] 7104.967 7423.968 7757.291
```
###### ii
```R
> final.amount(P = 100, i = 22.9, y = 20, plotit=TRUE, main = "Compound Interest Calculator", xlab = "Year(y)", ylab = "Balance(F)")
```
![Image2](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%2011/Compound%20Interest%20Calculator.png?raw=true)
```R
# Compounded Monthly
> monthly <- final.amount(P = 100, i = 22.9, y = 20, t=12, plotit=FALSE)
> monthly
 [1]  100.0000  125.4632  157.4102  197.4918  247.7796  310.8722  390.0303
 [8]  489.3445  613.9473  770.2780  966.4155 1212.4959 1521.2362 1908.5917
[15] 2394.5804 3004.3174 3769.3130 4729.1010 5933.2818 7444.0856 9339.5886

#Compunded Yearly
> yearly <- final.amount(P = 100, i = 22.9, y = 20, t=1, plotit=FALSE)
> yearly
 [1]  100.0000  122.9000  151.0441  185.6332  228.1432  280.3880  344.5968
 [8]  423.5095  520.4932  639.6861  786.1743  966.2082 1187.4699 1459.4005
[15] 1793.6032 2204.3383 2709.1318 3329.5229 4091.9837 5029.0479 6180.6999

#Montly: red, #Yearly: blue
> plot(1:length(monthly), monthly, type = "s", main = "Compound Interest Calculator", xlab = "Year(y)", ylab = "Balance(F)", col = "red", xlim = c(0,21), ylim = c(0,10000))
> par(new=T)
> plot(1:length(yearly), yearly, type = "s", main = "Compound Interest Calculator", xlab = "Year(y)", ylab = "Balance(F)", col = "blue", xlim = c(0,21), ylim = c(0,10000))
> legend("top", legend= c("Monthly", "Yearly"), col = c("red","blue"), pch = c(NA,NA), lwd = c(1,1))
```
![Image3](https://github.com/tamhuynh92/The-Book-of-R-Solutions/blob/master/Chapter%2011/Monthly%20vs.%20Yearly.png?raw=true)
