################################################################################
#Section 1: Introduction to Regression
#1.3: Stratification and Variance Explained
################################################################################
set.seed(1989, sample.kind="Rounding") #if you are using R 3.6 or later
library(HistData)
data("GaltonFamilies")

female_heights <- GaltonFamilies%>%     
  filter(gender == "female") %>%     
  group_by(family) %>%     
  sample_n(1) %>%     
  ungroup() %>%     
  select(mother, childHeight) %>%     
  rename(daughter = childHeight)

#View(female_heights)

female_heights %>% summarize(mean(mother),
                             sd(mother),
                             mean(daughter),
                             sd(daughter),
                             cor(mother,daughter))

lm(female_heights$daughter ~ female_heights$mother)

#What percent of the variability in daughter heights is explained by the mother's height?

#Rta: Será el R2

performance::performance(lm(female_heights$daughter ~ female_heights$mother))
#Alrededor del 10%

m <- lm(female_heights$daughter ~ female_heights$mother)
summary(m)


plot(female_heights$mother,female_heights$daughter)


