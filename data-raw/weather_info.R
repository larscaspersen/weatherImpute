## code to prepare `weather_info` dataset goes here

#read target and neighbour info and join them
station_info <- read.csv('../weatherQC/data-raw/neighbour_info.csv')
target_info <- read.csv('../weatherQC/data-raw/weather_info.csv')

weather_info <- rbind(station_info, target_info)

usethis::use_data(weather_info, overwrite = TRUE)
