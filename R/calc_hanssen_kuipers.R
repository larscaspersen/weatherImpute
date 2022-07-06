#' Calculate Hansse-Kuipers discriminant
#' 
#' This function calculates Hanssen - Kuipers discriminant (HK), which is an 
#' evaluation metric especially suited for precipitation occurence.
#' 
#' The HK can range from -1 to 1, where a value close to one indicates good
#' model performance to predict precipitation occurence. #' 
#' 
#' Add citation
#' 
#' @param predicted numeric vector containing predicted values
#' @param observed numeric vector containing observed values, should be of same
#' length as \code{predicted}
#' @return numeric outcome of the Hansse - Kuipers discriminant
#' @examples calc_hanssen_kuipers(predicted = c(rep(0,5), rep(1, 5)), 
#' observed = c(0,0, 0, 1, 1, 1, 1, 0, 0, 0))
#' @author Lars Caspersen, \email{lars.caspersen@@uni-bonn.de}
#' @export
calc_hanssen_kuipers <- function(observed, predicted){
  
  #transform precipitation data to occurence data
  observed_occ <-  observed > 0
  predicted_occ <- predicted > 0
  
  #get confusuin matrix elements
  A <- sum(observed_occ == T & predicted_occ == T) / length(observed_occ)
  D <- sum(observed_occ == F & predicted_occ == F) / length(observed_occ)
  C <- sum(observed_occ == T & predicted_occ == F) / length(observed_occ)
  B <- sum(observed_occ == F & predicted_occ == T) / length(observed_occ)
  
  return( ((A*D)-(B*C))/((A+B)*(C+D)) )
}