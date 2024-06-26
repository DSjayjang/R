rm(list=ls())

library(stringr)


# 문자열 길이
string1 <- c('Data12', 'daFt', 'YouTube is fun', 'channel', 'WoW are you a student?')

str_length(string1)

str_length('abcdefg!!!')


# 대소문자 변경
## 대문자로
str_to_upper(string1)

## 소문자로
str_to_lower(string1)

## 문장의 첫 알파벳들을 대문자로
str_to_title(string1)

## 문장의 첫 문자만 대문자로
str_to_sentence(string1)


# 공백 제거/추가
## 공백 제거
str_trim("  d ! ")

## 공백 추가
### width : 공백 포함 문자열의 총 길이 지정
### side : 공백을 어느 방향에 넣을지 ("left" / "right" / "both")
str_pad('pad this', width = 15, side = 'both')


# 문자열 자르기
str_trunc('hi how are you i am fine thank you and you?', width = 30)


# 문자열 통합/분할
str_split('split this', pattern = ' ')

str_c('join', 'this', sep = "_")
str_c(c('join', 'this'), c('club', 'book'), sep = ".")

str_c(c('turn', 'me'), collapse = ' ')

## 결측치 NA를 문자열로 대체
str_replace_na(c('make', NA, 'string!'))



# 문자열 정렬
string2 <- c('sort', 'this', 'now')

str_order(string2)

## 오름차순
str_sort(string2)

## 내림차순
str_sort(string2, decreasing = T)


# 삽입
first <- c('jihyun', 'inna', 'suhyun')
last <- c('jeon', 'ryu', 'kim')

str_glue('my name is {first}. {first} {last}')

min_age <- 18
over_min <- c(5, 1, 7)

str_glue('{first} {last} is {min_age + over_min} years old')


# 문자열 매치
data1 <- data.frame(author = c('kim', 'banana', 'cereal'),
                    message = c('apple was good but i like banana more. can i buy banana milk?', 'the apples were big, the banana was green. i will not buy the banana', 'i went to the grocery store'))

data1

# T/F 반환
str_detect(data1$message, pattern = 'banana')


idx <- str_which(data1$message, pattern = 'banana')
data1$message[idx]

str_count(data1$message, 'banana')

str_locate(data1$message, 'banana')
str_locate_all(data1$message, 'banana')

str_extract(data1$message, 'banana|big|the')
str_extract_all(data1$message, 'banana|big|the')


# 문자열 자르기
str_subset(data1$message, pattern = 'banana')

str_sub(data1$message[1], start = 1, end = 5) <- str_to_upper(str_sub(data1$message[1], start = 1, end = 5))


# 문자열 대체
str_replace(data1$message[1], pattern = 'banana', replacement = 'kiwi')
str_replace_all(data1$message[1], pattern = 'banana', replacement = 'kiwi')


## end of scripts ####