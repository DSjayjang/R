library(dplyr)
library(tibble)

df <- USArrests

df <- scale(df) %>% as.data.frame()
boxplot(df)

df.rm.outlier <- df %>% rownames_to_column('rname') %>% 
  arrange(desc(`Rape`)) %>% 
  slice(-1:-2) %>% 
  column_to_rownames('rname')
boxplot(df.rm.outlier)


# 유사도 행렬 생성
df.dist <- dist(df.rm.outlier, method = "euclidean")


# 군집 구성 방식 선택
df.hclust.sing <- hclust(df.dist, method = "single")
df.hclust.cplt <- hclust(df.dist, method = "complete")
df.hclust.avg <- hclust(df.dist, method = "average")
df.hclust.cent <- hclust(df.dist, method = "centroid")
df.hclust.ward <- hclust(df.dist, method = "ward.D2")


# dendrogram 생성 & 군집 시각화
## single method
plot(df.hclust.sing, cex = 0.6, hang = -1)
rect.hclust(df.hclust.sing, k = 4, border = 2:5)

## complete method
plot(df.hclust.cplt, cex = 0.6, hang = -1)
rect.hclust(df.hclust.cplt, k = 4, border = 2:5)


## average method
plot(df.hclust.avg, cex = 0.6, hang = -1)
rect.hclust(df.hclust.avg, k = 4, border = 2:5)

# centroid method
plot(df.hclust.cent, cex = 0.6, hang = -1)
rect.hclust(df.hclust.cent, k = 4, border = 2:5)
            
# ward method
plot(df.hclust.ward, cex = 0.6, hang = -1)
rect.hclust(df.hclust.ward, k = 4, border = 2:5
