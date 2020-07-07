library(readxl)
library(dplyr)
library(ggplot2)
setwd('D:/Workspace/R/data')

mpg = as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), 'hwy'] = NA

a = mpg %>% 
    group_by(drv) %>%
    summarise(mean_hwy = round(mean(hwy, na.rm = T), 1))

ggplot(data = a, aes(x=drv, y= mean_hwy)) + geom_col()
ggplot(data = mpg, aes(x=drv)) + geom_bar()
# 1 - Q1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 1 - Q2
mpg %>% filter(!is.na(mpg$hwy)) %>%
    group_by(drv) %>%
    summarise(mean_hwy = mean(hwy))

mpg = as.data.frame(ggplot2::mpg)
# 2 - Q1
table(mpg$drv)
mpg$drv = ifelse(mpg$drv %in% c('4', 'f', 'r'), mpg$drv, NA)

table(mpg$drv)

# 2 - Q2
boxplot(mpg$cty)$stats

mpg$cty = ifelse(mpg$cty <9 | mpg$cty >26, NA, mpg$cty)

boxplot(mpg$cty)

# 2 - Q3
a = mpg %>% filter(!is.na(drv) & !is.na(cty)) %>%
    group_by(drv) %>%
    summarise(mean_hwy = mean(cty))

ggplot(a, aes(x=drv, y=mean_hwy)) + geom_col()

a$mean_hwy = as.integer(a$mean_hwy)

a

tt = barplot(aes(x= a$drv, y=a$mean_hwy), names.arg = a$drv, col=rainbow(3), ylim=c(0, 25))
text(tt, a$mean_hwy, label=paste0(a$mean_hwy, '°Ç'), col=2, pos=3)
