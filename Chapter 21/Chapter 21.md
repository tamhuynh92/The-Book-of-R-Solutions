
## 21.2 Theory


```R
demo.data <- data.frame(y=c(1.55,0.42,1.29,0.73,0.76,-1.09,1.41,-0.32),
                        x1=c(1.13,-0.73,0.12,0.52,-0.54,-1.15,0.20,-1.09),
                        x2=c(1,0,1,1,0,1,0,1))
demo.data
```


<table>
<thead><tr><th scope=col>y</th><th scope=col>x1</th><th scope=col>x2</th></tr></thead>
<tbody>
	<tr><td> 1.55</td><td> 1.13</td><td>1    </td></tr>
	<tr><td> 0.42</td><td>-0.73</td><td>0    </td></tr>
	<tr><td> 1.29</td><td> 0.12</td><td>1    </td></tr>
	<tr><td> 0.73</td><td> 0.52</td><td>1    </td></tr>
	<tr><td> 0.76</td><td>-0.54</td><td>0    </td></tr>
	<tr><td>-1.09</td><td>-1.15</td><td>1    </td></tr>
	<tr><td> 1.41</td><td> 0.20</td><td>0    </td></tr>
	<tr><td>-0.32</td><td>-1.09</td><td>1    </td></tr>
</tbody>
</table>



To get your point estimates in $$ Î² = [Î²0, Î²1, Î²2]^{âŠ¤} $$ for the linear model,
you first have to construct X and Y as required by (21.3).


```R
Y <- matrix(demo.data$y)
Y
n <- nrow(demo.data)

```


<table>
<tbody>
	<tr><td> 1.55</td></tr>
	<tr><td> 0.42</td></tr>
	<tr><td> 1.29</td></tr>
	<tr><td> 0.73</td></tr>
	<tr><td> 0.76</td></tr>
	<tr><td>-1.09</td></tr>
	<tr><td> 1.41</td></tr>
	<tr><td>-0.32</td></tr>
</tbody>
</table>




```R
X <- matrix(c(rep(1,n),demo.data$x1,demo.data$x2),nrow=n,ncol=3)
X
```


<table>
<tbody>
	<tr><td>1    </td><td> 1.13</td><td>1    </td></tr>
	<tr><td>1    </td><td>-0.73</td><td>0    </td></tr>
	<tr><td>1    </td><td> 0.12</td><td>1    </td></tr>
	<tr><td>1    </td><td> 0.52</td><td>1    </td></tr>
	<tr><td>1    </td><td>-0.54</td><td>0    </td></tr>
	<tr><td>1    </td><td>-1.15</td><td>1    </td></tr>
	<tr><td>1    </td><td> 0.20</td><td>0    </td></tr>
	<tr><td>1    </td><td>-1.09</td><td>1    </td></tr>
</tbody>
</table>



## 21.3 Implementing in R and Interpreting
                

### 21.3.1 Additional Predictors



```R
demo.fit <- lm(y~x1+x2,data=demo.data)
demo.fit
```


    
    Call:
    lm(formula = y ~ x1 + x2, data = demo.data)
    
    Coefficients:
    (Intercept)           x1           x2  
          1.225        1.015       -0.698  
    



```R
library(MASS)
survmult <- lm(Height~Wr.Hnd+Sex,data=survey)
survmult
```


    
    Call:
    lm(formula = Height ~ Wr.Hnd + Sex, data = survey)
    
    Coefficients:
    (Intercept)       Wr.Hnd      SexMale  
        137.687        1.594        9.490  
    



```R
 summary(survmult)
```


    
    Call:
    lm(formula = Height ~ Wr.Hnd + Sex, data = survey)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -17.7479  -4.1830   0.7749   4.6665  21.9253 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 137.6870     5.7131  24.100  < 2e-16 ***
    Wr.Hnd        1.5944     0.3229   4.937 1.64e-06 ***
    SexMale       9.4898     1.2287   7.724 5.00e-13 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 6.987 on 204 degrees of freedom
      (30 observations deleted due to missingness)
    Multiple R-squared:  0.5062,	Adjusted R-squared:  0.5014 
    F-statistic: 104.6 on 2 and 204 DF,  p-value: < 2.2e-16
    



