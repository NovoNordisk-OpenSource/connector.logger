#' Log Read Operation for ConnectorDatabricksVolume connector
#'
#' Implementation of the log_read_connector function for the ConnectorDatabricksVolume class.
#'
#' @param connector_object The ConnectorDatabricksVolume object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_read_connector.ConnectorDatabricksVolume <- function(connector_object, name, ...) {
  msg <- paste0("full path:" , connector_object$full_path, " , name:", name)
  whirl::log_read(msg)
}

#' Log Write Operation for ConnectorDatabricksVolume connector
#'
#' Implementation of the log_write_connector function for the ConnectorDatabricksVolume class.
#'
#' @param connector_object The ConnectorDatabricksVolume object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_write_connector.ConnectorDatabricksVolume <- function(connector_object, name, ...) {
  msg <- paste0("full path:" , connector_object$full_path, " , name:", name)
  whirl::log_write(msg)
}

#' Log Remove Operation for ConnectorDatabricksVolume connector
#'
#' Implementation of the log_remove_connector function for the ConnectorDatabricksVolume class.
#'
#' @param connector_object The ConnectorDatabricksVolume object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_remove_connector.ConnectorDatabricksVolume <- function(connector_object, name, ...) {
  msg <- paste0("full path:" , connector_object$full_path, " , name:", name)
  whirl::log_delete(msg)
}
