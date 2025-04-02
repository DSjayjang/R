rm(list = ls())

# 모집단과 표본
# sample() : 데이터로부터 무작위로 표본(sample) 추출
# replace = T : 복원 추출, replace = F : 비복원추출
# prob : 모집단에서 각각의 원소가 뽑힐 확률 지정

# 난수 고정
set.seed(2025)

population <- 1:10
sample(population, size = 5)
sample(population, size = 5, replace = TRUE)
sample(population, size = 5, replace = TRUE, prob = c(rep(0.01, 9), 0.91))


# 범주형 데이터
# death
# (1:감염성 질환, 2: 각종 암, 3: 순환기 질환, 4: 호흡기 질환,
# 5: 소화기 질환, 6: 각종 사고사, 7: 비뇨기 질환, 8: 정신병,
# 9: 노환, 10: 신경계 질환)
death <- c(rep(1,4),rep(2,33),rep(3,48),rep(4,7),rep(5,11),rep(6,5), rep(7,22),rep(8,1),rep(9,1),rep(10,1))
death

cause <- c('감영성 질환','각종 암','순환기 질환','호흡기 질환', '소화기 질환',
           '각종 사고사','비뇨기 질환','정신병', '노환','신경계 질환')
cause

# 범주형 자료의 요약 - 도수 분포표
tab_death <- table(death)
tab_death

names(tab_death) <- cause
tab_death

prop_death <- prop.table(tab_death) # 상대도수 table
prop_death

# 범주형 자료의 요약 – 원형 그래프
# pie(x, label, main, col, cex)
# x: 도수 분포표를 저장한 객체
# label: 범주명 지정
# main: 그림 제목
# col: 파이 색깔 지정
# cex: 범주 글자 크기 지정
freq_table <- table(death)
freq_table

pie(prop_death,
    label = cause,
    main = '사망원인에 대한 원형 그래프',
    col = c('red', 'yellow'),
    cex = 0.7)

pie(freq_table,
    label = cause,
    main = '사망원인에 대한 원형 그래프', 
    col = rainbow(7),
    cex = 1.2)


# 범주형 자료의 요약 – 막대 그래프
# barplot(height, col, main, ylab, xlab, legend.text, args.legend)
# height: 도수 분포표를 저장한 객체
# col: 막대 그래프의 색깔
# main: 막대 그래프의 제목
# ylab: y축의 이름
# xlab: x축의 이름
# legend.text: 각 범주의 이름
# args.legend: 범례(legend)의 위치
barplot(height = freq_table,
        col = 2,
        main = '사망원인에 대한 막대 그래프',
        xlab = '사망 원인',
        ylab = '빈도수')


# col='blue' 또는 'red' 또는 'green'과 같은 특정 색상을 지정할 수도 있음
# 위에서 col=2 같은 경우는 숫자마다 색깔이 지정되어 있음
# 각 범주의 막대마다 다른 색을 주기 위해 col=rainbow(10)을 이용
# 범례의 위치를 지정할 때 줄 수 있는 값들은 'bottomright',
# 'bottom', 'bottomleft', 'left', 'topleft', 'top', 'topright',
# 'right', 'center' 가 있습니다.
barplot(height = freq_table,
        col = rainbow(10),
        main = '사망원인에 대한 막대 그래프',
        xlab = '사망 원인',
        ylab = '빈도수',
        legend.text = cause,
        args.legend = list(x = 'topright'))


barplot(height=freq_table,
        col = rainbow(10), 
        main = '사망원인에 대한 막대 그래프', 
        xlab='사망원인',
        ylab = '빈도수',
        legend.text = cause,
        args.legend = list(x = 'bottomright'))

# legend(x, y=NULL, legend, fill, title, border)
# 범례를 추가할 때에는 그림이 먼저 그려져 있어야 함
# x: 범례의 위치
# legend: 범주의 이름
# fill: 범례에 표기할 색 (상자 안에 색을 채워넣음)
# title: 범례의 제목
# border: 범례 바깥 테두리 색
barplot(height = freq_table,
        col = rainbow(10), 
        main = '사망원인에 대한 막대 그래프', 
        xlab='사망원인',
        ylab='빈도수')

