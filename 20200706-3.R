setwd('D:/Workspace/R/data')

library(rvest)
library(stringr)
library(dplyr)
library(curl)

rm(list = ls())
title = c()
grade = c()
date = c()
body = c()



for(i in 1:100){
url_base = 'https://movie.naver.com/movie/point/af/list.nhn?&page='

craw_url = paste(url_base, i, sep='')

title_css = '.color_b'
grade_css = '.list_netizen em'
date_css = '.title + .num '
hdoc = read_html(craw_url, encoding = 'cp949')

title_node = html_nodes(hdoc, title_css) %>% 
    html_text
grade_node = html_nodes(hdoc, grade_css) %>% 
    html_text

date_node = html_nodes(hdoc, date_css) %>% 
    html_text %>%
    str_sub(-8)

title = c(title, title_node)
grade = c(grade, grade_node)
date = c(date, date_node)
}

df = data.frame(title =title, grade = grade, date = date)

View(df)

write.csv(df, 'movie.csv')

data = read.csv('movie.csv')
data

top10 = data %>%
    group_by(title)%>%
    summarise(total=sum(grade), count=n())%>%
    arrange(desc(total), desc(count)) %>%
    head(10)

ggplot(top10, aes(title, total)) + geom_col(fill='red')
