##' ============================================================================
##' CLASIFICACION COMUNAS: AREA RURAL O URBANA
##' 
##' 
##' Source: https://www.masvidarural.gob.cl/ruralidad-en-chile/
##' 
##' ============================================================================



# Las comunas predominantemente rurales se definen como aquellas en que más
# de un 50% de la población vive en distritos censales de densidad menor 
# a 150 hab./km2.

# Las comunas mixtas se definen como aquellas en que entre un 25% y un 49% de
# la población vive en distritos censales de densidad menor a 150 hab./km2.
 
# Las comunas predominantemente urbanas se definen como aquellas en que menos
# de un 25% de la población vive en distritos censales de densidad menor a
# 150 hab./km2.


library(readxl)
library(tidyverse)

Area <- read_excel("Downloads/Clasificacion-comunas-PNDR.xlsx")


Area <-
Area %>% 
  select(
    cod_com,Comuna,Km.2,Densidad,`N° Habitantes`,Tipo_com
  ) %>% 
  rename(
    Comuna = cod_com,
    ComunaNombre = Comuna,
    Km2 = Km.2,
    Densidad2017 = Densidad,
    Poblacion2017 = `N° Habitantes`,
    Area = Tipo_com
  ) %>% 
  mutate(
    Area = factor(Area, levels = c(1,2,3),labels = c("Urbano","Mixto","Rural"))
  )


# ---
save(Area,file = "AreaComuna.RData")
# ---