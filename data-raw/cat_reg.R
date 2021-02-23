## code to prepare `DATASET` dataset goes here

link <- "https://data.sunshinecoast.qld.gov.au/api/views/7f87-i6kx/rows.csv?accessType=DOWNLOAD" 

library(tidyverse)

Registered_Animals = readr::read_csv(link)%>%
  mutate(across(where(is.character), as.factor)) %>%
  filter(AnimalType == "Cat") %>%
  mutate(PrimaryColour = gsub('([[:upper:]])', ' \\1', PrimaryColour)) %>% 
  mutate(PrimaryColour = str_squish(PrimaryColour)) %>% 
  mutate(FirstColor = word(PrimaryColour, 1), 
         SecondColor = ifelse(is.na(word(PrimaryColour, 2)),
                              word(PrimaryColour, 1),
                              word(PrimaryColour, 2))) %>%
select(-PrimaryColour, -AnimalType, -SpecificBreed) %>%
rename(PrimaryColour = FirstColor, SecondaryColor = SecondColor) 


