rm(list=ls())

## 패키지 설치 및 불러오기
library(tidyverse)

# unite()

df <- data.frame(id = 1:3,
                  year = c(2000, 2001, 2000),
                  month = c(5, 3, 11),
                  day = c(24, 30, 15)); df

# 기본적으로 구분자는 _로 됨
df %>% 
  unite(date, year, month, day)

# 구분자를 직접 지정하고 싶을때는
# sep = "" 사용
df %>% 
  unite(bday, year, month, day, sep = '/')


## end of scripts ####