library(readxl)
library(dplyr)

df = read.csv('sale_data.csv')


hist(df$QTY, probability = T)
lines(density(df$QTY), col=2, type='h', lwd=1)
shapiro.test(df$QTY)