```R
survmult2 <- lm(Height~Wr.Hnd+Sex+Smoke,data=survey)
 summary(survmult2)
```


    
    Call:
    lm(formula = Height ~ Wr.Hnd + Sex + Smoke, data = survey)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -17.4869  -4.7617   0.7604   4.3691  22.1237 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 137.4056     6.5444  20.996  < 2e-16 ***
    Wr.Hnd        1.6042     0.3301   4.860 2.36e-06 ***
    SexMale       9.3979     1.2452   7.547 1.51e-12 ***
    SmokeNever   -0.0442     2.3135  -0.019    0.985    
    SmokeOccas    1.5267     2.8694   0.532    0.595    
    SmokeRegul    0.9211     2.9290   0.314    0.753    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 7.023 on 201 degrees of freedom
      (30 observations deleted due to missingness)
    Multiple R-squared:  0.5085,	Adjusted R-squared:  0.4962 
    F-statistic: 41.59 on 5 and 201 DF,  p-value: < 2.2e-16
    


### 21.3.2 Interpreting Marginal Effects

### 21.3.3 Visualizing the Multiple Linear Model



```R
survcoefs <- coef(survmult)
survcoefs
```


<dl class=dl-horizontal>
	<dt>(Intercept)</dt>
		<dd>137.686950521241</dd>
	<dt>Wr.Hnd</dt>
		<dd>1.5944456491924</dd>
	<dt>SexMale</dt>
		<dd>9.48981387553692</dd>
</dl>



Hereâ€™s the equation for male students: <br>
â€œMean heightâ€ = (137.687 + 9.4898) + 1.594 Ã— â€œhandspanâ€ = 147.177 + 1.594 Ã— â€œhandspanâ€


```R
#First, a scatterplot of the height and handspan observations, split by sex, is drawn. 
plot(survey$Height~survey$Wr.Hnd, col=c("red","blue")[as.numeric(survey$Sex)], pch=16,xlab="Writing handspan",ylab="Height")

#Then, abline adds the line corresponding to females and adds a second one corresponding to males, based on those two equations.
abline(a=survcoefs[1],b=survcoefs[2],col="red",lwd=2, lty = 2)
abline(a=survcoefs[1]+survcoefs[3],b=survcoefs[2],col="blue",lwd=2, lty = 3)

legend("topleft",legend=levels(survey$Sex),col=c("red","blue"),pch=16)
```


![png](output_14_0.png)


### 21.3.4 Finding Confidence Intervals



```R
confint(survmult2)
```


<table>
<thead><tr><th></th><th scope=col>2.5 %</th><th scope=col>97.5 %</th></tr></thead>
<tbody>
	<tr><th scope=row>(Intercept)</th><td>124.5010442</td><td>150.310074 </td></tr>
	<tr><th scope=row>Wr.Hnd</th><td>  0.9534078</td><td>  2.255053 </td></tr>
	<tr><th scope=row>SexMale</th><td>  6.9426040</td><td> 11.853129 </td></tr>
	<tr><th scope=row>SmokeNever</th><td> -4.6061148</td><td>  4.517705 </td></tr>
	<tr><th scope=row>SmokeOccas</th><td> -4.1312384</td><td>  7.184710 </td></tr>
	<tr><th scope=row>SmokeRegul</th><td> -4.8543683</td><td>  6.696525 </td></tr>
</tbody>
</table>



### 21.3.5 Omnibus F-Test

First encountered in Section 20.5.2 in the context of multilevel predictors,
you can think of the omnibus F-test more generally for multiple regression
models as a test with the following hypotheses: <br>
 H0 : Î²1 = Î²2 = . . . = Î²p = 0 <br> 
 HA : At least one of the Î²j != 0 (for j = 1, . . ., p) (21.5) <br> 


```R
R2 <- summary(survmult2)$r.squared
n <- nrow(survey)-30
p <- length(coef(survmult2))-1
Fstat <- (R2*(n-p-1))/((1-R2)*p)
1-pf(Fstat,df1=p,df2=n-p-1)
```


0


### 21.3.6 Predicting from a Multiple Linear Model


```R
predict(survmult,newdata=data.frame(Wr.Hnd=16.5,Sex="Male"), interval="confidence",level=0.95)
```


<table>
<thead><tr><th></th><th scope=col>fit</th><th scope=col>lwr</th><th scope=col>upr</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>173.4851</td><td>170.9419</td><td>176.0283</td></tr>
</tbody>
</table>




```R
predict(survmult,newdata=data.frame(Wr.Hnd=13,Sex="Female"), interval="prediction",level=0.99)
```


