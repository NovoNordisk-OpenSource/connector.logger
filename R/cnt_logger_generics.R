#' @export
connector_logger <- R6::R6Class("connector_logger", inherit = connector)

#' Log Read Connector
#'
#' This function is a generic for logging the reading of a connector object. The
#' actual implementation of the logging is determined by the specific method for
#' the connector object's class.
#'
#' @param connector_object The connector object to log the reading of.
#' @param name The name of the connector.
#' @param ... Additional parameters passed to the specific method implementation.
#'
#' @return The result of the specific method implementation.
#' @export
log_read_connector <- function(connector_object, name, ...) {
  UseMethod("log_read_connector")
}

#' Default Log Read Operation
#'
#' Default implementation of the log_read_connector function.
#'
#' @param connector_object The connector object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_read_connector.default <- function(connector_object, name, ...) {
  whirl::log_read(name)
}

#' Log Read Operation for connector_logger class
#'
#' Implementation of the log_read_connector function for the connector_logger class.
#'
#' @param connector_object The connector_logger object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @return The result of the read operation.
#' @export
read_cnt.connector_logger <- function(connector_object, name, ...) {
  res <- tryCatch(NextMethod())
  log_read_connector(connector_object, name, ...)
  return(res)
}

#' Log Write Connector
#'
#' This function is a generic for logging the writing of a connector object. The
#' actual implementation of the logging is determined by the specific method for
#' the connector object's class.
#'
#' @param connector_object The connector object to log the writing of.
#' @param name The name of the connector.
#' @param ... Additional parameters passed to the specific method implementation.
#'
#' @return The result of the specific method implementation.
#' @export
log_write_connector <- function(connector_object, name, ...) {
  UseMethod("log_write_connector")
}

#' Default Log Write Operation
#'
#' Default implementation of the log_write_connector function.
#'
#' @param connector_object The connector object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_write_connector.default <- function(connector_object, name, ...) {
  whirl::log_write(name)
}

#' Log Write Operation for connector_logger class
#'
#' Implementation of the log_write_connector function for the connector_logger class.
#'
#' @param connector_object The connector_logger object.
#' @param x The data to write.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @return Invisible result of the write operation.
#' @export
write_cnt.connector_logger <- function(connector_object, x, name, ...) {
  res <- tryCatch(NextMethod())
  log_write_connector(connector_object, name, ...)
  return(invisible(res))
}

#' Log Remove Connector
#'
#' This function is a generic for logging the removal of a connector object. The
#' actual implementation of the logging is determined by the specific method for
#' the connector object's class.
#'
#' @param connector_object The connector object to log the removal of.
#' @param name The name of the connector.
#' @param ... Additional parameters passed to the specific method implementation.
#'
#' @return The result of the specific method implementation.
#' @export
log_remove_connector <- function(connector_object, name, ...) {
  UseMethod("log_remove_connector")
}

#' Default Log Remove Operation
#'
#' Default implementation of the log_remove_connector function.
#'
#' @param connector_object The connector object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_remove_connector.default <- function(connector_object, name, ...) {
  whirl::log_delete(name)
}

#' Log Remove Operation for connector_logger class
#'
#' Implementation of the log_remove_connector function for the connector_logger class.
#'
#' @param connector_object The connector_logger object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @return The result of the remove operation.
#' @export
remove_cnt.connector_logger <- function(connector_object, name, ...) {
  res <- tryCatch(NextMethod())
  log_remove_connector(connector_object, name, ...)
  return(res)
}

#' Log Read Operation for FS connector
#'
#' Implementation of the log_read_connector function for the connector_fs class.
#'
#' @param connector_object The connector_fs object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_read_connector.connector_fs <- function(connector_object, name, ...) {
  msg <- paste0("path :", connector_object$path, " , name:", name)
  whirl::log_read(msg)
}

#' Log Write Operation for FS connector
#'
#' Implementation of the log_write_connector function for the connector_fs class.
#'
#' @param connector_object The connector_fs object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_write_connector.connector_fs <- function(connector_object, name, ...) {
  msg <- paste0("path :", connector_object$path, " , name:", name)
  whirl::log_write(msg)
}

