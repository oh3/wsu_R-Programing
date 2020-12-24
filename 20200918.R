a=1
b=2
setwd("c:/Rdata")
getwd()

english=c(90,80,60,70)
english
math <- c(50, 60, 100, 20)
math
df_midterm=data.frame(english,math)
class(df_midterm)

class=c(1,1,2,2)
df_midterm=data.frame(english,math,class)
df_midterm$class
mean(df_midterm$english)
mean(df_midterm$math)

pdt=c('사과','딸기','수박')
pdt
price=c(1800,1500,3000)
price
sales=c(24,38,13)
sales
fruit=data.frame(pdt,price,sales)
q2=c('판매량평균'=mean(fruit$sales),
  '가격평균'=mean(fruit$price))
q2

#엑셀파일을 불러오기위한 패키지설치
install.packages("readxl")
require(readxl)
df_exam <- read_excel("excel_exam.xlsx")
class(df_exam)
mean(df_exam$english)
mean(df_exam$science)


data.frame(df_exam)
df_exam_novar <- read_excel("excel_exam_novar.xlsx",col_names = F)
df_exam_novar
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx",sheet=3)
df_exam_sheet
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam
df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)
df_csv_exam
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm
write.csv(df_midterm,file="exam_test.csv")
save(df_midterm, file = "df_midterm.rda")
df_midterm
rm(df_midterm)
load("df_midterm.rda")
