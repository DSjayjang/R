rm(list=ls())
library(tidyverse)

head(mpg)

# 막대 그래프
mpg %>%
  ggplot(aes(x = manufacturer)) +
  geom_bar()


# 막대 그래프 - 색깔
mpg %>%
  ggplot(aes(x = manufacturer)) +
  geom_bar(color = "black", fill = "green", width = 0.7)


# 막대 그래프 - 색깔 + 타이틀
mpg %>%
  ggplot(aes(x = manufacturer)) +
  geom_bar(color = "black", fill = "green", width = 0.7) +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers")


# 막대 그래프 - 색깔 + 타이틀 + x축 커스텀
mpg %>%
  ggplot(aes(x = manufacturer)) +
  geom_bar(color = "black", fill = "green", width = 0.7) +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# 막대 그래프 - 색깔 + 타이틀 + x,y축 반전
mpg %>%
  ggplot(aes(x = manufacturer)) +
  geom_bar(color = "black", fill = "green", width = 0.7) +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers") +
  coord_flip()



# 막대 그래프 - 변수별 색깔 다르게 하기
# 제조사별, 구동방식별로 구분한 라인데이터
## 1. 누적 그래프
mpg %>%
  ggplot(aes(x = manufacturer, fill = drv)) +
  geom_bar(position = "stack") +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers")


# 막대 그래프 - 변수별 색깔 다르게 하기
## 2. 
mpg %>%
  ggplot(aes(x = manufacturer, fill = drv)) +
  geom_bar(position = "identity") +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers")


# 막대 그래프 - 변수별 색깔 다르게 하기
## 3. 비율 그래프
mpg %>%
  ggplot(aes(x = manufacturer, fill = drv)) +
  geom_bar(position = "fill") +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers")



#평균 막대그래프
class_hwy <- mpg %>%
  group_by(class) %>%
  summarize(avg_hwy = mean(hwy))

class_hwy %>%
  ggplot(aes(x = class, y = avg_hwy)) +
  geom_col() + 
  labs(title = "Average Highway MPG by Type of Car",
       x = 'Type of Car',
       y = 'Average Highway MPG')


# 막대 정렬
class_hwy %>%
  ggplot(aes(x = reorder(class, -avg_hwy), y = avg_hwy)) +
  geom_col() + 
  labs(title = "Average Highway MPG by Type of Car",
       x = 'Type of Car',
       y = 'Average Highway MPG')



# 2개 이상의 평균이 있을 때 막대그래프
## 1. 데이터 형태를 롱포맷으로 변경
mpg_long <- mpg %>%
  group_by(class) %>%
  summarize(avg_hwy = mean(hwy),
            avg_cty = mean(cty)) %>%
  pivot_longer(cols = -class)


## 2. 위의 데이터로 그래프 생성
mpg_long %>%
  ggplot(aes(x = class, y = value, fill = name)) +
  geom_col(position ="dodge")



## end of scripts ####