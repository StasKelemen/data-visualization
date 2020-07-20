library(ggplot2)
library(lubridate)

setwd("C:/Users/KLMN/Dropbox/University/3 курс/Візуалізація даних/labs/lab4")
temp <- read.csv('bike.csv')
vector <- c('dteday', 'holiday', 'weekday', 'workingday', 'windspeed', 'cnt')
bikes <- temp[vector]
head(bikes)
bikes$dteday <- as.Date(bikes$dteday, format='%Y-%m-%d')
str(bikes)

ggplot(bikes, aes(dteday, cnt)) +
geom_line(alpha = 0.5) +
labs(title = "Прокат велосипедів",
x = "Дата",
y = "Кількість") +
geom_point(data = bikes[bikes$workingday == 1, ], color = "red") +
geom_smooth()

vuh = mean(bikes$cnt[bikes$workingday == 0])
vuh
bud = mean(bikes$cnt[bikes$workingday == 1])
bud

n <- length(bikes$cnt[bikes$workingday == 0])
n
s <- sd(bikes$cnt[bikes$workingday == 0])
s

p_value <- 2*pt(-1.886, df=230, lower.tail = TRUE)
p_value
t.test(bikes$cnt[bikes$workingday == 0], alternative ="two.sided", mu=4584.82, conf.level =0.90)

bikes
ggplot(data=bikes, aes(x=weekday, y=cnt)) + geom_bar(stat="identity", fill="lightblue")