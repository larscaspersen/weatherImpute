## code to prepare `weather_Tmin` dataset goes here
library(tidyverse)
# library(weatherQC)
# 
# target_weather <- read.csv('../weatherQC/data-raw/target-weather_cimis_2.csv')
# aux_weather <- chillR::load_temperature_scenarios(path = '../weatherQC/data-raw/',
#                                                   prefix = 'neighbour-weather')
# 
# #add target_weather to the list
# aux_weather <- c(aux_weather, list('cimis_2' = target_weather))
# 
# #read target and neighbour info and join them
# station_info <- read.csv('../weatherQC/data-raw/neighbour_info.csv')
# target_info <- read.csv('../weatherQC/data-raw/weather_info.csv')
# 
# station_info <- rbind(station_info, target_info)
# 
# #apply quality control after Durre on the weather data
# aux_weather <- weather_qc_durre(weather_list = aux_weather, weather_info = station_info,
#                  mute = F)
# 
# chillR::save_temperature_scenarios(aux_weather, path = 'data-raw/',
#                                    prefix = 'cleaned')

weather_list <- chillR::load_temperature_scenarios(path = 'data-raw/',
                                                   prefix = 'cleaned')


#take data.frames, drop everything except Day, Year, Month, Tmin; then merge
weather_Tmin <- purrr::map(weather_list, function(x){
  x[,c('Year', 'Month', 'Day', 'Tmin')] %>%
    filter(Year %in% c(1990, 1991)) %>%
    select(Tmin) %>%
    pull()
}) %>%
  cbind.data.frame()

date_df <- chillR::make_all_day_table(data.frame(Year = c(1990, 1991), Month = c(1,12), 
                                      Day = c(1,31), Tmin = NA, Tmax = NA),
                           no_variable_check = T)

weather_Tmin <- tibble::tibble(date_df[,c('Year', 'Month', 'Day')], weather_Tmin)

#add date
weather_Tmin <- weather_Tmin %>%
  dplyr::mutate(Date = as.Date(paste(Year, Month, Day, sep = "-"), format = "%Y-%m-%d")) %>%
  dplyr::relocate(Date)
  

usethis::use_data(weather_Tmin, overwrite = TRUE)
