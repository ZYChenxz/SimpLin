
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SimpLin

<!-- badges: start -->

<!-- badges: end -->

The goal of SimpLin is to provide a fast and simple tool for fitting
simple linear regression models, powered by a C++ backend using
RcppArmadillo. This package was created as part of the STAT 600
Statistical Computing course at CSU.

## Installation

You can install the development version of SimpLin from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ZYChenxz/SimpLin")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SimpLin)
set.seed(600) 
x_vals <- 1:20
y_vals <- 3 * x_vals + rnorm(20)
model_fit <- SimpLin(x_vals, y_vals)
print(model_fit)
#> $coefficients
#>            [,1]
#> [1,] -0.6074202
#> [2,]  3.0308790
#> attr(,"names")
#> [1] "Intercept" "Slope"    
#> 
#> $standard_errors
#>           [,1]
#> [1,] 0.4279851
#> [2,] 0.0357275
#> attr(,"names")
#> [1] "Intercept" "Slope"    
#> 
#> $confidence_intervals
#>           Lower 2.5% Upper 97.5%
#> Intercept  -1.506584   0.2917431
#> Slope       2.955818   3.1059397
#> 
#> $residuals
#>              [,1]
#>  [1,] -0.54360025
#>  [2,]  0.74393642
#>  [3,]  1.15994912
#>  [4,]  0.33245248
#>  [5,]  0.43460798
#>  [6,]  0.43985447
#>  [7,] -0.82705975
#>  [8,] -1.29173792
#>  [9,]  0.36803613
#> [10,] -1.07342385
#> [11,]  0.20246964
#> [12,] -0.04787142
#> [13,] -2.04156571
#> [14,] -0.12217072
#> [15,]  0.53174707
#> [16,]  0.51059421
#> [17,] -0.98241725
#> [18,]  1.63938774
#> [19,]  0.71265801
#> [20,] -0.14584640
#> 
#> $predicted_values
#>            [,1]
#>  [1,]  2.423459
#>  [2,]  5.454338
#>  [3,]  8.485217
#>  [4,] 11.516096
#>  [5,] 14.546975
#>  [6,] 17.577854
#>  [7,] 20.608733
#>  [8,] 23.639612
#>  [9,] 26.670491
#> [10,] 29.701369
#> [11,] 32.732248
#> [12,] 35.763127
#> [13,] 38.794006
#> [14,] 41.824885
#> [15,] 44.855764
#> [16,] 47.886643
#> [17,] 50.917522
#> [18,] 53.948401
#> [19,] 56.979280
#> [20,] 60.010159
#> 
#> attr(,"class")
#> [1] "SimpLin"
```

This will produce a list containing all the key outputs from the linear
regression model, including coefficients, standard errors, confidence
intervals, residuals, and predicted values.