<table>
<thead><tr><th></th><th scope=col>fit</th><th scope=col>lwr</th><th scope=col>upr</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>158.4147</td><td>139.7611</td><td>177.0684</td></tr>
</tbody>
</table>




```R
survey[survey$Sex=="Female" & survey$Wr.Hnd==13,c("Sex","Wr.Hnd","Height")] 
```


<table>
<thead><tr><th></th><th scope=col>Sex</th><th scope=col>Wr.Hnd</th><th scope=col>Height</th></tr></thead>
<tbody>
	<tr><th scope=row>45</th><td>Female</td><td>13    </td><td>180.34</td></tr>
	<tr><th scope=row>152</th><td>Female</td><td>13    </td><td>165.00</td></tr>
</tbody>
</table>



## 21.4 Transforming Numeric Variables
### 21.4.1 Polynomial


```R
x <- seq(-4,4,length=50)
y <- x
y2 <- x + x^2
y3 <- x + x^2 + x^3

par(mfrow=c(2,2))
plot(x,y,type="l")
plot(x,y2,type="l")
plot(x,y3,type="l")
```


![png](output_24_0.png)


#### Fitting a Polynomial Transformation



```R
plot(mtcars$disp,mtcars$mpg,xlab="Displacement (cu. in.)",ylab="MPG")
```


![png](output_26_0.png)



```R
car.order1 <- lm(mpg~disp,data=mtcars)
summary(car.order1)
```


    
    Call:
    lm(formula = mpg ~ disp, data = mtcars)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -4.8922 -2.2022 -0.9631  1.6272  7.2305 
    
    Coefficients:
                 Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 29.599855   1.229720  24.070  < 2e-16 ***
    disp        -0.041215   0.004712  -8.747 9.38e-10 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 3.251 on 30 degrees of freedom
    Multiple R-squared:  0.7183,	Adjusted R-squared:  0.709 
    F-statistic: 76.51 on 1 and 30 DF,  p-value: 9.38e-10
    



```R
car.order2 <- lm(mpg~disp+I(disp^2),data=mtcars)
summary(car.order2)
```


    
    Call:
    lm(formula = mpg ~ disp + I(disp^2), data = mtcars)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -3.9112 -1.5269 -0.3124  1.3489  5.3946 
    
    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  3.583e+01  2.209e+00  16.221 4.39e-16 ***
    disp        -1.053e-01  2.028e-02  -5.192 1.49e-05 ***
    I(disp^2)    1.255e-04  3.891e-05   3.226   0.0031 ** 
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 2.837 on 29 degrees of freedom
    Multiple R-squared:  0.7927,	Adjusted R-squared:  0.7784 
    F-statistic: 55.46 on 2 and 29 DF,  p-value: 1.229e-10
    



```R
car.order3 <- lm(mpg~disp+I(disp^2)+I(disp^3),data=mtcars)
summary(car.order3)
```


    
    Call:
    lm(formula = mpg ~ disp + I(disp^2) + I(disp^3), data = mtcars)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -3.0896 -1.5653 -0.3619  1.4368  4.7617 
    
    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  5.070e+01  3.809e+00  13.310 1.25e-13 ***
    disp        -3.372e-01  5.526e-02  -6.102 1.39e-06 ***
    I(disp^2)    1.109e-03  2.265e-04   4.897 3.68e-05 ***
    I(disp^3)   -1.217e-06  2.776e-07  -4.382  0.00015 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 2.224 on 28 degrees of freedom
    Multiple R-squared:  0.8771,	Adjusted R-squared:  0.8639 
    F-statistic: 66.58 on 3 and 28 DF,  p-value: 7.347e-13
    


#### Plotting the Polynomial Fit


```R
plot(mtcars$disp,mtcars$mpg,xlab="Displacement (cu. in.)",ylab="MPG", )
abline(car.order1)

disp.seq <- seq(min(mtcars$disp)-50,max(mtcars$disp)+50,length=30)
car.order2.pred <- predict(car.order2,newdata=data.frame(disp=disp.seq))
lines(disp.seq,car.order2.pred,lty=2, col = "red")

car.order3.pred <- predict(car.order3,newdata=data.frame(disp=disp.seq))
lines(disp.seq,car.order3.pred,lty=3, col = "blue")
legend("topright",lty=1:3, legend=c("order 1 (linear)","order 2 (quadratic)","order 3 (cubic)"), col = c("black", "red", "blue"))
```


![png](output_31_0.png)


