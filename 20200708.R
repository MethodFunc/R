setwd('d:/workspace/R/data')

library(rvest)
library(stringr)
library(dplyr)
library(curl)
library(ggplot2)

df = data(package='ggplot2')

df$results


mpg = as.data.frame(ggplot2::mpg)
head(mpg)
table(mpg$drv)

df_g = mpg %>%
    group_by(drv) %>%
    summarise(mean_cty = mean(cty))
df_g

ggplot(data = df_g, aes(drv, mean_cty)) + geom_col(fill=rainbow(3))

