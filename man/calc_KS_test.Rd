% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_KS_test.R
\name{calc_KS_test}
\alias{calc_KS_test}
\title{Return the p-value of the Kolmogorov - Smirnov test}
\usage{
calc_KS_test(predicted, observed)
}
\arguments{
\item{predicted}{numeric vector containing predicted values}

\item{observed}{numeric vector containing observed values, should be of same
length as \code{predicted}}
}
\value{
p-value of KS-test
}
\description{
This function carries out a Kolmogorov - Smirnov test and returns the test's p-value.
}
\details{
This function is a simple wrapper function for \code{\link{ks.test}}.
A two-sided KS-test is carried out and the p-value is returned. The KS-tests
nullhypothesis is, that predicted and observed values were drawn from the same
continuous distribution. NA values are silently omitted by the KS-test.
}
\examples{
calc_KS_test(predicted = 1:10, observed = 2:11)
}
\author{
Lars Caspersen, \email{lars.caspersen@uni-bonn.de}
}
