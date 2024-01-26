# Childcare costs data sets downloaded from Tidy Tuesday:
# https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-05-09/childcare_costs.csv
# https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-05-09/counties.csv

# Load packages
library(tidyverse)

# Load downloaded csv files containing original data sets
childcare_raw <- read_csv("getting-started-datasets/childcare/more-details/childcare_raw.csv")
counties <- read_csv("getting-started-datasets/childcare/more-details/counties.csv")

# Check for total NA values
sum(is.na(childcare_raw)) # 88636 total NA values

# Create a copy to clean for a beginner version of this data set (infant costs only)
childcare_infants <-
  childcare_raw |>
  select(county_fips_code, study_year, pr_f, pr_p,
         mhi_2018, total_pop, mc_infant, mfcc_infant)

# Rename the variables to be easily understood
names(childcare_infants) <-
  c("county_fips_code", "study_year", "poverty_families", "poverty_individuals",
    "median_income_2018", "total_population", "median_center_infant", "median_family_infant")

# Join counties data set so that we can have county and state names instead of codes
childcare_infants <-
  childcare_infants |>
  left_join(counties)

# Get rid of fips codes now
childcare_infants <-
  childcare_infants |>
  select(-county_fips_code)


# Save the infant childcare data set as a csv
 write_csv(childcare_infants, "getting-started-datasets/childcare/childcare_infants.csv")
