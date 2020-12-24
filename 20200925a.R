setwd("c:/Rdata")
getwd()

install.packages("animation")
library(animation)

ani.options(interval=1)

#i=0
while(1){
y=rnorm(80,mean=175,sd=2)
#shapiro.test(y)
hist(y,probability = T)
lines(density(y),col=2,type='h')

ani.pause()
}

exam <- read.csv("csv_exam.csv")
head(exam,1)
tail(exam,3)
str(exam)
length(exam)
dim(exam)
summary(exam)
boxplot(exam$math,horizontal = T,col=2)
IQR(exam$math)
View(exam)
