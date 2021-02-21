## code to prepare `DATASET` dataset goes here

library(tidyverse)

Registered_Cats <- readr::read_csv("https://data.sunshinecoast.qld.gov.au/api/views/7f87-i6kx/rows.csv?accessType=DOWNLOAD")%>%
  mutate(across(where(is.character), as.factor)) %>% 
  mutate(AnimalType = str_replace_all(AnimalType, " ", "")) %>% 
  filter(AnimalType == "Cat") %>% 
  select(-SpecificBreed) %>% 
  mutate(PrimaryColour1 == case_when("GreyWhite" == "Grey")) %>% 
  mutate()
Registered_Cats


usethis::use_data(DATASET, overwrite = TRUE)


