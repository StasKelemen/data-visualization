#install.packages("dplyr")
#install.packages("ggplot2")

library(dplyr)
library(ggplot2)

setwd("C:/Users/KLMN/Dropbox/University/3 курс/Візуалізація даних/labs/lab1")
comps <- read.csv("comps.csv", stringsAsFactors=FALSE)
comps <- select (comps, -c(X, speed, premium, ads))
head (comps, 6)
head (comps, 15)
tail (comps, 6)
names(comps)
str(comps)
count(comps)
comps %>%
  filter(cd == "yes") %>%
  summarise(median(hd))
boxplot (price ~ trend,
        ylab = "trend",
        xlab = "price",
        main = "Залежність популярності від ціни",
        horizontal = TRUE,
        data = comps)
library(ggplot2)
ggplot(comps, aes(x=ram, y=price)) +
  geom_point()
ggplot(comps, aes(x=price)) +
  geom_histogram(breaks=seq(0, 6000, by = 500),
                 fill="lightblue",
                 col="grey") +
  ylab('Count')