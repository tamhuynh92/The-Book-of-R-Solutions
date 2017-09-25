a. Using R, verify that, 
(6a + 42)/(3^(4.2-3.62)) = 29.50556 when a = 2.3
        
b. Wich of the following squares negative 4 and adds 2 to the results?

    i. (-4)^2 + 2 
    
    ii. -4^2 + 2
    
    iii. (-4)^(2+2)
    
    iv. -4^(2+2)


c. Using R, how would you calculate the square root of half of the average of  the numbers 25.2, 15, 16.44, 15.3 and 18.6?

d. Find log(e)(0.3)

e. Compute the exponential transform of your answer to (d)

f. Identify R's represenation of -.00000000423546322 when printing this number to the console.


**Solution:**

a. 
```
> a <- 2.3
> ((6*a) + 42) / (3^(4.2-3.62))
[1] 29.50556
```
b. 
i. (-4)^2 + 2 

c.  
```
> avg <- mean(25.2, 15, 16.44, 15.3, 18.6)
> sqrt(avg/2)
[1] 3.549648
```
    
d. 
```
> log(0.3, base = exp(1))
[1] -1.203973
```
   
e. 
```
> exp(log(0.3, base = exp(1)))
  [1] 0.3
```

f. 
-4.235463e-09
