# Artists data set downloaded from TidyTuesday GitHub:
# https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-01-17/artists.csv

# Load packages
library(tidyverse)

# Load downloaded csv file containing original data set
artists_raw <- read_csv("getting-started-datasets/artists/more-details/artists_raw.csv")

# Check for total NA values
sum(is.na(artists_raw)) # 58

# Copy a version to clean
artists <- artists_raw

# This dataset's columns are not organized as I'd like, but it's not enough
# to really need to change anything, so I'll use it as-is
# Save the cleaned data set as a csv
write_csv(artists, "getting-started-datasets/artists/artists.csv")

#Optional cleaning code once data object is loaded------------------------------
# If you want to better organize these columns so that like information is grouped
# together (book info vs artist info), run the below code in order to:

# -Relocate "book" to be before edition_number and year
# -And relocate artist_name to be just before artist_nationality
# -And artist_unique_id to be after artist_name
# -And artist_race_nwi to be after artist_race
# -Finally, move c(book, edition_number, year) down to be after artist info
artists <-
  artists |>
  relocate(book, .before = edition_number) |>
  relocate(artist_name, .before = artist_nationality) |>
  relocate(artist_unique_id, .after = artist_name) |>
  relocate(artist_race_nwi, .after = artist_race) |>
  relocate(c(book, edition_number, year), .after = artist_ethnicity)
