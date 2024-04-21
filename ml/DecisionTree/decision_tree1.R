rm(list=ls())

library(caret)
library(dplyr)


# data read
raw <- read.csv("C:\\Users\\linde\\Downloads\\wine.csv", header = T)
df <- raw
df %>% head

# data 구조 확인
str(df)
summary(df)
df %>% is.na() %>% colSums()

# target 변수인 Class를 범주형변수로 변경
df$Class <- as.factor(df$Class)
str(df)


# 시드 설정
set.seed(1)

# Train과 Test Data로 분할
# Train : Test = 7:3 분할
## 뽑을 행 선정
total <- sort(sample(nrow(df), nrow(df)*0.7))

## Train data 생성
train <- df[total, ]
train %>% head()

## Test data 생성
test <- df[-total, ]
test %>% head()


## Train과 Test data의 feature와 target 분리
train_x <- train[, 1:13]
train_y <- train[, 14]

test_x <- test[, 1:13]
test_y <- test[, 14]



# 모형 학습
ctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 5)

## KNN에서 K를 1~10까지 설정
customGrid <- expand.grid(k = 1:10)

## KNN
knnfit <- train(Class ~.,
                data = train,
                method = "knn",
                trControl = ctrl,
                preProcess = c("center", "scale"),
                tuneGrid = customGrid,
                metric = "Accuracy")
knnfit


## 시각화
### KNN에서 Accuracy가 가장 높은 k 설정정
plot(knnfit)


## 예측
pred_test <- predict(knnfit, newdata = test)


## 분할표
confusionMatrix(test$Class, pred_test)
length(test$Class)
sum(pred_test == test$Class)


## 변수중요도
importance_knn <- varImp(knnfit, scale = FALSE)
importance_knn
plot(importance_knn)


## end of scripts ####