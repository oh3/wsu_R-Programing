rm(list=ls())
setwd("c:/Rdata")
library(ggplot2)
data(package="ggplot2")
ggplot(data=mpg,aes(x=displ,y=hwy)) #1st layer
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()+
  xlim(3,6)+
  ylim(10,30)
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)

mpg=data.frame(ggplot2::mpg)
head(mpg)
table(mpg$drv)

libray(dplyr)
library(dplyr)
df_mfg=mpg %>% 
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty),
            mean_hwy=mean(hwy))
df_mfg
ggplot(data=df_mfg,aes(x=reorder(drv,mean_cty),y=mean_cty))+
  geom_col()
ggplot(data=mpg,aes(x=drv))+geom_bar()
ggplot(data=mpg,aes(x=hwy))+geom_bar()
table(mpg$hwy)
kk=ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

#plotly pkg --인터랙티브패키지.
install.packages("plotly")
library(plotly)
ggplotly(kk)
