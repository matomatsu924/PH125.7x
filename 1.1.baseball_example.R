################################################################################
#Section 1: Introduction to Regression
#1.1. Baseball as a Motiviting Example
################################################################################

library(Lahman)
library(tidyverse)
library(writexl)
#View(Teams)
write_csv(Teams, "data/Teams.csv")
write_xlsx(Teams, "data/Teams.xlsx")


#Relación entre HR y R por juego
Teams %>% filter(yearID%in%1961:2001) %>% 
  mutate(HR_per_game = HR/G,
         R_per_game=R/G) %>% 
  ggplot(aes(HR_per_game,R_per_game)) +
  geom_point(alpha=0.5) + 
  xlab("HR per game") + ylab("R per game") +
  theme_bw()
ggsave("figs/fig1.png")


#Relación entre SB y R por juego
Teams %>% filter(yearID%in%1961:2001) %>% 
  mutate(SB_per_game = SB/G,
         R_per_game = R/G) %>% 
  ggplot(aes(SB_per_game, R_per_game)) +
  geom_point(alpha=0.5) +
  xlab("SB per game") + ylab("R per game") +
  theme_bw()
ggsave("figs/fig2.png")

#Relación entre BB y R por juego
Teams %>% filter(yearID%in%1961:2001) %>% 
  mutate(BB_per_game = BB/G,
         R_per_game = R/G) %>% 
  ggplot(aes(BB_per_game, R_per_game)) +
  geom_point(alpha=0.5)+
  xlab("BB per game") + ylab("R per game") +
  theme_bw()
ggsave("figs/fig3.png")

#AB vs R per game

Teams %>% filter(yearID%in%1961:2001) %>% 
  mutate(AB_per_game = AB/G,
         R_per_game = R/G) %>% 
  ggplot(aes(AB_per_game, R_per_game)) +
  geom_point(alpha=0.5)+
  xlab("AB per game") + ylab("R per game") +
  theme_bw()

ggsave("figs/fig4.png")

#win rate vs fielding errors (E)
Teams %>% filter(yearID%in%1961:2001) %>% 
  mutate(win_rate = W/G,
         fielding_errors = E) %>% 
  ggplot(aes(fielding_errors, win_rate)) +
  geom_point(alpha=0.5)+
  ylab("Win rate") + xlab("Fielding Errors") +
  theme_bw()

ggsave("figs/fig5.png")

#Doubles per game vs triples per game
Teams %>% filter(yearID%in%1961:2001) %>% 
  ggplot(aes(X2B, X3B)) +
  geom_point(alpha=0.5)+
  ylab("Triples") + xlab("Doubles") +
  theme_bw()
ggsave("figs/fig6.png")
