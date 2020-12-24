setwd("c:/Rdata")
getwd()
rm(list=ls())
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))

xa=c(1,2,NULL,3)
xa
xb=c(1,2,NA,3)
xb
sum(xb)
mean(xb)
df
is.na(df)

table(is.na(df$score))


library(dplyr)
df %>% 
  filter(!is.na(df$score))

mean(df$score,na.rm=T)
na.omit(df)
exam <- read.csv("csv_exam.csv") 
exam
exam[c(3, 8, 15), "math"] <- NA 
exam
exam %>% 
  summarise(mean_math=mean(math,na.rm=T),
            sum_math=sum(math,na.rm=T),
            median_math=median(math,na.rm=T))
mean(exam$math,na.rm=T)
exam$math=ifelse(is.na(exam$math),55,exam$math)
exam

outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
hist(mpg$hwy)
boxplot(mpg$hwy)$stats 
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))
