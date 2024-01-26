# Bike share data set downloaded from UCI ML repository:
# https://archive.ics.uci.edu/dataset/275/bike+sharing+dataset

# Load packages
library(tidyverse)

# Load downloaded csv file containing original data set
bikeshare_raw <- read_csv("getting-started-datasets/bikeshare/more-details/bikeshare_raw.csv")

# Check for total NA values
sum(is.na(bikeshare_raw)) # 0

# Copy a version to clean, removing the date, temps, humidity, and windspeed
# while doing so because they're normalized
bikeshare <-
  bikeshare_raw |>
  select(-c(dteday, temp, atemp, hum, windspeed))

# Change abbreviated variable names to be the full word, for clarity and ease
names(bikeshare) <-
  c("index", "season", "year", "month", "holiday", "weekday",
    "workingday", "weather", "casual_users", "registered_users", "total_users")

# Change all numeric and binary encoded variables to be descriptive strings

# Change weather
bikeshare <-
  bikeshare |>
  mutate(weather = case_when(
    weather == 1 ~ "Clear to partly cloudy",
    weather == 2 ~ "Misty to misty with clouds",
    weather == 3 ~ "Light rain to thunderstorms or light snow",
    weather == 4 ~ "Heavy rain, ice, snow, or foggy thunderstorms"
))

# Change season
bikeshare <-
  bikeshare |>
  mutate(season = case_when(
    season == 1 ~ "winter",
    season == 2 ~ "spring",
    season == 3 ~ "summer",
    season == 4 ~ "fall"
  ))

# Change weekday
bikeshare <-
  bikeshare |>
  mutate(weekday = case_when(
    weekday == 0 ~ "Sunday",
    weekday == 1 ~ "Monday",
    weekday == 2 ~ "Tuesday",
    weekday == 3 ~ "Wednesday",
    weekday == 4 ~ "Thursday",
    weekday == 5 ~ "Friday",
    weekday == 6 ~ "Saturday"
  ))

# Change holiday, workingday, and year
bikeshare <-
  bikeshare |>
  mutate(holiday = ifelse(holiday == 1, "holiday", "nonholiday"),
         workingday = ifelse(workingday == 1, "workingday", "nonworkingday"),
         year = ifelse(year == 1, "2012", "2011"))

# Save the cleaned data set as a csv
write_csv(bikeshare, "getting-started-datasets/bikeshare/bikeshare.csv")


# Optional cleaning code once object is loaded##################################

# Run code below to make season, weekday, and weather into ordered factors
bikeshare <-
  bikeshare |>
  mutate(season = fct(season, levels = c("winter", "spring", "summer", "fall")),
         weekday = fct(weekday, levels = c("Monday", "Tuesday", "Wednesday",
                                           "Thursday", "Friday", "Saturday", "Sunday")),
         weather = fct(weather, levels = c("Clear to partly cloudy",
                                           "Misty to misty with clouds",
                                           "Light rain to thunderstorms or light snow",
                                           "Heavy rain, ice, snow, or foggy thunderstorms")))

# Run to make our two binary variables ordered factors so that they always show up
# with the "yes" version first, followed by the "no" version
bikeshare <-
  bikeshare |>
  mutate(holiday = fct(holiday, levels = c("holiday", "nonholiday")),
         workingday = fct(workingday, levels = c("workingday", "nonworkingday")))

# Make month and index into characters since they are non-mathematical numbers
bikeshare <-
  bikeshare |>
  mutate(index = as.character(index),
         month = as.character(month))
