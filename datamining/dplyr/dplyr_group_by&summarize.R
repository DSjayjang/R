rm(list=ls())

# 패키지 설치 및 불러오기
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("emp.csv") 
emp_org

emp <- emp_org


# 데이터 요약 - group_by(), summarize()
## 전체 직원의 평균 연봉
emp %>%
  summarize(avg_base = mean(base))

mean(emp$base)

## 부서별 평균 연봉
emp %>%
  group_by(dept_no) %>%
  summarize(avg_base = mean(base))

emp %>%
  group_by(dept_no) %>%
  summarize(avg_base = mean(base),
            med_base = median(base),
            sum_bonus = sum(bonus),
            no_ppl = n())

emp %>%
  group_by(dept_no) %>%
  summarize(avg_base = mean(base),
            med_base = median(base),
            sum_bonus = sum(bonus),
            no_ppl = n())

## 부서별로 나눈 후, 성별로 다시 나눔
emp %>%
  group_by(dept_no, gender) %>%
  summarize(avg_base = mean(base))

emp %>%
  group_by(dept_no, gender, job_level) %>%
  summarize(avg_base = mean(base))


## 새로운 컬럼을 만든 후 그룹화
emp %>%
  mutate(job_level_name = ifelse(job_level <= 2, "junior", "senior")) %>%
  group_by(dept_no, gender, job_level_name) %>%
  summarize(avg_base = mean(base))

emp %>%
  mutate(job_level_name = ifelse(job_level <= 2, "junior", "senior")) %>%
  group_by(dept_no, job_level_name, gender) %>%
  summarize(avg_base = mean(base))



# 부서번호 30 제외
# 각 부서별
# 베이스 + 보너스
# 평균
# 연봉이 가장 높은 
# 부서 번호만 출력
# 가장 높은 부서 번호 하나만 출력
emp %>%
  filter(dept_no != 30) %>%
  group_by(dept_no) %>%
  mutate(total = base + bonus) %>%
  summarize(avg_total = mean(total)) %>%
  arrange(desc(avg_total)) %>%
  select(dept_no) %>%
  head(1)


## end of scripts ####