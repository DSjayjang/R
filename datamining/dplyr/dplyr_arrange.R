rm(list=ls())

# 패키지 설치 및 불러오기
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("emp.csv") 
emp_org

emp <- emp_org


# 열 정렬 - arrange
## id 기준으로 오름차순 정렬
emp %>%
  arrange(id)

## base 기준으로 내림차순 정렬
emp %>%
  arrange(desc(base))

## dept_no로 먼저 오름차순 정렬,
## dept_no가 같을 경우에는 join_date로 오름차순 정렬
emp %>%
  arrange(dept_no, join_date)

## 변수 순서가 달라지면 결과도 달라진다.
emp %>%
  arrange(join_date, dept_no)

## 오름차순과 내림차순 섞어서 정렬
emp %>%
  arrange(desc(job_level), desc(base), join_date)


## dept_no가 10 또는 40인 사람들 중,
## id와 ename만 출력하는데,
## id를 내림차순으로 정렬
emp %>%
  filter(dept_no %in% c(10,40)) %>%
  select(id, ename) %>%
  arrange(desc(id))


## dept_no가 10 이고, job_level이 2 이하거나,
## dept_no가 20 또는 30 이고, job_level이 4 이상인 사람들 중,
## ename, dept_no, job_level, join_date 만 추출하는데,
## job_level을 내림차순으로 먼저 정렬, join_date로 오름차순 정렬
emp %>%
  filter((dept_no == 10 & job_level <=2) | (dept_no %in% c(20, 30) & job_level >= 4)) %>%
  select(ename, dept_no, job_level, join_date) %>%
  arrange(desc(job_level), join_date)


## end of scripts