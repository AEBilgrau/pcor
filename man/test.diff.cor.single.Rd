% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test.diff.cor.R
\name{test.diff.cor.single}
\alias{test.diff.cor.single}
\title{Test for difference in correlation}
\usage{
\method{test}{diff.cor.single}(x1, y1, x2, y2,
  alternative = c("two.sided", "less", "greater"), conf.level = 0.95)
}
\arguments{
\item{x1}{numeric vector, x-values for the first sample.}

\item{y1}{numeric vector, y-values for the first sample.}

\item{x2}{numeric vector, x-values for the second sample.}

\item{y2}{numeric vector, y-values for the second sample.}
}
\value{
A numeric vector giving correlation for each group, 
  size-estimate and standard error, confidence intervals and p-values.
}
\description{
This functions uses the Fisher Z-transform (atanh) to test the null hypothesis
of no difference in correlations between x1 and y1 versus x2 and y2.
}
\details{
The \code{alternative} argument specifies the alternative hypothesis given 
below.
\tabular{rcl}{
                   \tab   \tab
H0: \code{cor(x1, y1) =  cor(x2, y2)} \cr
\code{"two.sided"} \tab =>\tab 
H1: \code{cor(x1, y1) != cor(x2, y2)} \cr
\code{"greater"}   \tab =>\tab 
H1: \code{cor(x1, y1) > cor(x2, y2)} \cr
\code{"less"}      \tab =>\tab 
H1: \code{cor(x1, y1) < cor(x2, y2)} 
}
}
\examples{
x1 <- rnorm(100)
y1 <- rnorm(100)
x2 <- rnorm(110)
y2 <- 4*x2 + 0.5*rnorm(110) + 1

plot(x1, y1, xlim = range(x1, x2), ylim = range(y1, y2))
abline(lm(y1 ~ x1))
points(x2, y2, col = "red")
abline(lm(y2 ~ x2), col = "red")

diff.test <- correlateR:::test.diff.cor.single
round(data.frame(
  two = diff.test(x1, y1, x2, y2, alternative = "two.sided"),
  les = diff.test(x1, y1, x2, y2, alternative = "less"),
  gre = diff.test(x1, y1, x2, y2, alternative = "greater")), 2)
  
round(diff.test(x1, y1, x1, y1, alternative = "two.sided"), 3)
round(diff.test(x1, y1, x1, y1, alternative = "less"), 3)
round(diff.test(x1, y1, x1, y1, alternative = "less"), 3)
}
\seealso{
Similar usage to \code{\link[stats]{cor.test}} in \code{stats}, however 
  not the same! \cr
  See \code{\link{test.diff.cor}} for a vectorised version.
}
\author{
Anders Ellern Bilgrau <anders.ellern.bilgrau (at) gmail.com>
}
\keyword{internal}
