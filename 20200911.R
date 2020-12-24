setwd("c:/Rdata")
getwd()
a<-1
a
a=1
a
c=3
c
d=2.5
d
x='string'
x
a
b
a+b
a*b
a/b
a-b
a^b

var1=c(2,3,5,7,8)
var1
var1[1]
var1[2]
var1[4]
var1

var3=seq(1,5)
var3
var4=seq(1,10,by=2)
var4
var5=seq(1,10,3)
var5

str1='a'
str1
str2='text'
str2
str3='Hello World!!!'
str3
str5=c("Hello","world","is","good!")
str5
str5+2

x=c(1,2,3)
x
mean(x)
var(x)
sd(x)
max(x)
min(x)
median(x)
sum(x)


str5
paste(str5,collapse = " ")


install.packages("ggplot2")
library(ggplot2)
data(package="ggplot2")

x=c('a','a','b','c')
x
qplot(x)

qplot(data = mpg, x = hwy)
qplot(data = mpg, x = drv, 
      y = hwy, geom = "line")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)
?qplot()
qplot(mpg, wt, data = mtcars)
qplot(mpg, wt, data = mtcars, colour = cyl)

