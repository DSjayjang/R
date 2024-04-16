rm(list=ls())

# 패키지 설치 및 불러오기
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("emp.csv") 
emp_org

emp <- emp_org


# 열 선택 - select
emp %>% select(ename)
emp %>% select(gender)
emp %>% select(ename, gender)

# 특정 열 제외 후 출력
emp %>% select(-bonus)
emp %>% select(-base, -bonus)


emp %>%
  filter(dept_no == 30) %>%
  select(ename)

emp %>%
  filter(dept_no == 30) %>%
  select(bonus)

emp %>% 
  filter(dept_no == 10) %>% 
  select(bonus) %>%
  head


## end of scrips ####