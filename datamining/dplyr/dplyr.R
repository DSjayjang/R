
rm(list=ls())
## library
if(!require(dplyr)) install.packages("dplyr"); 
library(dplyr)


# 데이터 구조 확인
storms %>% head
storms %>% tail
storms %>% str


# arrange
## 연도의 역순으로 정렬
storms %>%
  arrange(desc(year))

storms %>%
  arrange(desc(year)) %>% 
  tail



# distinct
## 서로 다른 태풍의 개수 측정
storms %>%
  distinct(name)

storms %>% 
  distinct(name) %>% 
  nrow


## group by & summarise ####
# 태풍별 풍속의 평균
storms %>%
  group_by(name) %>%
  summarize(mean(wind))


# 연도별 태풍의 풍속의 평균
storms %>% 
  group_by(year) %>% 
  summarise(mean(wind))


# 연도별 태풍 풍속의 풍속대로 정렬
storms %>% 
  group_by(year) %>% 
  summarise(m_winds = mean(wind)) %>%
  arrange(desc(m_winds))





## Join 함수 ####
# 데이터 확인
band_members
band_instruments

# inner_join
band_members %>%
  inner_join(band_instruments)

# left_join
band_members %>%
  left_join(band_instruments)

# right_join
band_members %>%
  right_join(band_instruments)

# full_join
band_members %>%
  full_join(band_instruments)



## 변수명이 서로 다를 때
band_instruments2

band_members %>%
  inner_join(band_instruments2, by = c("name" = "artist"))







# setwd
setwd("C:\\Users\\윤석\\Desktop\\패스트캠퍼스\\[패스트캠퍼스] 프로젝트와 함께 배우는 R 데이터 분석\\Part1238 datasets")

# load data
sector_etf <- read.csv("sector_etf.csv")
sector_etf %>% head()
sector_etf %>% str()


# 섹터의 종류는 무엇이 있는지 확인
sector_etf$sector %>% unique

sector_etf$sector %>% unique %>% length


# 각 섹터별로 etf가 몇 개 있는지 확인
# groupby, summarise
sector_etf %>%
  group_by(sector) %>%
  summarize(n())


temp_df <- sector_etf %>% 
  group_by(sector) %>%
  summarise(etf_cnts = n())

temp_df %>% head()


# etf 개수가 높은 순서대로 데이터를 정렬
temp_df %>% 
  arrange(desc(etf_cnts))



# 원하는 조건의 행 추출
# sector_etf에서 filter, Artificial Intelligence 섹터만 출력
sector_etf %>% 
  filter(sector == "Artificial Intelligence")


# c("Artificial Intelligence", "Growth") 섹터만 출력
sector_etf %>% 
  filter(sector %in% c("Artificial Intelligence", "Growth"))





# 신규 데이터 병합
etf_stocks <- read.csv("etf_stocks.csv")
etf_stocks %>% head()
sector_etf %>% head()


# inner_join
# etf_names를 기준으로 두 데이터를 병합
merged_df <- sector_etf %>% inner_join(etf_stocks)
merged_df %>% head()
merged_df %>% dim


# sample_frac
# sector별로 50%만 추출하라
samples_df <- merged_df %>%
  group_by(sector) %>%
  sample_frac(0.5)
samples_df %>% head()
samples_df %>% dim


## end of scripts ####