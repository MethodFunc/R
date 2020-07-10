setwd('D:/Workspace/R/data')

#install.packages('xts')
library(dplyr)
library(xts)
library(ggplot2)
df = read.csv('sale_data.csv')

summary(df)
head(df)

product1 = df %>% filter(df$CATEGORY == '과즙음료') %>% df[-c(2, 3)]
product2 = df %>% filter(df$CATEGORY == '비타민음료')  %>% df[-c(2, 3)]
product3 = df %>% filter(df$CATEGORY == '차음료')  %>% df[-c(2, 3)]

product1 = product1[-c(2, 3)]
product2 = product2[-c(2, 3)]
product3 = product3[-c(2, 3)]


shapiro.test(product1$QTY)
shapiro.test(product2$QTY)
shapiro.test(product3$QTY)

hist(product1$QTY)
hist(product2$QTY)
hist(product3$QTY)

cor(product1)
cor(product2)
cor(product3)
