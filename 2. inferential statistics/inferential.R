install.packages("ggplot2")

library(ggplot2)

ggplot(data.frame(x =c(-3,3)), aes(x)) +
  geom_vline(xintercept =-1.74, linetype=2, colour="blue") +
  stat_function(fun =dnorm, colour="blue") +
  geom_area(stat ="function", fun =dnorm, fill ="red", xlim =c(-1.74,3)) 

pnorm(-2)
