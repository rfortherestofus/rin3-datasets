# Cereal data set downloaded from Kaggle:
# https://github.com/rfordatascience/tidytuesday/raw/master/data/2021/2021-05-18/survey.csv

# Load packages
library(tidyverse)

# Load downloaded csv file containing original data set,
survey_raw <- read_csv("getting-started-datasets/survey/more-details/ask_a_manager_survey_2021_raw.csv")

# Check for total NA values
sum(is.na(survey_raw)) # 80925

# Copy a version to clean
survey <- survey_raw

# Take a look at data and read data dictionary to understand fields
glimpse(survey)

# All dates are in the spring of 2021, between the end of April and beginning of May,
# So the timestamp field isn't helpful and can go
survey$timestamp <- NULL

# There are some free text fields that don't contain helpful info, and the other
# compensation field depends on the other currency field, which is rarely filled
# correctly, so we will just use the local currency salary (annual salary)
survey$currency_other <- NULL
survey$additional_context_on_income <- NULL
survey$additional_context_on_job_title <- NULL
survey$other_monetary_comp <- NULL

# How many unique values are there in categories?
map(survey[, c(1:3, 9:13)], n_distinct)
# $how_old_are_you
# [1] 7
#
# $industry # Lots of options! wow
# [1] 1069
#
# $job_title # This is free text
# [1] 12622
#
# $overall_years_of_professional_experience
# [1] 8
#
# $years_of_experience_in_field
# [1] 8
#
# $highest_level_of_education_completed
# [1] 7
#
# $gender
# [1] 6
#
# $race # Would require lots of prep to be more useful
# [1] 48

# Country and state are also free text, so we can't subset by them without major cleaning
# but it could be informational somehow

write_csv(survey, "getting-started-datasets/survey/survey.csv")
