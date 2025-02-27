% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connector_imports.R
\name{read_cnt}
\alias{read_cnt}
\title{Read content from the connector}
\usage{
read_cnt(connector_object, name, ...)
}
\arguments{
\item{connector_object}{\link[connector]{connector} The connector object to use.}

\item{name}{\link{character} Name of the content to read, write, or remove. Typically the table name.}

\item{...}{Additional arguments passed to the method for the individual connector.}
}
\value{
R object with the content. For rectangular data a \link{data.frame}.
}
\description{
Addition read methods for databricks connectors implemented for
\code{\link[connector:read_cnt]{connector::read_cnt()}}:
}
