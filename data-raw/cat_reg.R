## code to prepare `DATASET` dataset goes here

library(tidyverse)
Registered_Animals = readr::read_csv("https://data.sunshinecoast.qld.gov.au/api/views/7f87-i6kx/rows.csv?accessType=DOWNLOAD")%>%
  mutate(across(where(is.character), as.factor))


usethis::use_data(DATASET, overwrite = TRUE)


