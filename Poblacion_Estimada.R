##' ==========================================================================
##' POBLACION ESTIMADA POR COMUNA
##' 
##' Estimaciones y proyecciones 2002-2035, comuna y área urbana y rural
##' 
##' Source:
##' https://www.ine.cl/estadisticas/sociales/demografia-y-vitales/proyecciones-de-poblacion
##' ===========================================================================


library(pacman)
p_load(readxl,tidyverse)


pob_est <- read_excel("~/Downloads/estimaciones-y-proyecciones-2002-2035-comuna-y-área-urbana-y-rural15.xlsx")


pob_est <-
pob_est %>% 
  group_by(Comuna,`Area (1=Urbano 2=Rural)`) %>% 
  summarise(
    Pop_2002 = sum(`Poblacion 2002`),
    Pop_2003 = sum(`Poblacion 2003`),
    Pop_2004 = sum(`Poblacion 2004`),
    Pop_2005 = sum(`Poblacion 2005`),
    Pop_2006 = sum(`Poblacion 2006`),
    Pop_2007 = sum(`Poblacion 2007`),
    Pop_2008 = sum(`Poblacion 2008`),
    Pop_2009 = sum(`Poblacion 2009`),
    Pop_2010 = sum(`Poblacion 2010`),
    Pop_2011 = sum(`Poblacion 2011`),
    Pop_2012 = sum(`Poblacion 2012`),
    Pop_2013 = sum(`Poblacion 2013`),
    Pop_2014 = sum(`Poblacion 2014`),
    Pop_2015 = sum(`Poblacion 2015`),
    Pop_2016 = sum(`Poblacion 2016`),
    Pop_2017 = sum(`Poblacion 2017`),
    Pop_2018 = sum(`Poblacion 2018`),
    Pop_2019 = sum(`Poblacion 2019`),
    Pop_2020 = sum(`Poblacion 2020`),
    Pop_2021 = sum(`Poblacion 2021`),
    Pop_2022 = sum(`Poblacion 2022`),
  ) %>% 
  rename(
    Area = `Area (1=Urbano 2=Rural)`
  ) %>% 
  mutate(
    Area = factor(Area,levels = c(1,2),labels = c("Urbano","Rural"))
  ) %>% 
  pivot_longer(!c(Comuna,Area), names_to = "Anio", values_to = "PobEst") %>% 
  mutate(
    Anio = str_sub(Anio, start= -4),
    Anio = as.numeric(Anio),
    Comuna = as.character(Comuna)
    )


save(pob_est, file = "Poblacion_Estimada.RData")
