#' Log Read Operation for Databricks dbi connector
#'
#' Implementation of the log_read_connector function for the
#' connector_databricks_dbi class.
#'
#' @param connector_object The connector_databricks_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @importFrom methods show
#' @export
log_read_connector.connector_databricks_dbi <-
  function(connector_object, name, ...) {
    msg <- paste0(
      name,
      " @ ",
      "dbname: ",
      connector_object$conn@info$dbname,
      ", dbms.name: ",
      connector_object$conn@info$dbms.name,
      ", db.version: ",
      connector_object$conn@info$db.version,
      ", drivername: ",
      connector_object$conn@info$drivername,
      ", driver.version: ",
      connector_object$conn@info$driver.version,
      ", odbcdriver.version: ",
      connector_object$conn@info$odbcdriver.version,
      ", catalog:",
      connector_object$catalog,
      ", schema:",
      connector_object$schema
    )
    whirl::log_read(msg)
  }

#' Log Write Operation for Databricks dbi connector
#'
#' Implementation of the log_write_connector function for the
#' connector_databricks_dbi class.
#'
#' @param connector_object The connector_databricks_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @importFrom methods show
#' @export
log_write_connector.connector_databricks_dbi <-
  function(connector_object, name, ...) {
    msg <- paste0(
      name,
      " @ ",
      "dbname: ",
      connector_object$conn@info$dbname,
      ", dbms.name: ",
      connector_object$conn@info$dbms.name,
      ", db.version: ",
      connector_object$conn@info$db.version,
      ", drivername: ",
      connector_object$conn@info$drivername,
      ", driver.version: ",
      connector_object$conn@info$driver.version,
      ", odbcdriver.version: ",
      connector_object$conn@info$odbcdriver.version,
      ", catalog:",
      connector_object$catalog,
      ", schema:",
      connector_object$schema
    )
    whirl::log_write(msg)
  }

#' Log Remove Operation for Databricks dbi connector
#'
#' Implementation of the log_remove_connector function for the
#' connector_databricks_dbi class.
#'
#' @param connector_object The connector_databricks_dbi object.
#' @param name The name of the connector.
#' @param ... Additional parameters.
#'
#' @importFrom methods show
#' @export
log_remove_connector.connector_databricks_dbi <-
  function(connector_object, name, ...) {
    msg <- paste0(
      name,
      " @ ",
      "dbname: ",
      connector_object$conn@info$dbname,
      ", dbms.name: ",
      connector_object$conn@info$dbms.name,
      ", db.version: ",
      connector_object$conn@info$db.version,
      ", drivername: ",
      connector_object$conn@info$drivername,
      ", driver.version: ",
      connector_object$conn@info$driver.version,
      ", odbcdriver.version: ",
      connector_object$conn@info$odbcdriver.version,
      ", catalog:",
      connector_object$catalog,
      ", schema:",
      connector_object$schema
    )
    whirl::log_delete(msg)
  }
