library(readxl)
library(dplyr)
library(ggplot2)
library(plotly)
options(scipen = 99)
setwd('D:/Workspace/R/data')

# 1 - Q1
mpg = as.data.frame(ggplot2::mpg)
ggplot(mpg, aes(cty, hwy)) + geom_point()

# 1 - Q2
midwest = as.data.frame(ggplot2::midwest)
a = ggplot(midwest, aes(poptotal, popasian)) + 
    geom_point()+
    xlim(0, 500000) + 
    ylim(0, 10000)

ggplotly(a)

# 2 - Q1
suv = mpg %>% filter(class=='suv') %>%
    group_by(manufacturer) %>%
    summarise(mean_cty = mean(cty)) %>%
    arrange(desc(mean_cty))
ggplot(suv , aes(reorder(manufacturer, -mean_cty), mean_cty)) + geom_col(fill = rainbow(10))

# 2 - Q2
ggplot(mpg, aes(class)) + geom_bar(fill=rainbow(7))

# 3 - Q1
ecom = as.data.frame(ggplot2::economics)
a = ggplot(economics, aes(date, psavert)) + geom_line()
ggplotly(a) 

# 4 - Q1
class_mpg = mpg %>%
    filter(class %in% c("compact", "subcompact", "suv"))

ggplot(data = class_mpg, aes(class, cty)) + geom_boxplot(fill= rainbow(3))
