% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/patch_flexible_several_stations.R
\name{patch_flexible_several_stations}
\alias{patch_flexible_several_stations}
\title{Patch several weather stations at the same time}
\usage{
patch_flexible_several_stations(
  weather,
  target,
  weather_info,
  method = "patch_mean",
  additional_input = NULL,
  method_patches_everything = F
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

\item{method}{character, exact name of the patching function, needs to be 
present in the workspace}

\item{additional_input}{list with all the other arguments required by the
patching function. elements of list need to have same name as arguments
of the patching function}

\item{method_patches_everything}{flag, indicates if the method returns all
weather stations or just the target station. This flag is included, so that
patch_flexible_several_stations is also compatible with patching methods
like patch_mice or patch_amelia, which return all patched weather stations
at one function call}
}
\value{
same data.frame with column Date and patched weather data of weather stations
specified in \code{target}. There can be still cases of NA, if for a certain
observation none of the other stations had valid observations
}
\description{
This is a wrapper function for patching methods, which only can patch one 
station at a time.
}
\details{
The advantage of this function is, that it can be also used for patching
methods not supplied by the weatherImpute package. The only demands the 
function does, is that the arguments "weather", "target" and "weather_info"
must be used by the user-defined patching function.
}
\examples{
patch_flexible_several_stations(weather = weather_Tmin, target = c('cimis_2', 'cimis_15'),
weather_info = weather_info,
method = 'patch_normal_ratio', method_patches_everything = F)
}
\author{
Lars Caspersen, \email{lars.caspersen@uni-bonn.de}
}
