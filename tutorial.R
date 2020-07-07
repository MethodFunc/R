x = rnorm(100, 175, 2)
x
hist(x)
hist(x, breaks = 5, probability =  T)
lines(density(x), col=2, type='h', lwd=0.5)
shapiro.test(x)

a = 1

var1 = c(1,2,5,7,8)

var2 = c(1:5)

var3 = seq(1, 5)

var4 = seq(1, 10, 2)

var5 = var1 + var2
str = 'a'
str1 = 'abcdef'

print(str)

str5 = c('i', 'am', 'a boy')
str5

x = c(1,4, 7)
mean(x)
max(x)
min(x)
sd(x)

paste(str5, collapse = ' ')

library(ggplot2)

x = c("a", "a", "b", "c")
x

qplot(x)
qplot(data = mpg, x=hwy)
qplot(data =mpg, x = cty)
qplot(data = mpg, x=drv, y= hwy)
qplot(data = mpg, x=drv, y= hwy, geom = 'line')
qplot(data = mpg, x=drv, y= hwy, geom = 'line', color= drv)
qplot(data = mpg, x=drv, y= hwy, geom = 'boxplot')
qplot(data = mpg, x=drv, y= hwy, geom = 'boxplot', color=drv)

?qplot

score = c(80, 60, 70, 50, 90)
mean(score)
a_mean = mean(score)
a_mean