### 21.4.2 Logarithmic


```R
plot(1:1000,log(1:1000),type="l",xlab="x",ylab="",ylim=c(-8,8), col = "red")
lines(1:1000,-log(1:1000),lty=2, col = "blue")
legend("topleft",legend=c("log(x)","-log(x)"),lty=c(1,2))
```


![png](output_33_0.png)



```R
plot(mtcars$hp,mtcars$mpg,pch=19,col=c("blue","red")[factor(mtcars$am)], xlab="Horsepower",ylab="MPG")
legend("topright",legend=c("auto","man"),col=c("blue","red"),pch=19)
```


![png](output_34_0.png)



```R
car.log <- lm(mpg~log(hp)+am,data=mtcars)
summary(car.log)
```


    
    Call:
    lm(formula = mpg ~ log(hp) + am, data = mtcars)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -3.9084 -1.7692 -0.1432  1.4032  6.3865 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  63.4842     5.2697  12.047 8.24e-13 ***
    log(hp)      -9.2383     1.0439  -8.850 9.78e-10 ***
    am            4.2025     0.9942   4.227 0.000215 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 2.592 on 29 degrees of freedom
    Multiple R-squared:  0.827,	Adjusted R-squared:  0.8151 
    F-statistic: 69.31 on 2 and 29 DF,  p-value: 8.949e-12
    



```R
hp.seq <- seq(min(mtcars$hp)-20,max(mtcars$hp)+20,length=30)
n <- length(hp.seq)
car.log.pred <- predict(car.log,newdata=data.frame(hp=rep(hp.seq,2), am=rep(c(0,1),each=n)))

plot(mtcars$hp,mtcars$mpg,pch=19,col=c("blue","red")[factor(mtcars$am)], xlab="Horsepower",ylab="MPG")
legend("topright",legend=c("auto","man"),col=c("blue","red"),pch=19)

lines(hp.seq,car.log.pred[1:n], col = "blue")
lines(hp.seq,car.log.pred[(n+1):(2*n)],col="red")
```


![png](output_36_0.png)


## 21.5 Interactive Terms

### 21.5.2 One Categorical, One Continuous


```R
library(faraway)
dia.fit <- lm(chol~age+frame+age:frame,data=diabetes)
summary(dia.fit)
```


    
    Call:
    lm(formula = chol ~ age + frame + age:frame, data = diabetes)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -131.90  -26.24   -5.33   22.17  226.11 
    
    Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
    (Intercept)     155.9636    12.0697  12.922  < 2e-16 ***
    age               0.9852     0.2687   3.667  0.00028 ***
    framemedium      28.6051    15.5503   1.840  0.06661 .  
    framelarge       44.9474    18.9842   2.368  0.01840 *  
    age:framemedium  -0.3514     0.3370  -1.043  0.29768    
    age:framelarge   -0.8511     0.3779  -2.252  0.02490 *  
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 42.34 on 384 degrees of freedom
      (13 observations deleted due to missingness)
    Multiple R-squared:  0.07891,	Adjusted R-squared:  0.06692 
    F-statistic:  6.58 on 5 and 384 DF,  p-value: 6.849e-06
    


â€œMean total cholesterolâ€ = 155.9636 + 0.9852 Ã— â€œageâ€ + 28.6051 Ã— â€œmedium frameâ€ + 44.9474 Ã— â€œlarge frameâ€ âˆ’ 0.3514 Ã— â€œage : medium frameâ€ âˆ’ 0.8511 Ã— â€œage : large frameâ€


```R
dia.coef <- coef(dia.fit)
dia.coef
```


<dl class=dl-horizontal>
	<dt>(Intercept)</dt>
		<dd>155.963586829452</dd>
	<dt>age</dt>
		<dd>0.985202799761968</dd>
	<dt>framemedium</dt>
		<dd>28.6051035460113</dd>
	<dt>framelarge</dt>
		<dd>44.9474104937818</dd>
	<dt>age:framemedium</dt>
		<dd>-0.351390555895763</dd>
	<dt>age:framelarge</dt>
		<dd>-0.851054852727806</dd>
</dl>




```R
dia.small <- c(dia.coef[1],dia.coef[2])
dia.medium <- c(dia.coef[1]+dia.coef[3],dia.coef[2]+dia.coef[5])
dia.large <- c(dia.coef[1]+dia.coef[4],dia.coef[2]+dia.coef[6])
```


