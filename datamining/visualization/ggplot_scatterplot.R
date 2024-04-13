rm(list=ls())

library(tidyverse)
head(midwest)

# 숫자 자리수 옵션
options(scipen=999) 


# 그래프 배경, 그래프 타입 추가
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point()

# 추세선 추가
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point() +
  geom_smooth(method = "lm")



# x축, y축 조정하기 
# 1. 데이터 지우기 
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point() +
  geom_smooth(method = "lm") +
  xlim(c(0, 0.1)) + 
  ylim(c(0, 1000000))


# 2. 데이터는 그대로 두고 선택 부분을 확대하기
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point() +
  geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000))




# 그 외 옵션 넣기
# 타이틀 및 서브타이틀, x, y 이름 지정
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point() +
  geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) +
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset",
       y = "Population",
       x = "Area")


# 점 색깔 및 점 크기
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point(col = "green", size = 2) + #점 커스텀
  geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) +
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset",
       y = "Population",
       x = "Area")


# 추세선 색깔 크기
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point(col = "green", size = 2) +
  geom_smooth(method = "lm", col = "firebrick", linewidth = 2) + #추세선 커스텀
  coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) +
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset",
       y = "Population",
       x = "Area")


# 그룹별로 점 색상 변경
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point(aes(col = state)) + #그룹별 점 색상
  geom_smooth(method = "lm", col = "firebrick", linewidth = 2) +
  coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) +
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset",
       y = "Population",
       x = "Area")


# 범례 지우기
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point(aes(col = state)) +
  geom_smooth(method = "lm", col = "firebrick", linewidth = 2) +
  coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) +
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset",
       y = "Population",
       x = "Area") +
  theme(legend.position = "none") # 범례 삭제


# 축 변경
midwest %>%
  ggplot(aes(x = area, y = poptotal)) +
  geom_point(aes(col = state)) +
  geom_smooth(method = "lm", col = "firebrick", linewidth = 2) +
  coord_cartesian(xlim = c(0, 0.1), ylim = c(0, 1000000)) +
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset",
       y = "Population",
       x = "Area") +
  theme(legend.position = "none") +
  scale_x_continuous(breaks = seq(0, 0.1, 0.01)) # x축 너비 변경

## end of scripts ####