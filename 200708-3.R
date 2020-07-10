setwd('D:/Workspace/R/data')

attitude

cov(attitude)

cor(attitude)

with(attitude, cor.test(rating, complaints))

cor.test(attitude$rating, attitude$complaints)

plot(attitude$rating, attitude$complaints)

data=read.csv("cars.csv")

head(data)

out = lm(dist~speed, data=data)

summary(out)

plot(dist~speed,data=cars,col="blue")
abline(out,col="red")

out1 = lm(dist~speed+0, data=data)

summary(lm(dist~speed+0, data=data))

plot(out1)

par(mfrow=c(2, 2))
plot(out1)

shapiro.test(data$dist)

shapiro.test(log(data$dist))

shapiro.test(sqrt(data$dist))

out3 = lm(sqrt(dist)~speed+0,data=data)

summary(out3)

plot(out3)

out3$fitted.values
cbind(data$speed, out3$fitted.values)
new = data.frame(speed = data$speed)
cbind(new$speed, predict(out3, new))
predict(out3, new, interval = 'prediction')

data = read.csv('salary.csv')
head(data)
out = lm(salary ~ experience + score, data)
summary(out)

summary(lm(rating~complaints+learning, data=attitude)) 

backward =lm(rating~.-critical,data=attitude) 
anova(backward)

install.packages('leaps')
library(leaps)

leaps = regsubsets(rating~. , data=attitude, nbest=5)
summary(leaps)

plot(leaps)
plot(leaps, scale='adjr2')
plot(leaps, scale='Cp')

summary.out = summary(leaps)
which.max(summary.out$adjr2)
summary.out$which[11, ]

out3 = lm(rating~complaints+learning+advance, data=attitude)
summary(out3)