legend(x = 'topright',
       legend = cause,
       fill = rainbow(10),
       title = '범례',
       border = c('black'))


# 범주형 자료의 요약 – 파레토 그림
# 파레토 그림은 상대도수의 크기가 큰 값부터 작은 값으로 정렬되어
# 있어야 함: 
# 패키지 'qcc'에 있는 pareto.chart 함수 이용하면 됨

# pareto.chart(data, main, xlab, ylab, ylab2)
# data: 도수분포표를 저장한 객체
# main: 파레토그림 제목
# xlab: x축의 이름
# ylab: 빈도수를 나타내는 축의 이름
# ylab2: 누적상대도수를 나타내는 축의 이름

install.packages('qcc') # 패키지 설치
library(qcc) # 패키지 로드

pareto.chart(data = freq_table,
             main = '사망원인',
             xlab = '질병종류',
             ylab = 'Frequency',
             ylab2 = 'Cumulative Percentage')


# 연속형 데이터 
drink <- c(101.8,101.5,101.8,102.6,101,96.8,102.4,100,98.8,98.1,
           98.8,98,99.4,95.5,100.1,100.5,97.4,100.2,101.4,98.7,
           101.4,99.4,101.7,99,99.7,98.9,99.5,100,99.7,100.9,
           99.7,99,98.8,99.7,100.9,99.9,97.5,101.5,98.2,99.2,
           98.6,101.4,102.1,102.9,100.8,99.4,103.7,100.3,100.2,101.1,
           101.8,100,101.2,100.5,101.2,101.6,99.9,100.5,100.4,98.1,
           100.1,101.6,99.3,96.1,100,99.7,99.7,99.4,101.5,100.9,
           101.3,99.9,99.1,100.7,100.8,100.8,101.4,100.3,98.4,97.2)
summary(drink)


# 연속형 자료의 요약 - 점도표
# stripchart(x)
# x: 수치형 벡터
stripchart(drink,
           main = 'drink에 대한 점도표',
           pch = 16)


# 연속형 자료의 요약 - 히스토그램
# x: 히스토그램을 그릴 값의 벡터
# breaks: 구간을 나누는 기준(구간의 개수, 구간을 나누는 경계값)
# - breaks는 단일 value를 넣었을때 'pretty breakspoint'로 인식되어 
#       데이터의 전체 범위 중 n+1개의 적절한 구간을 나누려고 함.
#       이는 n을 입력해도 n개의 구간이 나오지 않을 수 있음.

# freq: 히스토그램을 그리는 기준(NULL 혹은 TRUE일 경우, 빈도수를 기준으로 그림)

# 빈도수 기준(3개의 코드 모두 같은 결과)
hist(drink)
hist(drink, freq = T)
hist(drink, prob = F)

# 밀도 기준(2개의 코드 모두 같은 결과)
hist(drink, freq = F)
hist(drink, prob = T)

# 원하는 개수의 Bar로 나타내기 ( 원하는 개수의 구간으로 나누어 그리기)
hist(drink, 
     breaks = seq(min(drink), max(drink), length.out=15),
     freq=T)



# 여러 개의 그림을 보고 싶을 때
par(mfrow = c(2,1)) # 2x1
par(mfrow = c(1,1)) # 1x1



# 연속형 자료의 요약 - 도수다각형
# lines(x, y=NULL,...)
# x: x축 좌표
# y: y축 좌표
# ...: 추가적인 그래프 파라미터

# 빈도 기준
hist <- hist(drink, freq = T)
hist
summary(hist)
lines(x = hist$mids,
      y = hist$counts,
      type = 'b',
      pch = 20, lty = 2)

# type b: line with point 
# type c: line without point

# 밀도 기준
hist <- hist(drink, prob = T)
hist
summary(hist)
lines(x = hist$mids,
      y = hist$density,
      type='b', pch=5)



# 연속형 자료의 요약 - 줄기-잎 그림
# stem(x)
# x: 수치형 벡터
stem(drink)