#' Log Remove Operation for FS connector
#'
#' Implementation of the log_remove_connector function for the connector_fs class.
#'
#' @param connector_object The connector_fs object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_remove_connector.connector_fs <- function(connector_object, name, ...) {
  msg <- paste0("path :", connector_object$path, " , name:", name)
  whirl::log_delete(msg)
}

#' Log Read Operation for Sharepoint connector
#'
#' Implementation of the log_read_connector function for the Connector_sharepoint class.
#'
#' @param connector_object The Connector_sharepoint object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_read_connector.Connector_sharepoint <- function(connector_object, name, ...) {
  msg <- paste0("url :", connector_object$site_url, " , name:", name)
  whirl::log_read(msg)
}

#' Log Write Operation for Sharepoint connector
#'
#' Implementation of the log_write_connector function for the Connector_sharepoint class.
#'
#' @param connector_object The Connector_sharepoint object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_write_connector.Connector_sharepoint <- function(connector_object, name, ...) {
  msg <- paste0("url :", connector_object$site_url, " , name:", name)
  whirl::log_write(msg)
}

#' Log Remove Operation for Sharepoint connector
#'
#' Implementation of the log_remove_connector function for the Connector_sharepoint class.
#'
#' @param connector_object The Connector_sharepoint object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_remove_connector.Connector_sharepoint <- function(connector_object, name, ...) {
  msg <- paste0("url :", connector_object$site_url, " , name:", name)
  whirl::log_delete(msg)
}

#' Log Read Operation for Databricks dbi connector
#'
#' Implementation of the log_read_connector function for the connector_databricks_dbi class.
#'
#' @param connector_object The connector_databricks_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @importFrom methods show
#' @export
log_read_connector.connector_databricks_dbi <- function(connector_object, name, ...) {
  msg <- paste0(show(connector_object$conn), "catalog:", connector_object$catalog, " , schema:", connector_object$schema, " , name:", name)
  whirl::log_read(msg)
}

#' Log Write Operation for Databricks dbi connector
#'
#' Implementation of the log_write_connector function for the connector_databricks_dbi class.
#'
#' @param connector_object The connector_databricks_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @importFrom methods show
#' @export
log_write_connector.connector_databricks_dbi <- function(connector_object, name, ...) {
  msg <- paste0(show(connector_object$conn), "catalog:", connector_object$catalog, " , schema:", connector_object$schema, " , name:", name)
  whirl::log_write(msg)
}

#' Log Remove Operation for Databricks dbi connector
#'
#' Implementation of the log_remove_connector function for the connector_databricks_dbi class.
#'
#' @param connector_object The connector_databricks_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @importFrom methods show
#' @export
log_remove_connector.connector_databricks_dbi <- function(connector_object, name, ...) {
  msg <- paste0(show(connector_object$conn), "catalog:", connector_object$catalog, " , schema:", connector_object$schema, " , name:", name)
  whirl::log_delete(msg)
}

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

#' Log Read Operation for connector dbi
#'
#' Implementation of the log_read_connector function for the connector_dbi class.
#'
#' @param connector_object The connector_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_read_connector.connector_dbi <- function(connector_object, name, ...) {
  msg <- paste0("dbname :", connector_object$conn@dbname, " , name:", name)
  whirl::log_read(msg)
}

#' Log Write Operation for connector dbi
#'
#' Implementation of the log_write_connector function for the connector_dbi class.
#'
#' @param connector_object The connector_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_write_connector.connector_dbi <- function(connector_object, name, ...) {
  msg <- paste0("dbname :", connector_object$conn@dbname, " , name:", name)
  whirl::log_write(msg)
}

#' Log Remove Operation for connector dbi
#'
#' Implementation of the log_remove_connector function for the connector_dbi class.
#'
#' @param connector_object The connector_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @export
log_remove_connector.connector_dbi <- function(connector_object, name, ...) {
  msg <- paste0("dbname :", connector_object$conn@dbname, " , name:", name)
  whirl::log_delete(msg)
}
