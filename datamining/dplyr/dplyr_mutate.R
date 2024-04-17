rm(list=ls())

# 패키지 설치 및 불러오기
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("emp.csv") 
emp_org

emp <- emp_org


# 열 추가 및 수정 - mutate
## total이라는 새로운 컬럼 생성
emp %>%
  mutate(total = base + bonus) %>%
  head

## special_bonus라는 새로운 컬럼 생성
emp %>%
  mutate(special_bonus = base * 0.1) %>%
  head


# 일반적인 코드
## total이라는 새로운 컬럼 생성
emp$total <- emp$base + emp$bonus

## special_bonus라는 새로운 컬럼 생성
emp$special_bonus <- emp$base * 0.1


# dplyr을 사용한 코드
emp %>%
  mutate(total = base + bonus,
         special_bonus = total * 0.1)


# 조건식을 이용해서 새로운 컬럼 만들기
emp %>%
  mutate(is_new = ifelse(join_date > "2022-03-01", "Y", "N")) %>%
  arrange(ename, desc(is_new))


emp %>%
  mutate(job_level_name = ifelse(job_level <= 2, "junior", "senior"),
         signing_bonus = ifelse(join_date >= " 2023-01-01" & join_date <= "2023-12-31", 200, 0),
         comission = ifelse(dept_no == 10 & job_level_name == "senior", 400, 0),
         total = base + bonus + signing_bonus + comission) %>%
  filter(total > 6000) %>%
  select(ename, total) %>%
  arrange(desc(total))


## end of scripts ####