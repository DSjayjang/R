library(tidyverse)
rm(list=ls())

# 박스플롯

mpg %>%
  ggplot(aes(x = drv, y = hwy)) +
  geom_boxplot()

### boxplot 색깔 채우기
mpg %>%
  ggplot(aes(x = drv, y = hwy, fill = drv)) +
  geom_boxplot()


### title, x, y축 label 표시  
mpg %>%
  ggplot(aes(x = drv, y = hwy, fill = drv)) +
  geom_boxplot() + 
  labs(x = "Type of Drive Train",
       y = "Highway MPG",
       title = "Box Plot of Highway MPG by Type of Drive Train")


### 데이터 크기별 box 크기 조정
mpg %>%
  ggplot(aes(x = drv, y = hwy, fill = drv)) +
  geom_boxplot(varwidth = T) +
  labs(x = "Type of Drive Train",
       y = "Highway MPG",
       title = "Box Plot of Highway MPG by Type of Drive Train")


### boxplot 중앙값에 notch
mpg %>%
  ggplot(aes(x = drv, y = hwy, fill = drv)) +
  geom_boxplot(varwidth = T,
               notch = T) +
  labs(x = "Type of Drive Train",
       y = "Highway MPG",
       title = "Box Plot of Highway MPG by Type of Drive Train")


### outlier 커스텀
mpg %>%
  ggplot(aes(x = drv, y = hwy, fill = drv)) +
  geom_boxplot(varwidth = T,
               notch = T,
               outlier.colour = "red",
               outlier.shape = "square",
               outlier.size = 2) +
  labs(x = "Type of Drive Train",
       y = "Highway MPG",
       title = "Box Plot of Highway MPG by Type of Drive Train")


## end of scrips ####