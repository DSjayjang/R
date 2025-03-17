.libPaths()
Sys.which("make")
install.packages("dplyr", type = "source")

install.packages("remotes")
remotes::install_github("anthonynorth/rscodeio", force=TRUE)
remotes::install_github("gadenbuie/rsthemes", force=TRUE)

rsthemes::install_rsthemes()
getwd()
setwd("C:\\Programming\\R\\my_workspace")
getwd()

install.packages("SIS")


library(SIS)


getwd()
setwd('C:\\Users\\user\\Desktop\\수업\\석사 2차\\5. 기초통계실습1\\2. 강의자료')

# 행렬 (matrix)
## 데이터 정의
data <- c(1, 2, 3, 4, 5, 6)

# 행렬 생성
mat1 <- matrix(data, nrow = 2)
print(mat1)

mat2 <- matrix(data, nrow= 2, byrow = TRUE)
print(mat2)

mat3 <- matrix(data, ncol = 2)
print(mat3)

mat4 <- matrix(data, ncol = 2, byrow = TRUE)
print(mat4)


# 행렬의 이름 설정1
mat5 <- matrix(data, nrow = 2)
print(mat5)

rownames(mat5) <- c('r1', 'r2')
colnames(mat5) <- c('c1', 'c2', 'c3')
print(mat5)

# 행렬의 이름 설정2
rnames <- c('r1', 'r2')
cnames <- c('c1', 'c2', 'c3')

mat6 <- matrix(data, nrow = 2, dimnames = list(rnames))
print(mat6)



# 행렬 인덱싱
data <- c(1, 2, 3, 4, 5, 6)

mat1 <- matrix(data, nrow = 2)
print(mat1)

mat1[1, 1] # 1행 1열
mat1[1, 2] # 1행 2열
mat1[2, 1] # 2행 1열
mat1[2, 3] # 2행 3열

mat1[1, ] # 1행 전체 출력
mat1[, 2] # 2열 전체 출력

mat1[, c(1, 3)] # 1열, 3열 전체 출력

mat1[-2, ] # 2번째 행은 제외하고 출력



# 리스트 (list)
x <- list(name = 'foo', height = c(1, 3, 5))
x

# 리스트의 인덱스를 통해 (키, 값)에 접근
x[1] # 첫 번째 (키, 값)
x[2] # 두 번째 (키, 값)

# 리스트 key를 통해 value에 접근
x$name
x$height

# 리스트 key의 인덱스 통해 value에 접근
x[[1]]
x[[2]]
x[[2]][1]
x[[2]][2]


# 데이터 프레임 (data frame)
df <- data.frame(x = c(1, 2, 3, 4, 5),
                 y = c(2, 4, 6, 8, 10),
                 z = c('M', 'F', 'M', 'F', 'M'))
df
# 데이터 프레임의 차원 확인
dim(df) # 행, 열
nrow(df) # 행의 개수
ncol(df) # 열의 개수

# 데이터 프레임의 구조 확인
str(df)

# 데이터 프레임 인덱싱
df$x
df$y

df[1, ] # 1행
df[, 1] # 1열
