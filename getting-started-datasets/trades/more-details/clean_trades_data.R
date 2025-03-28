library(dplyr)
library(readr)
library(lubridate)

trades_data_raw <- read_csv("https://huggingface.co/datasets/AYUSHKHAIRE/real-time-stocks-data/resolve/main/stocks.csv")


# Subset data -------------------------------------------------------------

trades_data <- trades_data_raw |> 
  mutate(timestamp = as.Date(timestamp, format = "%Y-%m-%d")) |> 
  rename("ID" = "...1")

# Randomly select 100 rows for different years

trades_per_day <- function(year) {
  trades_data |>
   filter(year(timestamp) == year) |>
   group_by(stockname, timestamp) |>
   summarise(open = mean(open), 
             high = mean(high), 
             low = mean(low), 
             close = mean(close), 
             volume = sum(volume)) |> 
    ungroup()
}

trades_data_2025 <- trades_per_day(2025)
trades_data_2024 <- trades_per_day(2024)

write_csv(trades_data_2025, "trades_data_2025.csv")
write_csv(trades_data_2024, "trades_data_2024.csv")



