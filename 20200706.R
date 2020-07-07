library(readxl)
library(dplyr)
setwd('D:/Workspace/R/data')

df = data.frame(sex = c('M','F',NA,'M','F'),
                score = c(5, 4, 3, 4, NA))


df

is.na(df)

table(is.na(df))

mean(df$score)

df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss = df %>% filter(!is.na(score))

mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss2 = na.omit(df)
df_nomiss2

df %>% na.omit(df$score)

mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

exam = read.csv('csv_exam.csv')

exam[c(3, 8, 15), 'math'] = NA
exam

exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))

kk = table(is.na(exam$math))
tt = barplot(kk, col=rainbow(2), ylim=c(0, 20))
text(tt, kk, label=paste0(kk, '°Ç'),pos=3)

exam$math = ifelse(is.na(exam$math), 55, exam$math)
exam

outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)
table

outlier$sex = ifelse(outlier$sex == 3 , NA, outlier$sex)
outlier

outlier$score = ifelse(outlier$score >5, NA, outlier$score)
outlier

outlier %>% filter(!is.na(sex) & !is.na(score)) %>%
    group_by(sex) %>%
    summarise(mean_score = mean(score))

mpg = as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy, horizontal = T, col=2)
IQR(mpg$hwy)
summary(mpg$hwy)

hist(mpg$hwy, probability = T)
lines(density(mpg$hwy), type='h', col=2)
boxplot(mpg$hwy)$stats
mpg$hwy = ifelse(mpg$hwy < 12 | mpg$hwy>37, NA, mpg$hwy)

kk = table(is.na(mpg$hwy))
tt = barplot(kk, col=rainbow(2), ylim=c(0,255))
text(tt,kk, label=paste0(kk, '°Ç'), col=2, cex=2, pos=3)
table(is.na(mpg$hwy))


mpg %>%
    group_by(drv) %>%
    summarise(mean_hwy = mean(hwy, na.rm = T))

library(plotly)

ggplot(data=mpg, aes(x=displ, y = hwy))
ggplot(data=mpg, aes(x=displ, y = hwy)) + geom_point()
ggplot(data=mpg, aes(x=displ, y = hwy)) + geom_point() + xlim(3, 6)

ggplot(data=mpg, aes(x=displ, y = hwy)) + 
    geom_point() + 
    xlim(3, 6) + 
    ylim(10, 30)

ggplot(mpg, aes(hwy, cty)) + geom_point()

