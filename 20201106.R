setwd("c:/Rdata")
getwd()

#KoNLP설치를 위한 구성내용들.
install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP) #최종적으로 "KoNLP" 패키지를 불러옵니다.

install.packages("wordcloud")
install.packages("wordcloud2")
library(wordcloud)
library(wordcloud2)

#textmining for park
txt=readLines("park.txt")
nouns=sapply(txt,extractNoun,USE.NAMES = F)
nouns=unlist(nouns)
class(nouns)
nouns=Filter(function(x){nchar(x)>=2},nouns)
write(nouns,"park2.txt")
rev=read.table("park2.txt")
rev
wordcount=table(rev)
tt=head(sort(wordcount,decreasing = T),20)
kk=barplot(tt,col=rainbow(20),ylim=c(0,45),las=2)
text(kk,tt,paste0(tt,"개"),col=2,pos=3,cex=1.5)

library(RColorBrewer)
display.brewer.all()
palate=brewer.pal(9,"Set1")
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(5,0.5),
          rot.per = 0.25,
          min.freq = 2,
          random.order = F,
          random.color = T,
          colors = palate)
wordcloud2(data=wordcount,
           size=0.4,
           shape='diamond')

#Crawling for Bible
install.packages("rvest") #read_html(), html_nodes(), html_text()...
install.packages("stringr")
library(rvest)
library(stringr)

cnt=c()
url_b="https://www.bskorea.or.kr/bible/korbibReadpage.php?version=GAE&book=gen&chap="
t_css="#tdBible1 span"

for(i in 1:50){
cr_url=paste0(url_b,i)

hdoc=read_html(cr_url,encoding="UTF-8")
n_css=html_nodes(hdoc,t_css)
cnt_part=html_text(n_css)
cnt_part=gsub("\\d","",cnt_part)

cnt=c(cnt,cnt_part)
}

library(KoNLP)
txt=sapply(cnt,extractNoun,USE.NAMES = F)
txt=unlist(txt)
count=Filter(function(x){nchar(x)>=2},txt)
write(count,"count.txt")
rex=read.table("count.txt")

#count=gsub(pattern = "\\s",   
#           replacement = "k",
#           x = count)

#write(count,"count2.txt")
word=table(rex)
#word=gsub(" ","",word)
word
kk=head(sort(word,decreasing=T),20)

kk
tt=barplot(kk,col=rainbow(20),ylim=c(0,260),las=2)
text(tt,kk,labels = paste0(kk,"개"),col=2,pos=3)

library(RColorBrewer)
library(wordcloud)
palate=brewer.pal(9,"Set1")
wordcloud(names(word),
          freq=word,
          scale=c(5,0.5),
          rot.per=0.25,
          min.freq = 2,
          random.order = F,
          random.color = T,
          colors = palate)
          )
library(wordcloud2)
wordcloud2(data=word,
           size=0.4,
           shape='diamond')