```R
cols <- c("darkgreen","blue","red")
plot(diabetes$chol~diabetes$age,col=cols[diabetes$frame], cex= 1.0 ,xlab="age",ylab="cholesterol", pch = 18)

abline(coef=dia.small,  lwd=2, col = "darkgreen")
abline(coef=dia.medium, lwd=2, col="blue")
abline(coef=dia.large,  lwd=2, col="red")

legend("topright",legend=c("small frame","medium frame","large frame"), lty=1,lwd=2,col=cols)
```


![png](output_43_0.png)


### 21.5.3 Two Categorical


```R
warp.fit <- lm(breaks~wool*tension,data=warpbreaks)
summary(warp.fit)
```


    
    Call:
    lm(formula = breaks ~ wool * tension, data = warpbreaks)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -19.5556  -6.8889  -0.6667   7.1944  25.4444 
    
    Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
    (Intercept)      44.556      3.647  12.218 2.43e-16 ***
    woolB           -16.333      5.157  -3.167 0.002677 ** 
    tensionM        -20.556      5.157  -3.986 0.000228 ***
    tensionH        -20.000      5.157  -3.878 0.000320 ***
    woolB:tensionM   21.111      7.294   2.895 0.005698 ** 
    woolB:tensionH   10.556      7.294   1.447 0.154327    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 10.94 on 48 degrees of freedom
    Multiple R-squared:  0.3778,	Adjusted R-squared:  0.3129 
    F-statistic: 5.828 on 5 and 48 DF,  p-value: 0.0002772
    



```R
nd <- data.frame(wool=c("A","A","B","B"),tension=c("L","H","L","M"))
predict(warp.fit,newdata=nd,interval="confidence",level=0.9)
```


<table>
<thead><tr><th></th><th scope=col>fit</th><th scope=col>lwr</th><th scope=col>upr</th></tr></thead>
<tbody>
	<tr><th scope=row>1</th><td>44.55556</td><td>38.43912</td><td>50.67199</td></tr>
	<tr><th scope=row>2</th><td>24.55556</td><td>18.43912</td><td>30.67199</td></tr>
	<tr><th scope=row>3</th><td>28.22222</td><td>22.10579</td><td>34.33866</td></tr>
	<tr><th scope=row>4</th><td>28.77778</td><td>22.66134</td><td>34.89421</td></tr>
</tbody>
</table>



### 21.5.4 Two Continuous



```R
car.fit <- lm(mpg~hp*wt,data=mtcars)
summary(car.fit)
```


    
    Call:
    lm(formula = mpg ~ hp * wt, data = mtcars)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -3.0632 -1.6491 -0.7362  1.4211  4.5513 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 49.80842    3.60516  13.816 5.01e-14 ***
    hp          -0.12010    0.02470  -4.863 4.04e-05 ***
    wt          -8.21662    1.26971  -6.471 5.20e-07 ***
    hp:wt        0.02785    0.00742   3.753 0.000811 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 2.153 on 28 degrees of freedom
    Multiple R-squared:  0.8848,	Adjusted R-squared:  0.8724 
    F-statistic: 71.66 on 3 and 28 DF,  p-value: 2.981e-13
    


### 21.5.5 Higher-Order Interactions


```R
library(boot)
nuc.fit <- lm(cost~cap+cum.n*ne*ct,data=nuclear)
summary(nuc.fit)
```


    
    Call:
    lm(formula = cost ~ cap + cum.n * ne * ct, data = nuclear)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -162.475  -50.368   -8.833   43.370  213.131 
    
    Coefficients:
                 Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  138.0336    99.9599   1.381 0.180585    
    cap            0.5085     0.1127   4.513 0.000157 ***
    cum.n        -24.2433     6.7874  -3.572 0.001618 ** 
    ne          -260.1036   164.7650  -1.579 0.128076    
    ct          -187.4904    76.6316  -2.447 0.022480 *  
    cum.n:ne      44.0196    12.2880   3.582 0.001577 ** 
    cum.n:ct      35.1687     8.0660   4.360 0.000229 ***
    ne:ct        524.1194   200.9567   2.608 0.015721 *  
    cum.n:ne:ct  -64.4444    18.0213  -3.576 0.001601 ** 
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 107.3 on 23 degrees of freedom
    Multiple R-squared:  0.705,	Adjusted R-squared:  0.6024 
    F-statistic: 6.872 on 8 and 23 DF,  p-value: 0.0001264
    

