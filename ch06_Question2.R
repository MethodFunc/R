library(dplyr)

mpg = as.data.frame(ggplot2::mpg)

df = mpg %>% select(class, cty)

head(df)

df_suv = df %>% filter(class =='suv')
df_compact = df %>% filter(class == 'compact')

mean(df_suv$cty)
mean(df_compact$cty)

