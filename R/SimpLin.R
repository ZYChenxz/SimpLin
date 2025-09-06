#' Simple Linear Regression
#'
#' This function fits a simple linear regression model using RcppArmadillo.
#'
#' @param x A numeric vector of predictor values. Must not contain NA.
#' @param y A numeric vector of response values. Must not contain NA.
#'
#' @return A list object of class "SimpLin" containing the following components:
#' \item{coefficients}{A named vector of the estimated intercept and slope.}
#' \item{standard_errors}{A named vector of the standard errors for the coefficients.}
#' \item{confidence_intervals}{A matrix with row and column names containing the 95% confidence intervals.}
#' \item{residuals}{The model residuals.}
#' \item{predicted_values}{The fitted values from the model.}
#'
#' @export
#' @examples
#' x_vals <- 1:20
#' y_vals <- 3 * x_vals + rnorm(20)
#' model_fit <- SimpLin(x_vals, y_vals)
#' print(model_fit)
SimpLin <- function(x, y) {
  if (!is.numeric(x) || !is.vector(x)) {
    stop("Error: 'x' must be a numeric vector.")
  }
  if (!is.numeric(y) || !is.vector(y)) {
    stop("Error: 'y' must be a numeric vector.")
  }
  if (length(x) != length(y)) {
    stop("Error: 'x' and 'y' must be vectors of the same length.")
  }
  if (any(is.na(x)) || any(is.na(y))) {
    stop("Error: 'x' and 'y' must not contain NA values.")
  }
  if (length(x) < 3) {
    stop("Error: Not enough observations to fit the model.")
  }

  results <- SimpLinCpp(x, y)
  names(results$coefficients) <- c("Intercept", "Slope")
  names(results$standard_errors) <- c("Intercept", "Slope")
  rownames(results$confidence_intervals) <- c("Intercept", "Slope")
  colnames(results$confidence_intervals) <- c("Lower 2.5%", "Upper 97.5%")
  class(results) <- "SimpLin"
  return(results)
}
