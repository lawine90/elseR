% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/boxGroup.R
\name{boxGroup}
\alias{boxGroup}
\title{boxplot by groups.}
\usage{
boxGroup(data, x, g)
}
\arguments{
\item{data}{a dataframe.}

\item{x}{a column name of numeric vector in dataframe which means y.}

\item{g}{a column name of factor vector in dataframe which means group.}
}
\description{
boxGroup generate boxplots to compare groups with ggplot2 library.
}
\examples{
 test <- boxGroup(iris, 'Sepal.Length', 'Species')

}
