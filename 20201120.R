setwd("c:/Rdata")
getwd()
#KoNLP설치를 위한 내용임.
install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP) #최종적으로 "KoNLP" 패키지를 불러옵니다

install.packages("wordcloud")
install.packages("wordcloud2")
library(wordcloud)
library(wordcloud2)

#textmining for hong.txt
txt=readLines("hong.txt") #1줄씩 외부에서 읽어오는 명령어
nouns=sapply(txt, extractNoun,USE.NAMES = F)
nouns=unlist(nouns)
nouns=Filter(function(x){nchar(x)>=2},nouns)
write(nouns,"hong2.txt")
rev=read.table("hong2.txt")
rev
word=table(rev) #단어의 개수를파악할 수 있음.
word
tt=head(sort(word,decreasing = T),20)
tt
pp=barplot(tt,las=2,ylim=c(0,30),col=rainbow(20))
text(pp,tt,paste0(tt,"개"),col="red",pos=3,cex=1.0)
#frame()

#wordcloud, wordcloud2
display.brewer.all()
palate=brewer.pal(9,"Set1")
wordcloud(names(word),
          freq = word,
          scale = c(5,0.5),
          rot.per = 0.25,
          min.freq = 2,
          random.order = F,
          random.color = T,
          colors = palate)
wordcloud2(data=word,
           size=0.4,
           shape='star')

#크롤링을 통한 텍스트마이닝 실습.
install.packages("rvest") #read_html(),html_nodes(),html_text(),html_attr()...
library(rvest)

#https://www.bskorea.or.kr/bible/korbibReadpage.php?version=GAE&book=gen&chap=

cnt=c()
url_b="https://www.bskorea.or.kr/bible/korbibReadpage.php?version=GAE&book=gen&chap="
t_css="#tdBible1 span"

for(i in 1:50){
cr_url=paste0(url_b,i)

hdoc=read_html(cr_url,encoding = "UTF-8")
cnt_part=html_nodes(hdoc,t_css)
cnt_part=html_text(cnt_part)

cnt_part=gsub("\\d+","",cnt_part)
#cnt_part=gsub("\\n","",cnt_part)

cnt=c(cnt,cnt_part)
}

library(KoNLP)
txt=sapply(cnt,extractNoun,USE.NAMES = F)
txt=unlist(txt)
txt=Filter(function(x){nchar(x)>=2},txt)
write(txt,"txt2.txt")
rev1=read.table("txt2.txt")
#rev1=gsub("<U+00A0>","",rev1)
word2=table(rev1)
aa=head(sort(word2,decreasing = T),21)
bb=aa[2:21]
names(bb)
kk=barplot(bb,col=rainbow(20),ylim=c(0,270),las=2)
text(kk,bb,paste0(bb,"건"),pos=3,cex=1,col=2)

library(wordcloud)
library(wordcloud2)
palate=brewer.pal(9,"Set1")
wordcloud(names(word2),
          freq=word2,
          rot.per=0.25,
          scale=c(5,0.5),
          min.freq=2,
          random.order=F,
          random.color=T,
          col=palate)
wordcloud2(data=word2,
           size=0.4,
           shape='diamond')
