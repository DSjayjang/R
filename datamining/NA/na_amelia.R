# 모델을 활용한 NA값 대체
# Amelia imputation ####
rm(list=ls())
getwd()

# library
library(Amelia)

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



# Amelia imputation
# amelia(결측치 보완이 필요한 Data, 후보 개수)
# ?amelia()
amelia_df <- amelia(missing_df, m = 5)


## Amelia imputation 결과
amelia_df$imputations[[1]] # NA값 대치가 완료된 첫번째 Data Frame
amelia_df$imputations[[5]] # NA값 대치가 완료된 다섯번째 Data Frame


## 실제 값 비교
amelia_df$imputations[[1]]$kospi.200_var %>% head()
amelia_df$imputations[[5]]$kospi.200_var %>% head()


## 대치된 값들의 평균 이용하기
amelia_imputed <- amelia_df$imputations[[1]] +
  amelia_df$imputations[[2]] +
  amelia_df$imputations[[3]] +
  amelia_df$imputations[[4]] +
  amelia_df$imputations[[5]]

amelia_imputed <- amelia_imputed / 5
amelia_imputed


## 원래 데이터의 형태와 동일하게 소수점 둘째자리까지 반올림
amelia_imputed %>% round(2)
amelia_imputed %>% is.na %>% colSums()


## end of scripts ####