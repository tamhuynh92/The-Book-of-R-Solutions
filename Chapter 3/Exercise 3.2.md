a. Calculate the following:

![first equation](http://latex.codecogs.com/gif.latex?%5Cfrac%7B2%7D%7B7%7D*%5Cleft%20%28%20%5Cbegin%7Bbmatrix%7D%201%20%26%202%5C%5C%202%20%26%204%5C%5C%207%20%26%206%20%5Cend%7Bbmatrix%7D%20-%20%5Cbegin%7Bbmatrix%7D%2010%20%26%2020%20%5C%5C%2030%20%26%2040%5C%5C%2050%20%26%2060%20%5Cend%7Bbmatrix%7D%5Cright%20%29)
    
b. Store these two matrices   

![second equation](http://latex.codecogs.com/gif.latex?A%3D%20%5Cbegin%7Bbmatrix%7D%201%5C%5C%202%5C%5C%207%20%5Cend%7Bbmatrix%7D%20B%3D%20%5Cbegin%7Bbmatrix%7D%203%5C%5C%204%5C%5C%208%20%5Cend%7Bbmatrix%7D) 

Which of the following multiplications are possible? For those that are, compute the result.
![third equation](http://latex.codecogs.com/gif.latex?i.%20A%5Ccdot%20B%20%5Cnewline%20ii.%20A%5ET%20%5Ccdot%20B%20%5Cnewline%20iii.%20B%5ET%5Ccdot%20%28A%5Ccdot%20A%5ET%29%20%5Cnewline%20iv.%20%28A%5Ccdot%20A%5ET%29%20%5Ccdot%20B%5ET%20%5Cnewline%20v.%20%5B%28B%5Ccdot%20B%5ET%29&plus;%28A%5Ccdot%20A%5ET%29-100I_%7B3%7D%5D%5E-1)


c. For 

![fourth equation](http://latex.codecogs.com/gif.latex?A%3D%5Cbegin%7Bbmatrix%7D%202%20%260%20%26%200%260%20%5C%5C%200%20%26%203%20%26%200%26%200%5C%5C%200%20%26%200%20%265%20%26%200%5C%5C%200%20%26%200%260%20%26%20-1%20%5Cend%7Bbmatrix%7D)

confirm that ![fifth equation](http://latex.codecogs.com/gif.latex?A%5E%7B-1%7D%5Ccdot%20A%20-%20I_%7B4%7D) provides a 4 x 4 matrix of zeros



Solution: 

a.
> A <- matrix(c(1,2,2,4,7,6), nrow = 3, ncol = 2, byrow = TRUE)

> B <- matrix(seq(10,60, by=10), nrow = 3, ncol = 2, byrow = TRUE)

> (2/7)*(A - B)

          [,1]        [,2]

[1,]     -2.571429  -5.142857

[2,]     -8.000000 -10.285714

[3,]    -12.285714 -15.428571
