################################################################################
#Section 1: Introduction to Regression
#1.2. Correlation
################################################################################
library(tidyverse)
library(readxl)
library(HistData)

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
