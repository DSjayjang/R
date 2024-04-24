library(tidyverse)

# 결측치 찾기
df <- data.frame(name = c('Hwayoung',	NA,	'Sua',	'Sojin',	'Minjeong',	'Gaeun',	'Janghoon',	'Sunghoon',	'Jaeyoung',	'Yeseung',	'Jungjae',	'Kyunghwan'),
                   class = c(1, 2, 3, 2, 3, 1, 1, 2, 3, 3, 2, 2),
                   math = c(74, 56, NA, 57, 42, 39, 55, 68, NA, 83, 92, 71),
                   eng = c(76, 70, 77, 68, NA, 63, 70, NA, 95, NA, 100, 65))

# NA값 체크
anyNA(df)

is.na(df)

table(is.na(df)) # 전체 NA가 몇개 있는지(TRUE 값)

colSums(is.na(df)) # 각 컬럼별 NA 개수 보기


# NA가 있는 Data 출력
df %>%
  filter(is.na(math))


# NA가 없는 Data 출력
## is.na 이용
df %>%
  filter(!is.na(math))

df %>%
  filter(!is.na(math) & !is.na(eng))


## drop_na 로 NA제거한 Data 출력가능
df %>%
  drop_na()

df %>%
  drop_na(math)

df %>%
  drop_na(math,eng)

## na.omit 이용
### NA가 포함된 모든 Data를 지울 수 있지만 너무 많은 Data가 삭제될 수 있음
na.omit(df)


# 예시
df2 <- data.frame(df, 
                   gender = c('f', NA, NA, NA, NA, NA, 'm', NA, NA, NA, NA, NA))

### 대부분의 Data가 날라가게 됨
df2 %>%
  drop_na()

### NA를 제거한 Data의 수학과 영어 평균점수
df2 %>%
  drop_na(math, eng) %>%
  group_by(class) %>%
  summarize(mean(math), mean(eng))

## na.rm
### 함수 자체에서 NA를 제거하는 방법

df2 %>%
  summarize(mean(math, na.rm=T))


# NA를 채우는 방법

## fill 함수 이용
df2 %>%
  fill(gender, .direction = "down")

df2 %>%
  fill(gender, .direction = "up")

### 바로 위에 있는 Data로 NA를 대체
df2 %>%
  fill(math)


## replace_na
## NA를 특정 값으로 대체
df2 %>%
  replace_na(list(math = 0)) #NA를 0값으로 대체

df2 %>%
  replace_na(list(math = 0, eng = 10)) #수학은 0점, 영어는 10점으로 대체

df2 %>%
  replace_na(list(math = mean(df2$math, na.rm = T))) # NA값을 수학평균점수로 대체 # mean에 $로 컬럼명 지정해야함

## mutate
df2 %>%
  mutate(math = ifelse(is.na(math), mean(math, na.rm = T), math)) # NA값을 수학평균점수로 대체