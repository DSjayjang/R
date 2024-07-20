# 통계값을 활용한 NA값 대체
rm(list=ls())
getwd()

# Data read
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



## 통계량으로 대체 ####

# 각 컬럼의 NA를 제외한 평균으로 대체
# kosdaq_var NA를 평균으로 대체
missing_df$kosdaq_var[is.na(df$kosdaq_var)] <- mean(missing_df$kosdaq_var, na.rm = T)
missing_df %>% is.na %>% colSums()


# 위 과정을 전체 columns에 반복해서 적용
for(i in 1:ncol(missing_df)){
  missing_df[is.na(missing_df[, i]), i] <- mean(missing_df[, i], na.rm = T)
}
missing_df %>% is.na %>% colSums()



# 중위수로 치환하고 싶을 경우
missing_df2 <- df[, !colnames(df) %in% "date"]
missing_df2 %>% is.na %>% colSums()

for (i in 1:ncol(missing_df2)) {
  missing_df2[is.na(missing_df2[, i]), i] <- median(missing_df2[, i], na.rm = T)
}
missing_df2 %>% is.na %>% colSums()


## end of scripts ####