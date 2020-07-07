english = c(90, 80, 60, 70)
math = c(50, 60, 100, 20)

df_midterm = data.frame(english, math)
df_midterm
class = c(1, 1, 2 ,2)

df_midterm = data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm = data.frame(english = c(90, 80, 60, 70),
                        math = c(50, 60, 100, 20),
                        class = c(1, 1, 2, 2))

df_midterm
sd(df_midterm$english)
sqrt(var(df_midterm$english))
var(df_midterm$english)

# 데이터 프레임 만들기
sales <- data.frame(fruit = c("사과", "딸기", "수박"),
                    price = c(1800, 1500, 3000),
                    volume = c(24, 38, 13))

sales

mean(sales$price)
mean(sales$volume)

library(readxl)

setwd('D:/Workspace/R/data')
write.csv(df_midterm, 'df_midrem.csv')

ex = read.csv('df_midrem.csv')

ex
library(ggplot2)
plot.new()

hist(mpg$hwy, probability = T)
lines(density(mpg$hwy), col=2, type='h', lwd=1)
shapiro.test(mpg$hwy)

exam = read.csv('csv_exam.csv')
exam

exam filter