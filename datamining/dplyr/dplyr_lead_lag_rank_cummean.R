rm(list=ls())

# 패키지 불러오기
library(dplyr) 


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("emp.csv") 
emp <- emp_org


# 데이터 프레임 동일성 확인 - all.equal()
all.equal(emp, emp_org)

## 기존 df에서 컬럼 순서를 변경
emp1 <- emp %>%
  select("id", "ename", "dept_no", "job_level", "join_date", "base", "bonus", "gender")

all.equal(emp1, emp_org) # 컬럼 순서가 다르면 다르다고 나온다.

## 기존 df을 축소
emp2 <- emp %>%
  filter(gender == "M")

all.equal(emp2, emp_org) # 다르다고 나온다.



# 직전/직후 행 확인 - lead(), lag()
## lead()
### 다음 줄의 data를 위로 한칸 올림
emp %>%
  group_by(job_level) %>%
  summarize(avg = mean(base)) %>%
  mutate(next_avg = lead(avg)) # avg를 한칸 올림

emp %>%
  group_by(job_level) %>%
  summarize(avg = mean(base)) %>%
  mutate(next_avg = lead(avg),
         diff = next_avg - avg)


## lag()
### 윗 줄의 data를 아래로 한칸 내림
emp %>%
  group_by(dept_no, job_level) %>%
  summarize(avg = mean(base)) %>%
  mutate(prev_avg = lag(avg)) # avg를 한칸 내림

#### dept_no 안에서 직급의 평균 base를 비교,
#### dept_no가 달라지면 비교하지 않음(NA)
emp %>%
  group_by(dept_no, job_level) %>%
  summarize(avg = mean(base)) %>%
  mutate(prev_avg = lag(avg),
         diff = prev_avg - avg)


# data frame과 tibble의 차이점
## 일반적인 data frmae 생성
df_emp <- data.frame(emp %>%
                       group_by(dept_no, job_level) %>%
                       summarize(avg = mean(base), .groups = 'drop') %>%
                       select(dept_no, job_level, avg))

### data frame에서 lag 함수 적용
df_emp %>%
  mutate(prev_avg = lag(avg))

# 데이터간 특성이 전혀 고려되지 않고 단순히 차이를 만들어냄
df_emp %>%
  mutate(prev_avg = lag(avg),
         diff = prev_avg - avg) 





# 순위 확인 - row_number(), min_rank(), dense_rank()
v1 <- c(20, 10, 30, 40, 50)
v2 <- c(10, 20, 30, 30, 30, 40)

# 크기의 순서 확인
row_number(v1)
row_number(v2) # 중복된 값이 있으면 순차적으로 크기가 +1

# 동일한 값이 있으면 같은 크기로 판단
# 다음 큰 값은 밀린 숫자만큼 더함
min_rank(v2)

# 동일한 값이 있으면 같은 크기로 판단
# 다음 큰 값은 +1
dense_rank(v2)


# 예제
emp %>%
  arrange(desc(base), desc(bonus)) %>%
  mutate(rank1 = row_number(desc(base)),
         rank2 = min_rank(desc(base)),
         rank3 = dense_rank(desc(base)))


# 누적 평균 확인 - cummean()
emp %>%
  arrange(join_date) %>%
  mutate(cum_avg = cummean(base))

## group_by를 사용하면
## 각 그룹은 서로 cummean에 방해받지 않음
emp %>%
  group_by(gender) %>%
  arrange(join_date) %>%
  mutate(cum_avg = cummean(base))

emp %>%
  group_by(gender) %>%
  arrange(gender, join_date) %>%
  mutate(cum_avg = cummean(base))


## end of scripts ####