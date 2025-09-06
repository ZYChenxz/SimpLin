#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
namespace helper{
double t_crit(double alpha, int df) {
  return R::qt(1.0 - alpha/2.0, df, 1, 0);
}
}
// [[Rcpp::export]]
List SimpLinCpp(arma::vec x, arma::vec y) {
  int n = x.size();
  arma::mat X(n, 2);
  X.col(0) = arma::ones<arma::vec>(n);
  X.col(1) = x;

  arma::vec coefs = arma::inv(X.t() * X) * X.t() * y;
  arma::vec pre_values = X * coefs;
  arma::vec resids = y - X * coefs;
  double sigma2 = arma::dot(resids, resids) / (n - 2);
  arma::vec std_ers = arma::sqrt(sigma2 * arma::diagvec(arma::inv(X.t() * X)));
  double t_val = helper::t_crit(0.05, n - 2);
  arma::vec lower = coefs - t_val * std_ers;
  arma::vec upper = coefs + t_val * std_ers;
  arma::mat CI(2, 2);
  CI.col(0) = lower;
  CI.col(1) = upper;

  return List::create(
    _["coefficients"] = coefs,
    _["standard_errors"] = std_ers,
    _["confidence_intervals"] = CI,
    _["residuals"] = resids,
    _["predicted_values"] = pre_values
  );
}


