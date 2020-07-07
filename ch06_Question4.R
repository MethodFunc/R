library(dplyr)

mpg = as.data.frame(ggplot2::mpg)

mpg %>%
    group_by(class) %>%
    summarise(mean_cty = mean(cty))

mpg %>%
    group_by(class) %>%
    summarise(mean_cty = mean(cty)) %>%
    arrange(desc(mean_cty))

mpg %>%
    group_by(manufacturer) %>%
    summarise(mean_hwy = mean(hwy)) %>%
    arrange(desc(mean_hwy)) %>%
    head(3)

mpg %>%
    filter(class == 'compact') %>%
    group_by(manufacturer) %>%
    summarise(count = n()) %>%
    arrange(desc(count)) %>%
    head(3)