rm(list=ls())
library(tidyverse)

head(mpg)

# 히스토그램
mpg %>%
  ggplot(aes(x = hwy)) +
  geom_histogram()


## 히스토그램 타이틀 추가
mpg %>%
  ggplot(aes(x = hwy)) +
  geom_histogram() +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


## 빈 갯수 설정
mpg %>%
  ggplot(aes(x = hwy)) +
  geom_histogram(bins = 6) +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")

## 커스텀
mpg %>%
  ggplot(aes(x = hwy)) +
  geom_histogram(bins = 6, 
                 fill = "blue",
                 color = "black") +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


## 막대의 폭 지정해주기
mpg %>%
  ggplot(aes(x = hwy)) +
  geom_histogram(binwidth = 5, 
                 fill = "blue",
                 color = "black") +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


## fill 함수 활용
## fill에 들어가는 변수는 반드시 범주형 변수여야 함.
mpg %>%
  ggplot(aes(x = hwy, fill = factor(drv))) +
  geom_histogram(binwidth = 2,
                 alpha = 0.7) +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")



mpg %>%
  ggplot(aes(x = hwy, fill = factor(drv))) +
  geom_histogram(binwidth = 2,
                 position = "identity") +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


## 막대의 투명도 조절
## 겹치는 부분도 보이게
mpg %>%
  ggplot(aes(x = hwy, fill = factor(drv))) +
  geom_histogram(binwidth = 2,
                 position = "identity",
                 alpha = 0.7) +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


# 막대의 색깔과 범례 레이블 수정
mpg %>%
  ggplot(aes(x = hwy, fill = factor(drv))) +
  geom_histogram(binwidth = 2,
                 position = "identity",
                 alpha = 0.7) +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG",
       fill = "drive train") +
  scale_fill_manual(values = c("4" = "blue", "f" = "green", "r" = "red"),
                    breaks = c("4", "f", "r"),
                    labels = c("front-wheel drive", "rear wheel drive", "4wd")) 


## end of scripts ####