# 수치를 통한 연속형 자료의 요약

# 중심위치의 측도 (평균)
sample <- c(89, 74, 91, 88, 72, 84)

sum(sample) / length(sample)
mean(sample)


# 중심위치의 측도 (중앙값)
## 샘플의 개수가 홀수인 경우
sample_odd <- c(89, 74, 91, 88, 72)
median(sample_odd)

## 샘플 개수가 짝수인 경우
sample_even <- c(89, 74, 91, 88, 72, 84)
median(sample_even)


## 중앙값 직접 계산하기
### 홀수인 경우
sort(sample_odd) # 데이터 정렬
(length(sample_odd)+1) / 2 # n/2번째 인덱스
sort(sample_odd)[(length(sample_odd) + 1) / 2] # 중앙값

### 짝수인 경우
sort(sample_even) # 데이터 정렬
idx1 <- length(sample_even) / 2; idx1 # n/2번째 인덱스
idx2 <- length(sample_even) / 2 + 1; idx2 # n/2 + 1번째 인덱스

(sort(sample_even)[idx1] + sort(sample_even)[idx2]) / 2 # 중앙값

