setwd("c:/Rdata")
getwd()
###R Crawling #####
install.packages("rvest")
install.packages("stringr")
library(rvest)
library(stringr)

title=c()
press=c()
time=c()
body=c()
url=c()

url_base="https://news.daum.net/breakingnews/?page="

for(i in 1:100){
  url_crawl=paste(url_base,i,sep="")

t_css="#mArticle .tit_thumb .link_txt"
pt_css=".info_news"
b_css=".desc_thumb .link_txt"

hdoc=read_html(url_base)

t_node=html_nodes(hdoc,t_css)
pt_node=html_nodes(hdoc,pt_css)
b_node=html_nodes(hdoc,b_css)

title_part=html_text(t_node)
title_part=gsub("\n","",title_part)
pt_part=html_text(pt_node)
time_part=str_sub(pt_part,-5)
press_part=str_sub(pt_part,end=-9)
b_part=html_text(b_node)
b_part=gsub("\n","",b_part)
body_part=str_trim(b_part,side="both")

url_part=html_attr(t_node,"href")

title=c(title,title_part)
press=c(press,press_part)
time=c(time,time_part)
body=c(body,body_part)
url=c(url,url_part)
}


news=data.frame(title,press,time,body,url)
View(news)
write.csv(news,"news.csv")

