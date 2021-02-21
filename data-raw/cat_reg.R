## code to prepare `DATASET` dataset goes here

library(tidyverse)

Registered_Cats <- readr::read_csv("https://data.sunshinecoast.qld.gov.au/api/views/7f87-i6kx/rows.csv?accessType=DOWNLOAD")%>%
  mutate(across(where(is.character), as.factor)) %>% 
  mutate(AnimalType = str_replace_all(AnimalType, " ", "")) %>% 
  filter(AnimalType == "Cat") %>% 
  select(-SpecificBreed) %>% 
  mutate(PrimaryColour = gsub('([[:upper:]])', ' \\1', PrimaryColour)) %>%
  mutate(FirstColour = gsub("([A-Za-z]+).*", "\\1", PrimaryColour)) %>% 

Registered_Cats

mutate(CRASH_MO_NO_SEA = case_when(CRASH_MO_NO == "01" ~ "Winter", 

usethis::use_data(DATASET, overwrite = TRUE)


