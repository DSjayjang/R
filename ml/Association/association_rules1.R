rm(list=ls())

## 사용할 라이브러리 설치 및 로드
install.packages('arules')
install.packages('arulesViz')

library(arules) # 연관분석규칙
library(arulesViz) #연관분석규칙시각화
library(tidyverse)


## 데이터 불러와서 확인
movies <- read.csv('C:\\Users\\윤석\\Desktop\\패스트캠퍼스\\[패스트캠퍼스] 데이터 분석 Master Class\\Part4. R\\Ch05\\Ch05. 데이터 분석 실습 프로젝트 - 01. 이커머스 데이터 분석 실습 (1)\\movies.csv')
ratings <- read.csv('C:\\Users\\윤석\\Desktop\\패스트캠퍼스\\[패스트캠퍼스] 데이터 분석 Master Class\\Part4. R\\Ch05\\Ch05. 데이터 분석 실습 프로젝트 - 01. 이커머스 데이터 분석 실습 (1)\\ratings.csv')


head(movies)
tail(movies)
str(movies)

head(ratings)
tail(ratings)
str(ratings)
summary(ratings)


# 결측치 확인
movies %>% is.na() %>% colSums()
ratings %>% is.na() %>% colSums()

# 중복 확인
movies %>%
  filter(duplicated(movies))

## 중복된 영화제목 확인
movies %>%
  filter(duplicated(movies$title)) %>%
  arrange(desc(title))

### 중복된 데이터 확인
movies %>%
  filter(title == "Blackout (2007)")
movies %>%
  filter(title == 'Aladdin (1992)')


ratings %>%
  filter(duplicated(ratings))



# inner join을 통해 평가한 영화만
dataset <- ratings %>%
  inner_join(movies, by = "movieId")

# 데이터 조인 후 중복 제거
new_dataset <- dataset %>%
  select(-genres, -timestamp) %>%
  group_by(title) %>%
  mutate(movieId = min(movieId),
         rating = mean(rating))

dataset %>%
  select(-genres, - timestamp) %>%
  head

dataset %>%
  select(-genres, - timestamp) %>%
  group_by(title) %>%
  mutate(movieId = min(movieId),
         rating = mean(rating))


head(new_dataset)
summary(new_dataset)



## EDA 및 이상치 확인
# 영화별 평가된 수
new_dataset %>%
  group_by(title) %>%
  summarize(cnt = n()) %>%
  arrange(desc(cnt))

new_dataset %>% 
  group_by(movieId) %>% 
  summarise(cnt = n()) %>% 
  summary


#  유저별 평가 갯수
new_dataset %>% 
  group_by(userId) %>% 
  summarise(cnt = n())

new_dataset %>% 
  group_by(userId) %>% 
  summarise(cnt = n()) %>%
  summary


## boxplot 확인
new_dataset %>%
  group_by(userId) %>%
  summarize(cnt = n()) %>%
  ggplot(aes(y = cnt)) +
  geom_boxplot()

## 상위 10, 5, 1%의 사람들은 몇개의 영화를 평가했는지 확인
new_dataset %>%
  group_by(userId) %>%
  summarize(cnt = n()) %>%
  summarize(avg = mean(cnt),
            qt90 = quantile(cnt, 0.9),
            qt95 = quantile(cnt, 0.95),
            qt99 = quantile(cnt, 0.99),
            max = max(cnt))


# outlier
## 너무 많이 평가한 유저의 데이터는 outlier로 지정
ol <- new_dataset %>%
  group_by(userId) %>%
  summarize(cnt = n()) %>%
  filter(cnt > quantile(cnt, 0.99))


## anti_join함수를 이용한 outlier 제거
new_dataset <- new_dataset %>%
  anti_join(ol, by="userId")


## 재미있는 영화를 추천하기 위해, 3.5 이상만 추천하기로 함
new_dataset <- new_dataset %>%
  select(userId, rating, title) %>%
  filter(rating >= 3.5)


# apriori 방법을 사용하기 위해 데이터 포맷 변경
movie_lst <- split(new_dataset$title, new_dataset$userId)
head(movie_lst)


# arules 패키지에서 제공하는 데이터 형식 중 하나인 transactions 형식으로 변경
trans <- as(movie_lst, "transactions")

summary(trans)

## 시각화
## 가장 많이 평가된 상위 10개
## 실제 빈도
itemFrequencyPlot(trans, topN=10, type="absolute")

## 상대적 빈도
itemFrequencyPlot(trans, topN=10, type="relative") 


## 규칙 생성
## maxlen : 연관 규칙의 최대 길이 지정
rules <- apriori(trans, parameter=list(supp=0.1, conf=0.6, maxlen = 2, target = "rules"))  


# 상위 6개 신뢰도별
rules_conf <- sort(rules, by = "confidence", decreasing = T)

inspect(head(rules_conf))


# 상위 6개 리프트별
rules_lift <-sort(rules, by="lift", decreasing=TRUE) # sorting by lift

inspect(head(rules_lift))


# 상위 6개 지지도별 
rules_supp <- sort(rules, by="support", decreasing=TRUE) 

inspect(head(rules_supp))

# 특정 아이템이 있는 규칙
rule_nemo <- subset(rules, items %in% ("Finding Nemo (2003)"))

inspect(sort(rule_nemo)) 


