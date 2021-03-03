## code to prepare `DATASET` dataset goes here

link <- "https://data.sunshinecoast.qld.gov.au/api/views/7f87-i6kx/rows.csv?accessType=DOWNLOAD"

fullnames <- c("Abyssinian", "American Curl", "Australian Mist", "Australian Mist", "Balinese", "Bengal", "Birman", "Bombay", "British Longhair", "British Shorthair", "Burmese", "Burmilla", "Cat", "Cheetoh", "Chinchilla", "Devon", "Domestic Longhair", "Domestic Mediumhair", "Domestic Shorthair", "Egyptian", "Exotic", "Himalayan", "Japanese", "Korat", "LaPerm", "Maine Coon", "Manx", "Munchkin", "Norwegian", "Ocicat", "Oriental", "Persian", "Ragdoll", "Russian", "Scottish Fold", "Selkirk", "Cymric", "Siamese", "Singapura", "Snowshoe", "Somali", "Sphynx", "Tabby", "Tiffany", "Tonkinese", "Turkish Angora", "Turkish Van")


library(tidyverse)

suncats = readr::read_csv(link)%>%
  mutate(across(where(is.character), as.factor)) %>%
  mutate(Name = as.character(Name)) %>%
  filter(AnimalType == "Cat") %>%
  mutate(PrimaryColour = gsub('([[:upper:]])', ' \\1', PrimaryColour)) %>%
  mutate(PrimaryColour = str_squish(PrimaryColour)) %>%
  mutate(Locality = str_to_title(Locality)) %>%
  mutate(PrimaryBreed = str_to_title(PrimaryBreed)) %>%
  mutate(PrimaryBreed = ifelse(PrimaryBreed == "Cat", "Unknown", PrimaryBreed)) %>%
  mutate(PrimaryBreed = as.factor(PrimaryBreed)) %>%
  mutate(FirstColor = word(PrimaryColour, 1)) %>%
  mutate(FirstColor = ifelse(FirstColor %in% c("Tri", "Tricolour", "Multicol", "Paint", "Other"), "Unknown", FirstColor)) %>%
  mutate(SecondColor = case_when(is.na(word(PrimaryColour, 2)) ~ "None",
                                 PrimaryColour == "Unknown" ~ "Unknown",
                                 TRUE ~ word(PrimaryColour, 2))) %>%
  mutate(FirstColor = ifelse(FirstColor %in% c("Brindle", "Brindl"), "Brindle", FirstColor)) %>%
  mutate(SecondColor = case_when(SecondColor %in% c("Blac", "Black", "Blak") ~ "Black",
                                 SecondColor %in% c("Bro", "Brown") ~ "Brown",
                                 SecondColor %in% c("Brin", "Brind") ~ "Brindle",
                                 SecondColor %in% c("Whit", "White", "Wht") ~ "White",
                                 SecondColor %in% c("Colour", "Dk") ~ "Unknown",
                                 SecondColor == "Ging" ~ "Ginger",
                                 SecondColor == "Apric" ~ "Apricot",
                                 TRUE ~ SecondColor)) %>%
  select(-AnimalType, -SpecificBreed, -PrimaryColour) %>%
  mutate(FirstColor = as.factor(FirstColor), 
         SecondColor = as.factor(SecondColor)) %>%
  rename(PrimaryColor = FirstColor, SecondaryColor = SecondColor, Breed = PrimaryBreed) 

for (i in 1:nlevels(as.factor(suncats$Breed))){
  levels(suncats$Breed)[i] = fullnames[i]
}

suncats <- suncats %>%
  mutate(Breed = as.character(Breed)) %>%
  mutate(Breed = ifelse(Breed %in% c("Cat", "Exotic"), "Unknown", Breed)) %>%
  mutate(Breed = ifelse(Breed == "Baline", "Balinese", Breed)) %>%
  mutate(Breed = as.factor(Breed))

usethis::use_data(suncats, overwrite = TRUE)

