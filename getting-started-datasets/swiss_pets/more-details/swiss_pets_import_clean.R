# Swiss pets data set downloaded from Jadey Ryan's GitHub:
# https://github.com/jadeynryan/parameterized-quarto-workshop/blob/main/data/pets.RDS

# Load packages
library(tidyverse)

# Load downloaded csv file containing original data set
pets_raw <- readRDS("getting-started-datasets/swiss_pets/more-details/pets.RDS")

# Check for total NA values
sum(is.na(pets_raw)) # 7335

# Remove "date" column while copying data set, leave year and month for plotting
swiss_pets <-
  pets_raw |>
  select(-date)

# Save final data set
write_csv(swiss_pets, "getting-started-datasets/swiss_pets/swiss_pets.csv")
