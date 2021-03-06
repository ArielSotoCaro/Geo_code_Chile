##' ============================================================================
##' 
##' MERGING ALL DATASETS OF GEOGRAFIC INFORMATION FOR CHILE
##' 
##' 
##' 
##' ============================================================================

library(pacman)
p_load(tidyverse,withr,readxl)


## DATA
load("~/Geo_code_Chile.RData")
load("~/AreaComuna.RData")
load("~/Comunas_Fronterizas.RData")
Regiones_orden <- read_excel("~/Downloads/Regiones_orden.xlsx") %>% select(-region_name)

## PREPARING

# AREA
Area$Comuna <- as.character(Area$Comuna)

mi_comuna <- 
  with_options(
    c(scipen = 999), 
    str_pad(Area$Comuna, 5, pad = "0")
  )

Area$Comuna <- mi_comuna

Area <- Area %>% select(-ComunaNombre)

# FRONTERIZA

mi_comuna <- 
  with_options(
    c(scipen = 999), 
    str_pad(fronteriza$CUT, 5, pad = "0")
  )

fronteriza$CUT <- mi_comuna

fronteriza <-
  fronteriza %>% 
  select(-c(Comuna,Provincia,Region))


## MERGING

CUT <- left_join(CUT,Area, by = c("Comuna_cod1" = "Comuna"))

CUT <- left_join(CUT,fronteriza, by = c("Comuna_cod1" = "CUT"))

CUT <- left_join(CUT,Regiones_orden, by = c("Region_cod2" = "original"))


## STORING

save(CUT,file = "GeoChileData.RData")
