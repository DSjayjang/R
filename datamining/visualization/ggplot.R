# 라이브러리
library(tidyverse)
library(ggplot2)

# 내장데이터 
df <- anscombe

# 데이터 정리
## tidy format으로 변환하기
df_tidy <- df %>%
  mutate(obs = row_number()) %>%
  pivot_longer(cols = -obs,
               names_to = "key",
               values_to = "value")

### key열을 영어와 숫자 분리하기
df_tidy <- df_tidy %>%
  separate_wider_position(cols = key, widths = c(variable = 1, set = 1))


## untidy format으로 변환하기
df_tidy <- df_tidy %>%
  pivot_wider(names_from = variable, values_from = value)


### 한번에 표현하기
df_tidy <- df %>%
  mutate(obs = row_number()) %>%
  pivot_longer(cols = -obs,
               names_to = "key",
               values_to = "value") %>%
  separate_wider_position(cols = key,
                          widths = c(variable = 1, set = 1)) %>%
  pivot_wider(names_from = variable,
              values_from = value)




# 통계값 추출
df_tidy %>%
  group_by(set) %>%
  summarize(mean_x = mean(x),
            mean_y = mean(y),
            var_x = var(x),
            var_y = var(y),
            sd_x = sd(x),
            sd_y = sd(y),
            cor = cor(x, y)
  )


# 그래프 생성
df_tidy %>%
  ggplot(aes(x,y)) +
  geom_point() +
  facet_wrap(~ set, ncol = 2) +
  geom_smooth(method = "lm", se = F)


## end of scrips ####