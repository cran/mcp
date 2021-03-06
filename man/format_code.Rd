% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_segment_table.R
\encoding{UTF-8}
\name{format_code}
\alias{format_code}
\title{Format code with one or multiple terms}
\usage{
format_code(col, na_col)
}
\arguments{
\item{col}{A column}

\item{na_col}{If this column is NA, return NA}
}
\value{
string
}
\description{
Take a value like "a + b" and
(1) replace it with NA if na_col == NA.
(2) Change to "(a + b)" if there is a "+"
(3) Return itself otherwise, e.g., "a" --> "a".
}
\author{
Jonas Kristoffer Lindeløv \email{jonas@lindeloev.dk}
}
\keyword{internal}
