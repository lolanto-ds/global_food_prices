# install.package("tidyvere")

library("tidyverse") # Import library

gfp <- read.csv("wfp_food_prices_database.csv") # Orginal file was too large



# Split large file by row in multiple .csv


x <- 1 
y <-100000 # row number
chunck <- y

for (i in 1:15){
  gfp[x:y,] %>% write.csv(paste0("food_prices",i,".csv"))
  x <- x + chunck
  y <- y + chunck
}

gfp[1500001:1560551,] %>% write.csv("food_prices16.csv")

test1 <- read_csv("food_prices16.csv")
tail(test1)
