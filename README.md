# SimpLin

The goal of SimpLin is to provide a fast and simple tool for fitting simple linear regression models, powered by a C++ backend using RcppArmadillo. This package was created as part of the STAT 600 Statistical Computing course at CSU.

# Installation
You can install the development version of SimpLin from GitHub with:

library(devtools)

install_github("ZYChenxz/SimpLin")

# Example
Here is a basic example of how to use the SimpLin() function to fit a model:

library(SimpLin)

set.seed(600) 

x_vals <- 1:20

y_vals <- 3 * x_vals + rnorm(50)

model_fit <- SimpLin(x_vals, y_vals)

print(model_fit)

This will produce a list containing all the key outputs from the linear regression model, including coefficients, standard errors, confidence intervals, residuals, and predicted values.
