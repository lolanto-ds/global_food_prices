# install.package("tidyvere") #one of the must have library
# install.packages("mapdata") #map data
# install.packages('countrycode') #continent information

library("tidyverse") # Import library
library("purrr")
library("mapdata")

## load the dataset from multiple csv

gfp <- dir("dataset", full.names = T) %>% map_df(read_csv)
head(gfp)
colnames(gfp)

## Create continent data

library('countrycode')
continent_data <- data.frame(country = unique(gfp$adm0_name))
head(continent_data)
continent_data$continent <- countrycode(sourcevar = df[, "country"],
                            origin = "country.name",
                            destination = "continent")

colnames(continent_data) <-c("adm0_name", "continent") #rename for left_join
gfp <- gfp %>% left_join(continent_data, by = "adm0_name")  

unique(gfp$continent) 
