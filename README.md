# Geo_code_Chile
Geographic codes for administrative areas in Chile.

## Source
Subdere (https://www.subdere.gob.cl/documentacion/c%C3%B3digos-%C3%BAnicos-territoriales-actualizados-al-06-de-septiembre-2018)

## Downloading dataset

```
library(repmis)

url_dta <- "https://github.com/ArielSotoCaro/Geo_code_Chile/blob/main/Geo_code_Chile.RData"
rawGit <- "?raw=True"
source_data(paste(url_dta,rawGit,sep = ""))
rm(rawGit,url_dta)
```


## Example
Working only with regions

```
my_regions <- 
CUT %>%
  select(Region_cod1,Region_cod2,Region_name1,Region_name2,Region_name2_simple) %>% 
  distinct()
````
