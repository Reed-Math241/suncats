
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this.  -->

# suncats <img src='https://i.imgur.com/bqEilMA.png' align="right" height="138.5" /></a>

`suncats` is a data package of the cats registered with the Sunshine
Coast region, Queensland, Australia from 2016-2021. The package is
collected and monthly updated by the Sunshine Coast Council.

### Usage

Assess the population of cats in Sunshine Coast region by name, gender,
age, breed, color and de-sexing for Sunshine Coast government policy and
identification.

### Format

A data frame with 9,919 rows (cats) and 8 variables

### Variables

Name, The given name of each registered Cat (Max, Spot, etc).  
Breed, The first listed breed of a cat (Tabby, Burmese, etc).  
PrimaryColor, the first listed color for each cat (Black, White, etc).
SecondaryColor, the first listed color for each cat (Grey, White,
etc).  
De-sexed, Whether or not the cat has been Spayed or Neutered (had its
reproductive organs removed in Yes or No.).  
Gender, listed gender of each cat (Male, Female). Locality, local
sunshine coast location name (Alexandra Headland, Yaroomba, etc.).  
Age, age of the cat at the time of registry.

### Installation

``` r
# Do the following once
# install.packages("devtools")

#Then install the package
devtools::install_github("Reed-Math241/suncats")
```

### Getting the data

``` r
# Load the library
library(suncats)

# To get data on all Tabby breed in Sunshine Coast from 2016 to 2021

Tabby <- suncats(name = "Tabby")

# To get data on multiple breeds 

two_breeds <- suncats(name = c("Tabby","Somali"))
```

### Source

URL
:<https://data.sunshinecoast.qld.gov.au/Administration/Registered-Animals/7f87-i6kx>.

### Additional Information

Person registering a cat needs to be over 18 years old.  
General pet registration information at Sunshine
Coast:<https://www.sunshinecoast.qld.gov.au/Pay-and-Apply/Cat-and-Dog-Registration/General-Registration-Information>.
