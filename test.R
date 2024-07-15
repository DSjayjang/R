library(dplyr)

file_path = 'C:\\Users\\윤석\\Desktop\\패스트캠퍼스\\[패스트캠퍼스] 파이썬을 활용한 데이터 전처리 Level UP\\Part 2. 탐색적 데이터 분석\\데이터\\성인여성_키_데이터.txt'

data = read.csv(file_path, header=F)
data

# 단일표본 t검정
t.test(data, mu = 163)

# 독립표본 t검정
file_path = 'C:\\Users\\윤석\\Desktop\\패스트캠퍼스\\[패스트캠퍼스] 파이썬을 활용한 데이터 전처리 Level UP\\Part 2. 탐색적 데이터 분석\\데이터\\'
file_name = '반별_점수_type1.csv'
file = paste0(file_path, file_name)
file
data1 = read.csv(file, header = TRUE, fileEncoding = 'cp949')
data1


group_A
group_B

# 등분산 검정
library(car)

leveneTest(점수~factor(반), data=data1)
var.test(data1[data1$반=='A',2],data1[data1$반=='B',2])

var.test(group_A$점수, group_B$점수)
t.test(group_A, group_B, var_equal=TRUE)
t.test(점수~factor(반), data=data1, var_equal=TRUE)

# 쌍체표본 t검정

file_name = '다이어트약_효과검증.csv'
file = paste0(file_path, file_name)
data = read.csv(file)
data

# 정규성 검정
shapiro.test(data$다이어트전.kg.-data$다이어트후.kg.)


# 쌍체표본 t검정
t.test(data$다이어트전.kg., data$다이어트후.kg., paired=TRUE)
