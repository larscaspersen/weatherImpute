#' Tibble with daily precipitation observations for two years
#'
#' Tibble of daily weather observations of precipitation sum (mm) for 13 weather
#' stations in California taken from the CIMIS and UCIPM databases. Daily weather
#' observations go from 1st January 1990 to 31st December 1991. After obtaining the data via 
#' the chillR package (\code{\link[chillR]{handle_cimis}}, \code{\link[chillR]{handle_ucipm}}), 
#' the weather station observation was subject to quality control
#' with the weatherQC function \code{\link[weatherQC]{weather_qc_durre}}. This lead to the removal
#' of some erroneous observations.
#' 
#'
#' @format A tibble with 17 columns and 730 rows:
#' \describe{
#'   \item{Date}{Date}
#'   \item{Year}{Year}
#'   \item{Month}{Month}
#'   \item{Day}{Day}
#'   \item{cimis_15}{Daily Precip observed at CIMIS weather station Stratford, California}
#'   \item{cimis_39}{Daily Precip observed at CIMIS weather station Parlier, California}
#'   \item{cimis_7}{Daily Precip observed at CIMIS weather station Firebaugh/Telles, California}
#'   \item{cimis_80}{Daily Precip observed at CIMIS weather station Fresno State, California}
#'   \item{COALINGA.C}{Daily Precip observed at UCIPM weather station Coalinga, California}
#'   \item{CORCORAN.C}{Daily Precip observed at UCIPM weather station Corcoran Irrigation District, California}
#'   \item{FIVE_PTS.C}{Daily Precip observed at UCIPM weather station Five Points, California}
#'   \item{FRESNO.C}{Daily Precip observed at UCIPM weather station Fresno Yosemite International Airport, California}
#'   \item{HANFORD.C}{Daily Precip observed at UCIPM weather station Hanford, California}
#'   \item{MADERA.C}{Daily Precip observed at UCIPM weather station Madera, California}
#'   \item{PRIESTVY.C}{Daily Precip observed at UCIPM weather station Priest Valley, California}
#'   \item{VISALIA.C}{Daily Precip observed at UCIPM weather station Visalia, California}
#'   \item{cimis_2}{Daily Precip observed at CIMIS weather Five Points, California}
#' }
#' @usage data(weather_Precip)
#' @docType data
#' @source \url{https://cimis.water.ca.gov/} and \url{http://ipm.ucanr.edu/}
"weather_Precip"