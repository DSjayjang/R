rm(list=ls())

library(plotly)
library(tidyverse)


# ggplot 그래프 생성
p <- mpg %>%
  ggplot(aes(x = displ, y = hwy, col = drv)) +
  geom_point()

plot(p)


# plotly로 인터랙티브 그래프로 변경
ggplotly(p)


# 변수 앞 항상 ~표 적어줘야함
plot_ly(mpg, x = ~displ, y = ~hwy)


## 그래프 타입
plot_ly(mpg, x = ~displ, y = ~hwy,
        type = "scatter")


## 그래프 타입 + 모드: markers
plot_ly(mpg, x = ~displ, y = ~hwy,
        type = "scatter", mode = "markers")



## 그래프 타입 + 모드: markers 커스텀
plot_ly(mpg, x = ~displ, y = ~hwy,
        type = "scatter", mode = "markers",
        marker = list(size = 6,
                      color = 'green',
                      line = list(color = 'red', width = 2)))


## 변수별 색깔 다르게 보기
plot_ly(mpg, x = ~displ, y = ~hwy,
        type = "scatter", mode = "markers",
        color = ~drv)


## 타이틀 추가
plot_ly(mpg, x = ~displ, y = ~hwy,
        type = "scatter", mode = "markers",
        color = ~drv) %>%
  layout(title = "interactive scatter plot", 
         xaxis = list(title = 'highway MPG'), 
         yaxis = list(title = 'displacement'))




# 제조사별 평균
new_mpg <- mpg %>%
  group_by(manufacturer, drv) %>%
  summarize(cnt = n())


plot_ly(new_mpg, x = ~manufacturer, y = ~cnt,
        type = "bar") %>%
  layout(title = "interactive bar graph", 
         xaxis = list(title = 'manufacturer'), 
         yaxis = list(title = 'count'))

# 컬러 추가
plot_ly(new_mpg, x = ~manufacturer, y = ~cnt,
        type = "bar", color = ~drv) %>%
  layout(title = "interactive bar graph", 
         xaxis = list(title = 'manufacturer'), 
         yaxis = list(title = 'count'))

#
plot_ly(new_mpg, x = ~manufacturer, y = ~cnt,
        type = "bar", color = ~drv) %>%
  layout(title = "interactive bar graph", 
         xaxis = list(title = 'manufacturer'), 
         yaxis = list(title = 'count'),
         barmode = 'stack')

# 두개의 그래프 각각 보여주기
new_mpg2 <- mpg %>%
  group_by(manufacturer) %>%
  summarize(avg_hwy = mean(hwy),
            avg_cty = mean(cty))


g1 <- plot_ly(new_mpg2, x = ~avg_hwy, y = ~manufacturer,
             type = "bar", name = "highway MPG") %>%
  layout(title = "highway MPF", 
         yaxis = list(categoryorder = 'total ascending'))

g2 <- plot_ly(new_mpg2, x = ~avg_cty, y = ~manufacturer,
             type = "bar", name = "city MPG") %>%
  layout(title = "city MPF", 
         yaxis = list(categoryorder = 'total ascending'))


subplot(g1, g2, nrows = 1) %>%
  layout(title = "MPG by manufactureres",
         legend = list(orientation = "h"))



###########################################################

# plot_ly로 boxplot / line graph

# 박스플롯
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box')
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box', color = ~drv)
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box', color = ~drv, boxmean = T)
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box', color = ~drv, boxmean = T, boxpoints = 'all')
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box', color = ~drv, boxmean = T, boxpoints = 'all', jitter = 0.8)


## 변수별로 볼 때
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box', color = ~class)

## 박스가 안겹치게
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box', color = ~class) %>%
  layout(boxmode = 'group')




# 라인그래프
head(economics)

plot_ly(economics, x = ~date, y = ~unemploy, type = 'scatter', mode = 'lines')


# 정규화된 데이터
# wide format으로 변경하기
econ <- economics_long %>%
  select(-value) %>%
  pivot_wider(names_from = variable,
              values_from = value01)

# y축이 변경되었음
plot_ly(econ, x = ~date, y = ~unemploy, type = "scatter", mode = "lines")

# 선 추가
plot_ly(econ, x = ~date, y = ~unemploy, type = "scatter", mode = "lines") %>%
  add_trace(y =~pce, mode = "lines") %>%
  add_trace(y =~psavert, mode ="lines")

# 선 추가 + 이름
plot_ly(econ, x = ~date, y = ~unemploy, type = "scatter", mode = "lines") %>%
  add_trace(y =~pce, mode = "lines", name = "pce") %>%
  add_trace(y =~psavert, mode ="lines", name = "pasavert")

# 선 추가 + 이름 + 선 커스텀
plot_ly(econ, x = ~date, y = ~unemploy, type = "scatter", mode = "lines") %>%
  add_trace(y =~pce, mode = "lines", name = "pce", line = list(color = "red", dash = "dash")) %>%
  add_trace(y =~psavert, mode ="lines", name = "pasavert", line = list(color = "blue", dash ="dot"))

# 선 추가 + 이름 + 선 커스텀 (모든 선이 굵어지는 문제)
plot_ly(econ, x = ~date, y = ~unemploy, type = "scatter", mode = "lines", line = list(color = "black", width = 5)) %>%
  add_trace(y =~pce, mode = "lines", name = "pce", line = list(color = "red", dash = "dash")) %>%
  add_trace(y =~psavert, mode ="lines", name = "pasavert", line = list(color = "blue", dash ="dot"))

# 이렇게 해결 가능
plot_ly(econ, x = ~date) %>%
  add_trace(y = ~unemploy, type = "scatter", mode = "lines", line = list(color = "black", width = 5)) %>%
  add_trace(y =~pce, type = "scatter", mode = "lines", name = "pce", line = list(color = "red", dash = "dash")) %>%
  add_trace(y =~psavert, type = "scatter", mode ="lines", name = "pasavert", line = list(color = "blue", dash ="dot"))



# 시간에 따라 그래프 조절
plot_ly(econ, x = ~date) %>%
  add_trace(y = ~unemploy, type = "scatter", mode = "lines", line = list(color = "black", width = 5)) %>%
  add_trace(y =~pce, type = "scatter", mode = "lines", name = "pce", line = list(color = "red", dash = "dash")) %>%
  add_trace(y =~psavert, type = "scatter", mode ="lines", name = "pasavert", line = list(color = "blue", dash ="dot")) %>%
  layout(xaxis = list(rangeslider = list(type = 'date')))


## end of scripts ####