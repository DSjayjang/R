rm(list=ls())

# 데이터 불러오기
setwd('')

df <- read.csv('df.csv', header = TRUE)
head(df)
str(df)
summary(df)

df_joint <- read.csv('df_joint.csv', header = TRUE)
df_joint

# 모집단 크기
n = nrow(df); n

# 결합 확률분포 생성
joint <- table(df) / n
joint

# 주변 확률분포
X_margin <- margin.table(joint, margin = 1); X_margin
Y_margin <- margin.table(joint, margin = 2); Y_margin

## 주변 확률분포의 기댓값
mu_X <- sum(unique(df$X) * X_margin); mu_X # 모평균
mu_Y <- sum(unique(df$Y) * Y_margin); mu_Y # 모평균

## 주변 확률분포의 분산
dev_X <- unique(df$X) - mu_X; dev_X # 편차
var_X <- sum(dev_X^2 * X_margin); var_X # 모분산

dev_Y <- unique(df$Y) - mu_Y; dev_Y # 편차
var_Y <- sum(dev_Y^2 * Y_margin); var_Y # 모분산

#########################################################################
# 데이터가 모집단에서 추출한 표본이라면?
## 표본분산
var(df$X)

## 표본분산 직접 계산하기
svar_X <- sum((df$X - mean(df$X))^2) / (n-1); svar_X

# 모분산 vs. 표본분산
var_X; svar_X

svar_X2 <- sum((df$X - mean(df$X))^2) / (n); svar_X2 # 모집단으로 가정했을 때는 모분산과 동일
#########################################################################



# 결합 확률분포의 기댓값
df_joint

mu_XY <- sum(df_joint$XY * df_joint$Prob); mu_XY

# 공분산 Cov(X,Y) = E[XY] - E[X]E[Y]
cov_XY <- mu_XY - mu_X * mu_Y; cov_XY # 모공분산

# 표본 공분산
cov(df$X, df$Y) 
sum((df$X - mean(df$X)) * (df$Y - mean(df$Y))) / (n-1)
sum((df$X - mean(df$X)) * (df$Y - mean(df$Y))) / (n) # 모공분산과 동일



# End