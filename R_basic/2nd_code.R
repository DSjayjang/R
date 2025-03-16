# 변수 생성
a = 1
a <- 10
a <<- 100

# 변수 생성 규칙
변수 <- 1
name <- 2
name1 <- 3
name_2 <- 4
name.3 <- 5
.abc <- 6

# 생성이 불가한 변수명
.123 <- 20
1abc <- 30
_def <- 40

# 정수형과 실수형
int <- 3
real <- 3.5

# 출력
print(int)
print(real)

int2 <- 4 + 1
real2 <- 1.2 + 1.5

# 출력
print(int2)
print(real2)

int3 <- int + int2
real3 <- real + real2

# 출력
print(int3)
print(real3)

# 데이터 타입 확인
class(int)
class(real2)
is.numeric(int)
is.numeric(real2)


# 불리언 자료형
logical <- TRUE
logical2 <- T

print(logical)
print(logical2)

logical3 <- FALSE
logical4 <- F

print(logical3)
print(logical4)

# 데이터 타입 확인
class(logical2)
class(logical4)
is.logical(logical2)
is.logical(logical4)

class(logical3)
class(real)


# 문자 자료형
ch1 <- 'a'
ch2 <- "apple"

print(ch1)
print(ch2)

# 데이터 타입 확인
class(ch1)
class(ch2)
is.character(ch1)
is.character(ch2)


# 범주형 자료형
grade <- c('B0', 'C+', 'F', 'A+', 'A0', 'B+')

ft1 <- factor(x = grade) # 명목형
print(ft1)

ft2 <- factor(x = grade, ordered = TRUE) # 순서형
print(ft2)

lev <- c('F', 'C+', 'B0', 'B+', 'A0', 'A+')
ft3 <- factor(x = grade, levels = lev, ordered = TRUE) # 순서형
print(ft3)


# 벡터
vec1 <- c(1, 2, 3)
print(vec1)

vec2 <- c(1, 2, '3')
print(vec2)

class(vec1)
class(vec2)

vec3 <- vector()
vec3[1] <- 10
vec3[5] <- 2
print(vec3)

seq(11, 20)
seq(11, 20, length = 5)
seq(11, 20, by = 5)


# 데이터 타입 확인
int <- 3
str <- 'abc'
bool <- T

is.character(int)
is.numeric(str)
is.logical(bool)

# 데이터 타입 변경
as.numeric(str)
as.character(int)
as.numeric(bool)
as.character(bool)


# 사칙 연산
a <- 4; b <- 2;
c <- 2 + 3

a + b - c
a - b * c
a / c
a %/% c # 몫
a %% c # 나머지
a^c # 4^5

TRUE + TRUE
F - T


# 논리 연산자
A <- TRUE
B <- FALSE
C <- c(TRUE, TRUE)
D <- c(FALSE, TRUE)
E <- c(TRUE, FALSE)

A & B
A | B
A & C
C & D
C | E


# 비교 연산자
a <- c(1, 2)
b <- c(2, 2)
c <- c(3, 4)

a < b
a >= b
a == c
a != c

all(a != b)
all(a == b)
any(a == c)


# 객체 확인 및 제거
ls()
rm(list=ls())
