rm(list=ls())

# 패키지 불러오기
library(dplyr) 

# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("emp.csv") 

emp <- emp_org
head(emp)

# 빌트인 함수
month.name
month.abb


# 샘플 데이터셋
m1 <- data.frame(id = 1:3, 
                 name = month.name[1:3]); m1
m2 <- data.frame(id = 4:12, 
                 name = month.name[4:12]); m2
a1 <- data.frame(abb = month.abb[1:3]); a1
a2 <- data.frame(abb = month.abb[2:5]); a2


# 행 합치기
rbind(m1, m2)
# 열 합치기
cbind(m1, a1)


# m1에 새로운 열 추가
m1 <- data.frame(id = 1:3,
                 name = month.name[1:3],
                 kname = c("1월","2월","3월")); m1

rbind(m1, m2) # 에러
bind_rows(m1, m2) # 가능


# m1에 열 순서 바꾸기 
m1 <- data.frame(id = 1:3,
                 kname = c("1월","2월","3월"),
                 name = month.name[1:3])

## 열의 순서가 바뀌어도 알아서 잘 병합이 됨
bind_rows(m1, m2)

# 열 합치기
cbind(m1, a1)
cbind(m2, a2) # 에러
bind_cols(m2, a2) #에러



# join 예제 1
a2 <- data.frame(add = month.abb[2:5],
                 id = 2:5); a2

left_join(m2, a2, by = "id")


inner_join(m2, a2, by = "id")
full_join(m2, a2, by = "id")
left_join(m2, a2, by = "id")
right_join(m2, a2, by = "id")


a2 <- data.frame(add = month.abb[2:5],
                 num = 2:5)

inner_join(m2, a2, by = c("id" = "num"))



# join 변수명 2개 이상 연결
## 2개 이상의 값이 같을 때 결합
d1 <- data.frame(name = c("Minji", "Sojin", "Hyunwoo", "Kitae"),
                 bday = c("1980-01-02", "1982-05-06", "1988-02-04", "1993-04-07"),
                 job = c("Accountant", "Analyst", "Devloper", "CEO"))

d2 <- data.frame(name = c("Minji", "Sojin", "Hyunwoo", "Kitae"),
                 bday = c("2001-03-30", "1982-05-06", "2003-09-22", "1993-04-07"),
                 city = c("Seoul", "Daegu", "Gwangju", "Jeju"))

# inner_join
## name과 bday가 같을 때 결합
inner_join(d1, d2, by = c("name", "bday"))



# join 예제 2
dept <- data.frame(dept_no = c(10, 30, 40, 50),
                   dept_name = c("Sales", "Operation", "HR", "Research")); dept

loc <- data.frame(dept_no = c(10, 30, 40, 50, 60),
                  location = c("Seoul", "Incheon", "Busan", "Jeonju", "Daejeon")); loc

extra_info <- full_join(dept, loc, by = "dept_no"); extra_info


inner_join(emp, extra_info, by = "dept_no")
left_join(emp, extra_info, by = "dept_no")


## end of scripts ####