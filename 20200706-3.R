setwd('D:/Workspace/R/data')

library(rvest)
library(stringr)
library(dplyr)
library(curl)

rm(list = ls())
title = c()
grade = c()
body = c()


url_base = 'https://movie.naver.com/movie/point/af/list.nhn?&page='

craw_url = paste(url_base, 1, sep='')

title_css = '.color_b'
grade_css = '.list_netizen em'
body_css = '.title'

hdoc = read_html(craw_url, encoding = 'cp949')

title_node = html_nodes(hdoc, title_css) %>% html_text
grade_node = html_nodes(hdoc, grade_css) %>% 
    html_text
body_node = html_nodes(hdoc, body_css) %>% 
    html_text(trim = TRUE) %>%
body_node

title = c(title, title_node)
grade = c(grade, grade_node)
