# load packages
library(tidyverse)
library(ggvoronoi)

# source: https://r-charts.com/part-whole/ggvoronoi/

# create data set

set.seed(1)
x <- sample(1:400, size = 100)
y <- sample(1:400, size = 100)

# calculate the distance between to points
# formula: sqrt((X2-X1)^2  + (Y2-Y1)^2)
# example: the distance between point A with x and y coordinates (-4,9) and point B with x and y coordinates(-5,3)
# sqrt((-5 - -4)^2  + (3 - 9)^2)
# sqrt(1 + 36) =  sqrt(37) = 6.08
# calculate distance to the center with x and y coordinates (200, 200) 
dist <- sqrt((x - 200) ^ 2 + (y - 200) ^ 2) 

# create a data frame
df <- data.frame(x, y, dist = dist)

# view the data frame
df
View(df)
summary(df)

# plot basic voronoi graph
ggplot(df, aes(x, y)) +
  geom_voronoi() + # overlay the voronoi cells    
  geom_point() 
    
# plot basic voronoi graph with a color scale for the distance of the values to the center
ggplot(df, aes(x, y, fill = dist)) +
  geom_voronoi() +
  geom_point() 
  
# plot advanced voronoi graph
ggplot(df, aes(x, y, fill = dist)) +
  geom_voronoi() +
  geom_point() +
  stat_voronoi(geom = "path") + # accentuate region borders
  annotate("point", x = 200, y = 200, shape = 10, size = 5) + # add a symbol at the center 
  scale_fill_viridis_c("Distance to center") + # colorblind friendly
  ggtitle("Voronoi example") +
  xlab("x-axis") +
  ylab("y-axis") + 
  theme_classic()



