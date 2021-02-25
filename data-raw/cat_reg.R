## code to prepare `DATASET` dataset goes here

link <- "https://data.sunshinecoast.qld.gov.au/api/views/7f87-i6kx/rows.csv?accessType=DOWNLOAD"
library(tidyverse)

Registered_Animals = readr::read_csv(link)%>%
  mutate(across(where(is.character), as.factor)) %>%
  mutate(Name = as.character(Name)) %>%
  mutate(PrimaryColour = as.character(PrimaryColour)) %>%
   filter(AnimalType == "Cat") %>%
  mutate(PrimaryColour = ifelse(PrimaryColour == "TriColour", "Unknown", PrimaryColour)) %>%
   mutate(PrimaryColour = gsub('([[:upper:]])', ' \\1', PrimaryColour)) %>%
   mutate(PrimaryColour = str_squish(PrimaryColour)) %>%
   mutate(FirstColor = word(PrimaryColour, 1)) %>%
   mutate(SecondColor = case_when(PrimaryColour == "Unknown" ~ "Unknown",
                                  is.na(word(PrimaryColour, 2)) ~ "None",
                                  TRUE ~ word(PrimaryColour, 2))) %>%
  select(-AnimalType, -SpecificBreed, -PrimaryColour) %>%
  mutate(FirstColor = as.factor(FirstColor), SecondColor = as.factor(SecondColor)) %>%
  rename(PrimaryColor = FirstColor, SecondaryColor = SecondColor)

usethis::use_data(DATASET, overwrite = TRUE)


