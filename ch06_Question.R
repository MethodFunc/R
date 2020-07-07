library(dplyr)

mpg = as.data.frame(ggplot2::mpg)

mpg_a = mpg %>% filter(displ <= 4)
mpg_b = mpg %>% filter(displ >= 5)

mean(mpg_a$hwy)
mean(mpg_b$hwy)

mpg_audi = mpg %>% filter(manufacturer == 'audi')
mpg_toyota = mpg %>% filter(manufacturer =='toyota')

mean(mpg_audi$cty)
mean(mpg_toyota$cty)

mpg_new = mpg %>% filter(manufacturer %in% c('chevrolet', 'ford', 'honda'))

mean(mpg_new$hwy)

mpg_new