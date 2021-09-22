library(tidyverse)
library(dplyr)
library(readr)
greendb <- read_csv("D:/Математическое моделирование/greendb.csv")
View(greendb)
data = greendb
rad = data$d_trunk_m / 2
basal = rad*rad*pi
basal
data$basal = (data$d_trunk_m/2)*(data$d_trunk_m/2)*pi


#Задание 1. Посчитать объем ствола, в таблицe data создать
#колонку Vtrunk
vtrunk = data$basal*data$height_m
vtrunk
data$vtrunk = data$basal*data$height_m
#

unique(data$species_ru)
data$species_ru %>% unique
data$species_ru |> unique()

data$species_ru = factor(data$species_ru)
summary(data$species_ru)


sum_table = greendb %>% group_by(species_ru) %>%
  summarise(
    diam_m = mean(d_trunk_m, na.rm=T),
    num = n(),
    height_m = mean(height_m, na.rm=T)
  )
    