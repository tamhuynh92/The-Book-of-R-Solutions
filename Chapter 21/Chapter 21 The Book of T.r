
demo.data <- data.frame(y=c(1.55,0.42,1.29,0.73,0.76,-1.09,1.41,-0.32),
                        x1=c(1.13,-0.73,0.12,0.52,-0.54,-1.15,0.20,-1.09),
                        x2=c(1,0,1,1,0,1,0,1))
demo.data

Y <- matrix(demo.data$y)
Y
n <- nrow(demo.data)


X <- matrix(c(rep(1,n),demo.data$x1,demo.data$x2),nrow=n,ncol=3)
X

demo.fit <- lm(y~x1+x2,data=demo.data)
demo.fit

library(MASS)
survmult <- lm(Height~Wr.Hnd+Sex,data=survey)
survmult

 summary(survmult)

survmult2 <- lm(Height~Wr.Hnd+Sex+Smoke,data=survey)
 summary(survmult2)

survcoefs <- coef(survmult)
survcoefs

#First, a scatterplot of the height and handspan observations, split by sex, is drawn. 
plot(survey$Height~survey$Wr.Hnd, col=c("red","blue")[as.numeric(survey$Sex)], pch=16,xlab="Writing handspan",ylab="Height")

#Then, abline adds the line corresponding to females and adds a second one corresponding to males, based on those two equations.
abline(a=survcoefs[1],b=survcoefs[2],col="red",lwd=2, lty = 2)
abline(a=survcoefs[1]+survcoefs[3],b=survcoefs[2],col="blue",lwd=2, lty = 3)

legend("topleft",legend=levels(survey$Sex),col=c("red","blue"),pch=16)

confint(survmult2)

R2 <- summary(survmult2)$r.squared
n <- nrow(survey)-30
p <- length(coef(survmult2))-1
Fstat <- (R2*(n-p-1))/((1-R2)*p)
1-pf(Fstat,df1=p,df2=n-p-1)

predict(survmult,newdata=data.frame(Wr.Hnd=16.5,Sex="Male"), interval="confidence",level=0.95)

predict(survmult,newdata=data.frame(Wr.Hnd=13,Sex="Female"), interval="prediction",level=0.99)

survey[survey$Sex=="Female" & survey$Wr.Hnd==13,c("Sex","Wr.Hnd","Height")] 

x <- seq(-4,4,length=50)
y <- x
y2 <- x + x^2
y3 <- x + x^2 + x^3

par(mfrow=c(2,2))
plot(x,y,type="l")
plot(x,y2,type="l")
plot(x,y3,type="l")

plot(mtcars$disp,mtcars$mpg,xlab="Displacement (cu. in.)",ylab="MPG")

car.order1 <- lm(mpg~disp,data=mtcars)
summary(car.order1)

car.order2 <- lm(mpg~disp+I(disp^2),data=mtcars)
summary(car.order2)

car.order3 <- lm(mpg~disp+I(disp^2)+I(disp^3),data=mtcars)
summary(car.order3)

plot(mtcars$disp,mtcars$mpg,xlab="Displacement (cu. in.)",ylab="MPG", )
abline(car.order1)

disp.seq <- seq(min(mtcars$disp)-50,max(mtcars$disp)+50,length=30)
car.order2.pred <- predict(car.order2,newdata=data.frame(disp=disp.seq))
lines(disp.seq,car.order2.pred,lty=2, col = "red")

car.order3.pred <- predict(car.order3,newdata=data.frame(disp=disp.seq))
lines(disp.seq,car.order3.pred,lty=3, col = "blue")
legend("topright",lty=1:3, legend=c("order 1 (linear)","order 2 (quadratic)","order 3 (cubic)"), col = c("black", "red", "blue"))

plot(1:1000,log(1:1000),type="l",xlab="x",ylab="",ylim=c(-8,8), col = "red")
lines(1:1000,-log(1:1000),lty=2, col = "blue")
legend("topleft",legend=c("log(x)","-log(x)"),lty=c(1,2))

plot(mtcars$hp,mtcars$mpg,pch=19,col=c("blue","red")[factor(mtcars$am)], xlab="Horsepower",ylab="MPG")
legend("topright",legend=c("auto","man"),col=c("blue","red"),pch=19)

car.log <- lm(mpg~log(hp)+am,data=mtcars)
summary(car.log)

hp.seq <- seq(min(mtcars$hp)-20,max(mtcars$hp)+20,length=30)
n <- length(hp.seq)
car.log.pred <- predict(car.log,newdata=data.frame(hp=rep(hp.seq,2), am=rep(c(0,1),each=n)))

plot(mtcars$hp,mtcars$mpg,pch=19,col=c("blue","red")[factor(mtcars$am)], xlab="Horsepower",ylab="MPG")
legend("topright",legend=c("auto","man"),col=c("blue","red"),pch=19)

lines(hp.seq,car.log.pred[1:n], col = "blue")
lines(hp.seq,car.log.pred[(n+1):(2*n)],col="red")

library(faraway)
dia.fit <- lm(chol~age+frame+age:frame,data=diabetes)
summary(dia.fit)

dia.coef <- coef(dia.fit)
dia.coef

dia.small <- c(dia.coef[1],dia.coef[2])
dia.medium <- c(dia.coef[1]+dia.coef[3],dia.coef[2]+dia.coef[5])
dia.large <- c(dia.coef[1]+dia.coef[4],dia.coef[2]+dia.coef[6])

cols <- c("darkgreen","blue","red")
plot(diabetes$chol~diabetes$age,col=cols[diabetes$frame], cex= 1.0 ,xlab="age",ylab="cholesterol", pch = 18)

abline(coef=dia.small,  lwd=2, col = "darkgreen")
abline(coef=dia.medium, lwd=2, col="blue")
abline(coef=dia.large,  lwd=2, col="red")

legend("topright",legend=c("small frame","medium frame","large frame"), lty=1,lwd=2,col=cols)

warp.fit <- lm(breaks~wool*tension,data=warpbreaks)
summary(warp.fit)

nd <- data.frame(wool=c("A","A","B","B"),tension=c("L","H","L","M"))
predict(warp.fit,newdata=nd,interval="confidence",level=0.9)

car.fit <- lm(mpg~hp*wt,data=mtcars)
summary(car.fit)

library(boot)
nuc.fit <- lm(cost~cap+cum.n*ne*ct,data=nuclear)
summary(nuc.fit)
