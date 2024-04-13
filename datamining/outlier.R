# Outlier
rm(list=ls())

# library
library(tidyverse)

# Data
hs <- data.frame(id = 1:10,
                 gender = c('f', 'f', 'f', 'f', 'm', 'm', 'm', 'mm', 'mm', 'm'),
                 age = c(17, 18, 18, 17, 17, 18, 18, 19, 19, 16),
                 math = c(65, 70, 50, 60, 1, 60, 90, 70, 110, 0))
hs

table(hs$gender)
table(hs$age)
hs %>% is.na %>% colSums()

# outlier 처리

new_hs <- hs %>%
  mutate(gender = ifelse(gender == "mm", "m", gender),
         age = ifelse(age == 16, 17, age),
         math = ifelse(math >= 0 & math <= 100 & math %% 5 ==0, math, NA))
new_hs

## 성별과 나이별로 수학점수 평균
new_hs %>%
  group_by(gender, age) %>%
  summarize(avg = mean(math, na.rm = T))

 

# box plot으로 이상치 확인하기
# Data
head(mpg)
summary(mpg)

boxplot(mpg$hwy)
boxplot(mpg$hwy)$stat # 박스플롯을 구성하는 숫자. 최소이상치, 1사분위수, 중위값 등...
 
# outlier 처리
new_mpg <- mpg %>%
  mutate(hwy = ifelse(hwy < 12 | hwy > 37, NA, hwy)) %>%
  arrange(desc(hwy))

boxplot(new_mpg$hwy)



###############################################################################

# ggplot의 box plot 활용해보기
## library
library(ggplot2)


# Data Read
els_df <- read.csv("els_df.csv",fileEncoding="CP949")
df <- els_df
df %>% head()


## Outlier 탐색 ####
df$profit %>% summary

windows()
df %>%
  ggplot(aes(profit)) +
  geom_boxplot(outlier.colour = "red")


# profit이 -10인 행은 제거
df <- df %>%
  filter(profit != -10)


# 카테고리별로 수익률의 boxplot
df %>%
  ggplot(aes(category, profit))+
  geom_boxplot(outlier.colour = "red")




# 원금 지급형의 3사분위수 + 1.5 IQR 값은?
profit1 <- df[df$category == "원금지급형",]$profit
summary(profit1)

upper1 <- 9 + 1.5*IQR(profit1); upper1


# 해당 upper 값을 수평선으로 plotting을 진행
df %>%
  ggplot(aes(category, profit)) +
  geom_boxplot(outlier.colour = "red") +
  geom_hline(yintercept = upper1)



# 원금 비보장 지수형의 3사분위수 + 1.5 IQR 값은?
profit2 <- df[df$category == "원금비보장지수형", ]$profit
summary(profit2)

upper2 <- 7+1.5*IQR(profit2); upper2


# 해당 upper 값을 수평선으로 plotting을 진행
df %>%
  ggplot(aes(category, profit)) +
  geom_boxplot(outlier.colour = "red") +
  geom_hline(yintercept = upper2)


## end of scripts ####