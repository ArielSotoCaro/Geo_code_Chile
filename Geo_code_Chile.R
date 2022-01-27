library(readxl)
library(tidyverse)

CUT <- read_excel("Downloads/CUT_2018_v04.xls")


CUT <-
CUT %>% 
  rename(
    Region_cod1 = `Código Región`,
    Region_name1 = `Nombre Región`,
    Provincia_cod1 =  `Código Provincia`,
    Provincia_name1 =  `Nombre Provincia` ,
    Comuna_cod1 = `Código Comuna 2018`,
    Comuna_name1 = `Nombre Comuna` 
  ) %>% 
  mutate(
    Region_cod2 = as.numeric(Region_cod1),
    Provincia_cod2 = as.numeric(Provincia_cod1),
    Comuna_cod2 = as.numeric(Comuna_cod1)
  )


sin_tilde <- function(x){
x <- iconv(x, from="UTF-8" , to="ASCII//TRANSLIT")
x <- str_replace_all(x, "'", "")
x <- str_replace_all(x, "~", "")
x <- str_replace_all(x, '"', "")
return(x)
}


sin_tilde(CUT$Region_name1)

CUT <- 
CUT %>% 
  mutate(
    Region_name2 = sin_tilde(Region_name1),
    Provincia_name2 = sin_tilde(Provincia_name1),
    Comuna_name2 =sin_tilde(Comuna_name1)
  )

CUT <- 
CUT %>% 
  mutate(
    Region_name2_simple = case_when(
      Region_name2 == "Arica y Parinacota"  ~ "Arica",
      Region_name2 ==  "Metropolitana de Santiago" ~ "Metropolitana",
      Region_name2 == "Libertador General Bernardo OHiggins" ~ "OHiggins",
      Region_name2 == "Magallanes y de la Antartica Chilena" ~ "Antartica",
      Region_name2 == "Aysen del General Carlos Ibanez del Campo" ~ "Aysen",
      Region_name2 == "La Araucania" ~ "Araucania",
      TRUE ~ Region_name2
    )
  )


save(CUT, file = 'Geo_code_Chile.RData')
