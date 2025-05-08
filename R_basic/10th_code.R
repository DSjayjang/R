rm(list=ls())

setwd('C:\\Users\\user\\Desktop\\수업\\석사 2차\\5. 기초통계실습1\\2. 강의자료\\10th')
# 데이터 불러오기
df <- read.csv('data_joint.csv', header = TRUE)
df

n = nrow(df); n



# 결합 확률분포
joint <- table(df)
joint

df_joint <- as.data.frame(joint)
df_joint

df_joint$prob <- df_joint$Freq / n
df_joint  
  



# 주변 확률분포 (Marginal Probability Distribution)

## X의 주변확률분포
X_margin <- margin.table(joint, margin = 1) / n
X_margin

## Y의 주변확률분포
Y_margin <- margin.table(joint, margin = 2) / n
Y_margin


# 주변 확률분포의 기댓값
## X의 기댓값
mean(df$X)
sum(unique(df$X) * X_margin)

## Y의 기댓값
mean(df$Y)
sum(unique(df$Y) * Y_margin)

# 주변 확률분포의 분산
var(df$X) # X의 표본분산

dev_X <- unique(df$X) - mean(df$X) # 편차
dev_X

sum(dev_X^2 * X_margin)

## Y의 표본분산
var(df$Y)

dev_Y <- unique(df$Y) - mean(df$Y) # 편차
dev_Y

sum(dev_Y^2 * Y_margin)















