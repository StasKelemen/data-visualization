library(dplyr)
library(ggplot2)
setwd("C:\Users\KLMN\Dropbox\University\3 курс\Візуалізація даних\labs\lab2")
movie_body_counts <- read.csv('filmdeathcounts.csv')
head(movie_body_counts)
str(movie_body_counts)
movie_body_counts$body_per_min <- movie_body_counts$Body_Count/movie_body_counts$Length_Minutes
ggplot(movie_body_counts, aes(x=Body_Count)) +
  geom_histogram(bins=20, color="grey", fill="lightblue")
movie_body_counts %>%
  top_n(n = 10, Body_Count) %>%
  arrange(desc(Body_Count))

movie_body_counts %>%
  top_n(n = 10, body_per_min) %>%
  arrange(desc(body_per_min))

ggplot(movie_body_counts, aes(x=IMDB_Rating)) +
  geom_histogram(bins=10, color="grey", fill="lightblue")

imdb_sd <- sd(movie_body_counts$IMDB_Rating)
print(imdb_sd)

movie_body_counts$IMDB_Rating


set.seed(900)
imdb_simulation <- rnorm(n=nrow(movie_body_counts), mean = imdb_mean, sd = imdb_sd)
movie_body_counts$imdb_simulation <- imdb_simulation
str(movie_body_counts)

ggplot(movie_body_counts, aes(x=imdb_simulation)) +
  geom_histogram(bins=10, color="grey", fill="lightblue")


ggplot(movie_body_counts, aes(sample = IMDB_Rating)) + stat_qq()


setwd("C:/Users/KLMN/Dropbox/University/3 курс/Візуалізація даних/labs/lab2")
birth <- read.csv('birth.csv')
birth <- select (birth, -c(X, date, year))
head(birth)
str(birth)
ggplot(birth, aes(x=births)) +
  geom_histogram(bins=20, color="grey", fill="lightblue")
birth %>%
  top_n(n = 10, births) %>%
  arrange(desc(births))



temp = aggregate(birth[, 1], list(birth$wday), mean)
temp2 = arrange(temp, desc(x))

ggplot(birth, aes(x=month)) +
  geom_histogram

births_mean <- mean(birth$births)
print(births_mean)

births_sd <- sd(birth$births)
print(births_sd)

set.seed(900)
births_simulation <- rnorm(n=nrow(birth), mean = births_mean, sd = births_sd)
birth$births_simulation <- births_simulation
str(birth)

ggplot(birth, aes(x=births_simulation)) +
  geom_histogram(bins=10, color="grey", fill="lightblue")

ggplot(birth, aes(sample = births_simulation)) + stat_qq()

ggplot(birth, aes(sample = births)) + stat_qq()





