% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ann.R
\name{predict.ann}
\alias{predict.ann}
\title{Predict new examples using a trained neural network.}
\usage{
\method{predict}{ann}(object, newdata = NULL, derivs = FALSE, ...)
}
\arguments{
\item{object}{an object of class `ann' as returned by function \code{ann}.}

\item{newdata}{matrix, data frame or vector of input data.
A vector is considered to comprise examples of a single input or
predictor variable. If \code{x} is \code{NULL}, fitted outputs derived
from \code{object} will be returned.}

\item{derivs}{logical; should derivatives of hidden and output nodes be
returned? Default is \code{FALSE}.}

\item{\dots}{additional arguments affecting the predictions produced (not
currently used).}
}
\value{
if \code{derivs = FALSE}, a vector of predictions is returned.

Otherwise, a list with the following components is returned:
\item{values}{matrix of values returned by the trained ANN.}
\item{derivs}{matrix of derivatives of hidden (columns \code{1:object$size})
   and output (final column) nodes.}
}
\description{
Predict new examples using a trained neural network.
}
\details{
This function is a method for the generic function \code{predict()}
   for class `ann'. It can be invoked by calling \code{predict(x)} for an
   object \code{x} of class `ann'.

   \code{predict.ann} produces predicted values, obtained by evaluating the
   `ann' model given \code{newdata}, which contains the inputs to be used
   for prediction. If \code{newdata} is omitted, the
   predictions are based on the data used for the fit.

   Derivatives may be returned for sensitivity analyses, for example.
}
\examples{
## fit 1-hidden node `ann' model to ar9 data
data("ar9")
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]

fit <- ann(x, y, size = 1, act_hid = "tanh", act_out = "linear", rang = 0.1)

## get model predictions based on a new sample of ar9 data.
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]

sim <- predict(fit, newdata = x)

## if derivatives are required...
tmp <- predict(fit, newdata = x, derivs = TRUE)
sim <- tmp$values
derivs <- tmp$derivs
}
\seealso{
\code{\link{ann}}
}

