rm(list=ls())
library(tidyverse)

# 샘플 데이터
head(economics)
head(economics_long)

summary(economics)


# 선그래프
economics %>%
  ggplot(aes(x = date, y = unemploy)) +
  geom_line()


# 선그래프 + 색깔
economics %>%
  ggplot(aes(x = date, y = unemploy)) +
  geom_line(color = "red")


# 선그래프 + 색깔 + 추세선
economics %>%
  ggplot(aes(x = date, y = unemploy)) +
  geom_line(color = "red") +
  geom_smooth(method = "lm", se = F)


# 선그래프 + 색깔 + 추세선 + 격자선
economics %>%
  ggplot(aes(x = date, y = unemploy)) +
  geom_line(color = "red") +
  geom_smooth(method = "lm", se = F) +
  theme(panel.grid.major.x = element_line(color = "black"),
        panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank())



# 연도별 variable에 따른 실업률
head(economics_long)

economics_long %>%
  ggplot(aes(x = date, y = value01, color = variable)) +
  geom_line()


# 배경색 변경
economics_long %>%
  ggplot(aes(x = date, y = value01, color = variable)) +
  geom_line() +
  theme_bw()


## end of scripts ####