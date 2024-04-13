# 모델을 활용한 NA값 대체
# Mice imputation ####
rm(list=ls())
getwd()

# library
library(mice)

# Data Read
index_df <- read.csv("index_df.csv")
df <- index_df
df %>% str


# 날짜와 변화량 컬럼들만 사용
col_filter <- grepl("var", colnames(df)) | "date" == colnames(df)
df <- df[, col_filter]

df %>% str
dim(df)


# 계산속도를 위해 2021년 6월 이후의 데이터만 사용
df <- df %>%
  filter(date > "2021-05-31")

df %>% str
dim(df)


# date 순으로 정렬
df <- df %>% arrange(date)
df %>% str


# NA 확인
df %>% is.na %>% colSums()
df %>% head()


#
# date는 NA가 없기 때문에 빼고 진행
missing_df <- df[, !colnames(df) %in% "date"]
missing_df %>% head()



# mice imputation
# mice(결측치 보완이 필요한 Data, 후보 개수, 결측치를 채워넣을 방법)
# ?mice()
mice_df <- mice(missing_df, m=5, method = "cart")


## Mice imputation 결과
complete(mice_df, 1)
complete(mice_df, 5)


## 실제 값 비교
complete(mice_df, 1)[,1] %>% head()
complete(mice_df, 5)[,1] %>% head()


## 대치된 값들의 평균 이용하기
mice_completed1 <- complete(mice_df, 1)
mice_completed2 <- complete(mice_df, 2)
mice_completed3 <- complete(mice_df, 3)
mice_completed4 <- complete(mice_df, 4)
mice_completed5 <- complete(mice_df, 5)

mice_imputed <- mice_completed1 + 
  mice_completed2 +
  mice_completed3 +
  mice_completed4 +
  mice_completed5

mice_imputed <- mice_imputed / 5
mice_imputed


## 원래 데이터의 형태와 동일하게 소수점 둘째자리까지 반올림
mice_imputed %>% round(2)
mice_imputed %>% is.na %>% colSums()


## end of scripts ####