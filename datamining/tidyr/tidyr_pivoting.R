rm(list=ls())

## 패키지 설치 및 불러오기
library(tidyverse)


# df 생성
stu1 <- data.frame(name = c('Jimin', 'Hyunsoo', 'Sangho', 'Yerim'),
                   year1 = c(100, 70, 80, 60),
                   year2 = c(77, 49, 53, 82)); stu1


# pivot_longer
stu2 <- pivot_longer(stu1, 
                     cols = c('year1', 'year2'),
                     names_to= 'year', 
                     values_to = 'grade'); stu2

# gather
## pivot_longer와 같은 함수
gather(stu1, key = year, value = grade, year1, year2)


# pivot_wider
pivot_wider(stu2,
            names_from = year,
            values_from = grade)

# spread
## pivot_longer와 같은 함수
spread(stu2, key = year, value = grade)


## end of scripts ####