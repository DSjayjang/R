rm(list=ls())

## 패키지 설치 및 불러오기
library(tidyverse)

# expand()
## 각 컬럼을 조합하여 나올 수 있는 경우의 수를 보여줌
df <- data.frame(
  type = c("apple", "orange", "apple", "orange", "orange", "orange"),
  year = c(2010, 2010, 2012, 2010, 2011, 2012),
  size = c("S", "S", "S", "S", "L", "L")
); df


df %>%
  expand(type, year)

df %>%
  expand(type, year, size)


## end of scripts ####