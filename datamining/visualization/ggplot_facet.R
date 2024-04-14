rm(list=ls())

library(tidyverse)


# scatter plot
# 하나의 그래프에서 class(차종)별 배기량과 고속도로 연비
mpg %>%
  ggplot(aes(x = displ, y = hwy, color = class)) + 
  geom_point()


# facet_wrap 함수 이용 - plot 나누기
# class(차종)별로 각각 배기량과 고속도로 연비 산점도 생성
mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class)

# 행, 열 지정
mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, ncol = 2)

mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, nrow = 2)

 
# parameter 위치 변경
mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, nrow = 2, strip.position = 'left')

mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, nrow = 2, strip.position = 'right')


# 각 그래프마다 축 범위 다르게 보여주기
mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, nrow = 2, scale = 'free_x')

mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, nrow = 2, scale = 'free_y')

mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, nrow = 2, scale = 'free')




# facet_grid()
# ~로 각각 변수를 x, y로 나누어줌
## x, y값 다 입력해줘야 함.
mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_grid(class ~ .)

mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_grid(. ~ class)


#drv(구동방식, 3종류), class(차종, 7종류)별로 각각 배기량과 고속도로 연비 산점도 생성
mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_grid(drv ~ class)


mpg %>%
  ggplot(aes(x = displ, y = hwy, color = drv)) + 
  geom_point() +
  facet_grid(. ~ class)


# facet_grid()에 하나의 변수만 적었을 경우 facet_wrap과 같음
mpg %>%
  ggplot(aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap( ~ class, nrow = 1)



## end of scripts ####