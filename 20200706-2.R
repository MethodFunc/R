setwd('D:/Workspace/R/data')

library(rvest)
library(stringr)

title = c()
url = c()
press = c()
body = c()
time = c()

url_base = 'https://news.daum.net/breakingnews/?page='
title_css = '#mArticle .tit_thumb .link_txt'
pt_css = '.info_news'
body_css = '.desc_thumb .link_txt'

for(i in 1:1000){
cr_url = paste0(url_base, i, sep='')
hdoc = read_html(cr_url)

title_node = html_nodes(hdoc, title_css)
pt_node = html_nodes(hdoc, pt_css)
body_node = html_nodes(hdoc, body_css)

url_part = html_attr(title_node, 'href')
title_part = html_text(title_node)

pt_part = html_text(pt_node)
time_part = str_sub(pt_part, -5)
press_part = str_sub(pt_part, end=-9)

body_part = html_text(body_node)
body_part = str_trim(body_part, side='both')

title = c(title, title_part)
press = c(press, press_part)
time = c(time, time_part)
body = c(body, body_part)
url = c(url, url_part)

}

news = data.frame(title,press, time, body, url)
write.csv(news, 'news0706.csv')
View(news)
