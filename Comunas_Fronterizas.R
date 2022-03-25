library(readxl)
library(tidyverse)

Comunas_Fronterizas_Chile <- 
  read_excel("Downloads/Comunas_Fronterizas_Chile.xlsx")


fronteriza <-
Comunas_Fronterizas_Chile %>% 
  mutate(
    Fronteriza = factor(
    Fronteriza,
    levels = c("TF","PF","NF"),
    labels = c("Totalmente fronteriza","Parcialmente fronteriza","No fronteriza")))


save(fronteriza,file = "Comunas_Fronterizas.RData")  
