setwd('d:/workspace/R/data')

library(rvest)
library(stringr)
library(dplyr)
library(curl)
library(ggplot2)
library(ggmap)


register_google(key = 'AIzaSyCcHwEAt_eIkxdA_qNS-rPwUc8WjBzlZN8')
a  = get_map(location = '세종특별자치시 금남면',
        zoom = 15,
        maptype='satellite',
        source = 'google')

ggmap(a)

qmap(location = '세종특별자치시 금남면',
     zoom = 15,
     maptype='satellite',
     source = 'google')

plot.new()
frame()
geocodeQueryCheck()
geocode(location = '세종특별자치시 금남면면',
        ouput='latlon',
        source='google')

geocode(location = enc2utf8('세종특별자치시 금남면$language=ko'),
        ouput='latlon',
        source='google')

myloc = geocode(location = enc2utf8('세종특별자치시 금남면$language=ko'),
                ouput='latlon',
                source='google')
myloc

center = c(myloc$lon, myloc$lat)
qmap(location = center, zoom=18,
     maptype='hybrid',
     source='google') + geom_point(data=myloc,
                                    mapping=aes(x=lon, y=lat),
                                    shape='☆',
                                    color='red',
                                    stocks=18, size=10)


url = 'https://namu.wiki/w/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C%EC%9D%98%20%EB%8C%80%ED%95%99%EA%B5%90%20%EB%AA%A9%EB%A1%9D'

hdoc = read_html(url, encoding = 'utf-8')

df = hdoc %>%
    html_nodes('.wiki-paragraph a') %>%
    html_text

univ = ifelse(str_detect(df, pattern = '대학교'), df,'')

univ
kk = univ %>%
    data.frame()
kk = Filter(function(x){nchar(x) >= 5}, univ)
kk

univName = kk[2:28]
univName

univCord = geocode(location = univName,
                   output='latlon',
                   source='google')
univdf = data.frame(univ = univName, lon=univCord$lon, lat = univCord$lat)

View(univdf)


univdfna = na.omit(univdf)
univdfna
center = c(mean(univdfna$lon), mean(univdfna$lat))
center

qmap(location = center, zoom=12,
     maptype='satellite',
     source='google') + 
    geom_point(data=univdfna, aes(lon, lat), shape='☆', color='red', size=6) + 
    geom_text(data=univdfna,  aes(lon, lat, label=univ), color='green', hjust=0.5, vjust=-0.1, size=3, fontface='bold', family='NanumGodic')
 
# Movie 크롤링을 통한 시나리오 분석석