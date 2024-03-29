% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/patch_forest.R
\name{patch_forest}
\alias{patch_forest}
\title{Impute gaps in daily weather data using random forest method}
\usage{
patch_forest(
  weather,
  target,
  weather_info,
  rain_data = F,
  prcp_threshold = 1,
  n_donors = 5,
  donor_criterion = "closest",
  max.iter = 5
)
}
\arguments{
\item{weather}{data.frame with columns for each weather station and rows for
each daily observation. All columns need to contain observations of the same
variable. Missing observations need to be marked with NA}

\item{target}{character, column name in weather, on which the method should be applied}

\item{weather_info}{data.frame containing the name / id of the weather station (needs
to be the same as the column names in weather), Longitude and Latitude in
decimal format}

\item{rain_data}{logical, in case precipitation data should be patched the 
mice package allows to at first decide if precipitation occures and in a
second step to patch precipitation amount only in cases where the patching
algorithm expects precipitation to happen.}

\item{prcp_threshold}{numerical, setting the threshold until which
precipitation amount the algorithm treats observations are real precipitation
events. Values below are treated as zeros}

\item{n_donors}{amount of auxiliary observations used to fill the gap, by default 5}

\item{donor_criterion}{character, method used to select donors, if there they are
in excees available. Valid options are "closest" and "correlation"}

\item{max.iter}{maximum amount of iterations of the multiple imputation algorithm,
default is 5}
}
\value{
vector, containing the imputed weather observations of target station.It is
still possible, that cases of NA remain for days none or not enough neighboring stations
had observations available
}
\description{
Takes data.frame of daily weather data of several neighboring weather stations
and imputes gaps with random forest method of the missforest package.
}
\details{
For more details of the function please refer to \code{\link[missForest]{missForest}}
}
\examples{
patch_forest(weather = weather_Tmin, 
target = 'cimis_2',
weather_info = weather_info)
}
\author{
Lars Caspersen, \email{lars.caspersen@uni-bonn.de}
}
