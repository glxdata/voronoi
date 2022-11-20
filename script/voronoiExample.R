# load packages
library(tidyverse)
library(ggvoronoi)

# source: https://r-charts.com/part-whole/ggvoronoi/

# create data set

set.seed(1)
x <- sample(1:400, size = 100)
y <- sample(1:400, size = 100)
dist <- sqrt((x - 200) ^ 2 + (y - 200) ^ 2)

df <- data.frame(x, y, dist = dist)

df

# plot basic voronoi graph
ggplot(df, aes(x, y, fill = dist)) +
  geom_voronoi() +
  geom_point() 

# plot advanced voronoi graph
ggplot(df, aes(x, y, fill = dist)) +
 geom_voronoi() +
 stat_voronoi(geom = "path") +
 geom_point() +
 geom_point() + 
 annotate("point", x = 200, y = 200, shape = 10, size = 5) +
 scale_fill_viridis_c("Distance to center") +
 ggtitle("Voronoi example") +
 xlab("x-axis") +
 ylab("y-axis") + 
 theme_classic()




