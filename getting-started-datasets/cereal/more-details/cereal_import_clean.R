# Cereal data set downloaded from Kaggle:
# https://www.kaggle.com/datasets/crawford/80-cereals?resource=download

# Load packages
library(tidyverse)

# Load downloaded csv file containing original data set,
# NA values in original data are denoted by -1
cereal_raw <- read_csv("getting-started-datasets/cereal/more-details/cereal_raw.csv",
                       na = c("-1"))

# Check for total NA values
sum(is.na(cereal_raw)) # 4

# Copy a version to clean
cereal <- cereal_raw

# Change all "mfr" names to be more descriptive instead of just letters
cereal <- cereal |>
  mutate(mfr = case_when(
    mfr == "A" ~ "American Home Food Products",
    mfr == "G" ~ "General Mills",
    mfr == "K" ~ "Kelloggs",
    mfr == "N" ~ "Nabisco",
    mfr == "P" ~ "Post",
    mfr == "Q" ~ "Quaker Oats",
    mfr == "R" ~ "Ralston Purina"
  ))

# Change values in "type" column to hot and cold instead of c an h

cereal <- cereal |>
  mutate(type = case_when(
    type == "C" ~ "cold",
    type == "H" ~ "hot"
  ))

# Add unit of measure to the end of all nutrition column names

names(cereal) <-
  c("name", "mfr", "type", "calories", "protein_g", "fat_g", "sodium_mg",
    "fiber_g", "carbo_g", "sugars_g", "potass_mg", "vitamins_perc", "shelf",
    "weight_oz", "cups_per_serv", "rating")

# Remove the "rating" column because I don't have a record of what it means or
# where the values were taken from/calculated

cereal <-
  cereal |>
    select(-rating)

# Save the cleaned data set as a csv
write_csv(cereal, "getting-started-datasets/cereal/cereal.csv")
