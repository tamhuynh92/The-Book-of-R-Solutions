a. In the interests of efficient coding, rewrite the nested loop example from this section, where the matrix foo was filled with the multiples of the elements of loopvec1 and loopvec2, using only a single for loop.

b. In Section 10.1.5, you used the command
```R
switch(EXPR=mystring,Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
```
to return a number based on the supplied value of a single character string. This line won’t work if mystring is a character vector. Write some code that will take a character vector and return a vector of the appropriate numeric values. Test it on the following vector:
```R
c("Peter","Homer","Lois","Stewie","Maggie","Bart")
```

c. Suppose you have a list named mylist that can contain other lists as members, but assume those “member lists” cannot themselves contain lists. Write nested loops that can search any possible mylist defined in this way and count how many matrices are present. Hint: Simply set up a counter before commencing the loops that is incremented each time a matrix is found, regardless of whether it is a straightforward member of mylist or it is a member of a member list of mylist.
Then confirm the following:

i. That the answer is 4 if you have the following:
```R
mylist <- list(aa=c(3.4,1),bb=matrix(1:4,2,2), cc=matrix(c(T,T,F,T,F,F),3,2),dd="string here", ee=list(c("hello","you"),matrix(c("hello", "there"))), ff=matrix(c("red","green","blue","yellow")))
```

ii. That the answer is 0 if you have the following:
```R
mylist <- list("tricked you",as.vector(matrix(1:6,3,2)))
```
iii. That the answer is 2 if you have the following:
```R
mylist <- list(list(1,2,3),list(c(3,2),2), list(c(1,2),matrix(c(1,2))), rbind(1:10,100:91))
```


***SOLUTION***

***b***
```R
> mystring <- c("Peter","Homer","Lois","Stewie","Maggie","Bart")
> foo <- rep(NA, times = length(mystring))
> foo
[1] NA NA NA NA NA NA
> for(name in mystring){
      foo[which(mystring == name)] <- switch(EXPR=name,Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
 }
> foo
[1] NA 12 NA NA 90 56
```

***c***
```R
> count <- 0
> for(i in 1:length(mylist))
{
  if(is.list(mylist[[i]]) == FALSE)
  {
    if(is.matrix(mylist[[i]]) == TRUE)
    {
      count <- count +1
    }
  } else 
  {
    newList <- mylist[[i]]
    for(i in 1:length(newList))
    {
      if(is.matrix(newList[[i]]) == TRUE)
      {
        count <- count +1
      }
    }
  }   
}
````
