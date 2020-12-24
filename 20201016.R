setwd("c:/Rdata")
getwd()

install.packages("dplyr")
library(dplyr)

exam=read.csv("csv_exam.csv")
head(exam)
exam
View(exam)


exam %>% filter(class==1)
exam %>% filter(class==2)
exam %>% filter(class !=1)
exam %>% filter(class !=3)

exam %>% filter(math>50)
exam %>% filter(math<50)
exam %>% filter(english>=80)
exam %>% filter(english<=80)
exam %>% filter(class==1 & math>=50)
exam %>% filter(class==2 & english>=80)
exam %>% filter(math>=90 | english>=90)
exam %>% filter(english<90 | science<50)
exam %>% filter(class==1 | class==3 | class==5)
exam %>% filter(class %in% c(1,3,5))
class135=exam %>% filter(class %in% c(1,3,5))
class135
class1=exam %>% filter(class==1)
mean(class1$math)
class2=exam %>% filter(class==2)
mean(class2$math)

10^2
10**2
10%/%3
10%%3

install.packages("ggplot2")
library(ggplot2)
mpg=data.frame(ggplot2::mpg)
mpg
displ4=mpg %>% filter(displ<=4)
displ5=mpg %>% filter(displ>=5)
mean(displ4$hwy)
mean(displ5$hwy)


head(exam)
exam %>% select(math,english,science) %>% 
  head

exam %>% select(-math)
exam %>% filter(class==1) %>% 
  select(class,english,science,math)
#혼자서 해보기 filter/ select함수이용하세요...

##정렬함수:arrange
exam %>% arrange(desc(math))
exam %>% arrange(class,math)

mpg %>% filter(manufacturer=='audi') %>% 
  arrange(desc(hwy)) %>% 
  head(5)

exam %>% 
  mutate(total=math+english+science,
         mean=total/3) %>% 
  head

exam %>% 
  mutate(test=ifelse(science>=60,"pass","fail")) %>% 
  head

exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(desc(total)) %>% 
  head

mpg %>% 
  mutate(total=(cty+hwy),
         mean=(total/2)) %>% 
  arrange(desc(mean)) %>% 
  head(3)

#summarise함수..
exam %>% summarise(mean_math=mean(math))

data.frame(exam %>% group_by(class) %>% 
  summarise(mean_math=mean(math),
            mean_english=mean(english),
            mean_science=mean(science),
            count=n()))

mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty),
            mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(10)
mpg %>%
  group_by(manufacturer) %>% # 회사별로 분리
  filter(class == "suv") %>% # suv 추출
  mutate(tot = (cty+hwy)/2) %>% # 통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>% # 통합 연비 평균 산출
  arrange(desc(mean_tot)) %>% # 내림차순 정렬
  head(5) 

#데이터 합치기
test1=data.frame(id=c(1:5),
                 midterm=c(60,80,70,90,85))
test2=data.frame(id=c(1:5),
                 final=c(70,83,65,95,80))

test1
test2
total=left_join(test1,test2,by="id")
total

name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
exam_new=left_join(exam,name,by="class")
exam_new


#세로로 합치기
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
group_a
group_b
group_all=bind_rows(group_a,group_b)
group_all


##R Crawling...
#selector gadget을 사용하자.