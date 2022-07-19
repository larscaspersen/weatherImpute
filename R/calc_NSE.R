#' Calculate mean Nash - Sutcliffe Modelleing Efficiency Coefficient (NSE)
#' 
#' This function calculates the Nash - Sutcliffe Modelling Efficiency Coefficient
#' (NSE) for predicted and osberved values.
#' 
#' The higher the NSE, the better the model performance- THE NSE can range from
#' negative infinity to +1. It relates the magnitude of imputed data
#' variance compared to the variance in observed data.
#' 
#' @param predicted numeric vector containing predicted values
#' @param observed numeric vector containing observed values, should be of same
#' length as \code{predicted}
#' @param Boolean parameter indicating whether NA values should be removed before the analysis
#' @return numeric value of the NSE
#' @examples calc_NSE(predicted = 1:10, observed = 2:11)
#' @author Lars Caspersen, \email{lars.caspersen@@uni-bonn.de}
#' @export
calc_NSE <- function(predicted, observed){
  
  return(1-(sum((observed - predicted)^2) / (sum((observed - mean(observed, na.rm = T))^2))))
}