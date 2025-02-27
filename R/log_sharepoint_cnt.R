#' Log Read Operation for Sharepoint connector
#'
#' Implementation of the log_read_connector function for the
#' Connector_sharepoint class.
#'
#' @param connector_object The Connector_sharepoint object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_read_connector.Connector_sharepoint <-
  function(connector_object, name, ...) {
    if (!requireNamespace("connector.sharepoint", quietly = TRUE)) {
      stop("connector.sharepoint required: install first?")
    }

    msg <- paste0(name, " @ ", connector_object$site_url)
    whirl::log_read(msg)
  }

#' Log Write Operation for Sharepoint connector
#'
#' Implementation of the log_write_connector function for the
#' Connector_sharepoint class.
#'
#' @param connector_object The Connector_sharepoint object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_write_connector.Connector_sharepoint <-
  function(connector_object, name, ...) {
    if (!requireNamespace("connector.sharepoint", quietly = TRUE)) {
      stop("connector.sharepoint required: install first?")
    }

    msg <- paste0(name, " @ ", connector_object$site_url)
    whirl::log_write(msg)
  }

#' Log Remove Operation for Sharepoint connector
#'
#' Implementation of the log_remove_connector function for the
#' Connector_sharepoint class.
#'
#' @param connector_object The Connector_sharepoint object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_remove_connector.Connector_sharepoint <-
  function(connector_object, name, ...) {
    if (!requireNamespace("connector.sharepoint", quietly = TRUE)) {
      stop("connector.sharepoint required: install first?")
    }

    msg <- paste0(name, " @ ", connector_object$site_url)
    whirl::log_delete(msg)
  }
