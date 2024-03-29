% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc.R
\encoding{UTF-8}
\name{print.mcptext}
\alias{print.mcptext}
\title{Nice printing texts}
\usage{
\method{print}{mcptext}(x, ...)
}
\arguments{
\item{x}{Character, often with newlines.}

\item{...}{Currently ignored.}
}
\description{
Useful for \code{print(fit$jags_code)}, \code{print(mcp_demo$call)}, etc.
}
\examples{
mytext = "line1 = 2\n line2 = 'horse'"
class(mytext) = "mcptext"
print(mytext)
}
\author{
Jonas Kristoffer Lindeløv \email{jonas@lindeloev.dk}
}
