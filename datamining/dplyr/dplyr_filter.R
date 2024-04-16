rm(list=ls())

# 패키지 설치 및 불러오기
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("emp.csv") 
emp_org

emp <- emp_org


# 행 필터링 - filter
emp %>% filter(dept_no == 10)
emp %>% filter(job_level == 3)
emp %>% filter(job_level != 5)
emp %>% filter(join_date < "2022-01-01")
emp %>% filter(base > 5000)
emp %>% filter(job_level >= 4)

# 문자에도 부등호 적용이 가능하다.
emp %>% filter(ename <= "e") # ename이 a, b, c, d로 시작하는 직원

emp %>% filter(dept_no == 10 & gender == "M" & bonus >= 400) # and 조건
emp %>% filter(base >= 5000 | bonus >= 500 | dept_no == 40) # or 조건


# %in%
# 변수의 값이 지정한 목록에서 해당하는지
emp %>% filter(dept_no == 20 | dept_no == 30)
emp %>% filter(dept_no %in% c(20, 30))

emp_jr <- emp %>% filter(job_level %in% c(1,2))
emp_sr <- emp %>% filter(job_level %in% c(3,4,5))

emp_jr
emp_sr

mean(emp_jr$base)
mean(emp_sr$base)


## end of scripts ####