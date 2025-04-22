################################################################################
#Section 1: Introduction to Regression
#1.2. Correlation
################################################################################
library(tidyverse)
library(readxl)
library(HistData)
library(Lahman)
library(writexl)

data("GaltonFamilies")
#View(GaltonFamilies)
write_csv(GaltonFamilies, "data/galton.csv")
write_xlsx(GaltonFamilies, "data/galton.xlsx")


set.seed(1983)
galton_heights <- GaltonFamilies %>% 
  filter(gender=="male") %>% 
  group_by(family) %>% 
  sample_n(1) %>% 
  ungroup() %>% 
  select(father, childHeight) %>% 
  rename(son=childHeight)
#View(galton_heights)

galton_heights %>% 
  summarize(mean(father),
            sd(father),
            mean(son),
            sd(son))

galton_heights %>% 
  ggplot(aes(father, son)) +
  geom_point() + xlab("Father") +
  ylab("Son") +
  theme_bw()
ggsave("figs/fig7.png")

#Correlación
galton_heights <- GaltonFamilies %>% 
  filter(childNum==1 & gender =="male") %>% 
  select(father,childHeight) %>% 
  rename(son=childHeight)

galton_heights %>% summarize(cor(father,son))

# compute sample correlation
my_sample <- slice_sample(galton_heights, n = 25, replace = TRUE)

R <- my_sample %>% summarize(cor(father, son))

# Monte Carlo simulation to show distribution of sample correlation
B <- 1000
N <- 25
R <- replicate(B, {
  slice_sample(galton_heights, n = N, replace = TRUE) %>% 
    summarize(r=cor(father, son)) %>% .$r
})
data.frame(R) %>% ggplot(aes(R)) + geom_histogram(binwidth = 0.05, color = "black") +
  theme_bw()
ggsave("figs/fig8.png")
# expected value is the population correlation
mean(R)
# standard error is high relative to its size
sd(R)

# QQ-plot to evaluate whether N is large enough
data.frame(R) %>%
  ggplot(aes(sample = R)) +
  stat_qq() +
  geom_abline(intercept = mean(R), slope = sqrt((1-mean(R)^2)/(N-2))) +
  theme_bw()
ggsave("figs/fig9.png")

################################################################################
#Assessment: Correlation
#Question 7
Teams %>% filter(yearID%in%c(1961:2001)) %>% 
  summarize(cor(R/G,AB/G))
#Question 8
Teams %>% filter(yearID%in%c(1961:2001)) %>% 
  summarize(cor(E/G,W/G))
#Question 9
Teams %>% filter(yearID%in%c(1961:2001)) %>% 
  summarize(cor(X2B/G,X3B/G))
