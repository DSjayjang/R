rm(list=ls())

## 패키지 설치 및 불러오기
library(tidyverse)

# separate
df1 <- data.frame(id = 1:4, 
                  x = c("m-014", "f-1524", "f-2534", "m-65"), 
                  bday = c(920134, 941025, 960409, 970228)); df1


# 새롭게 생성될 컬럼명 지정 후,
# 구분자를 기준으로 문자열 분리
df1 %>%
  separate(x, into = c("gender", "age"), sep = "-")


# separate_wider_delim
## separate와 같음
df1 %>% 
  separate_wider_delim(x, names = c("gender", "age"), delim = "-")


# separate_wider_position
## width로 나누고 싶은 컬럼과, 나눌 문자 개수 지정
df1 %>% 
  separate_wider_position(bday, widths = c(year = 2, month = 2, day = 2))

df1 %>% 
  separate_wider_position(bday, widths = c(year = 2, date = 4))

df1 %>% 
  separate_wider_position(bday, widths = c(year = 2, 3, last_digit = 1))


# separate_longer_delim
## 여러 행으로 나누고 싶은 경우
df2 <- data.frame(id = 1:4,
                  color = c('red, orange', 'red, yellow, purple', 'green, blue', 'blue, pink, green')); df2

df2 %>% 
  separate_longer_delim(color, delim = ",")


df2 %>% 
  separate_longer_delim(color, delim = ",") %>%
  group_by(id) %>%
  summarize(cnt = n())


## end of scripts ####