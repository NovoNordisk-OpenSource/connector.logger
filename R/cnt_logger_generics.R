#' @export
connector_logger <- R6::R6Class("connector_logger", inherit = connector)

#' @title Log read operation for a connector
#' @description Log read operation for a connector
#' @export
log_read_connector <- function(connector_object, name, ...) {
  UseMethod("log_read_connector")
}

#' @title Default log read operation
#' @description Default log read operation
#' @export
log_read_connector.default <- function(connector_object, name, ...) {
  whirl::log_read(name)
}

#' @title Log read operation for connector_logger class
#' @description Log read operation for connector_logger class
#' @export
read_cnt.connector_logger <- function(connector_object, name, ...) {
  res <- tryCatch(NextMethod())
  log_read_connector(connector_object, name, ...)
  return(res)
}

#' @title Log write operation for a connector
#' @description Log write operation for a connector
#' @export
log_write_connector <- function(connector_object, name, ...) {
  UseMethod("log_write_connector")
}

#' @title Default log write operation
#' @description Default log write operation
#' @export
log_write_connector.default <- function(connector_object, name, ...) {
  whirl::log_write(name)
}

#' @title Log write operation for connector_logger class
#' @description Log write operation for connector_logger class
#' @export
write_cnt.connector_logger <- function(connector_object, x, name, ...) {
  res <- tryCatch(NextMethod())
  log_write_connector(connector_object, name, ...)
  return(invisible(res))
}

#' @title Log remove operation for a connector
#' @description Log remove operation for a connector
#' @export
log_remove_connector <- function(connector_object, name, ...) {
  UseMethod("log_remove_connector")
}

#' @title Default log remove operation
#' @description Default log remove operation
#' @export
log_remove_connector.default <- function(connector_object, name, ...) {
  whirl::log_delete(name)
}

#' @title Log remove operation for connector_logger class
#' @description Log remove operation for connector_logger class
#' @export
remove_cnt.connector_logger <- function(connector_object, name, ...) {
  res <- tryCatch(NextMethod())
  log_remove_connector(connector_object, name, ...)
  return(res)
}

#' @title Log read operation for FS connector
#' @description Log read operation for FS connector
#' @export
log_read_connector.connector_fs <- function(connector_object, name, ...) {
  msg <- paste0("path :", connector_object$path, " , name:", name)
  whirl::log_read(msg)
}

#' @title Log write operation for FS connector
#' @description Log write operation for FS connector
#' @export
log_write_connector.connector_fs <- function(connector_object, name, ...) {
  msg <- paste0("path :", connector_object$path, " , name:", name)
  whirl::log_write(msg)
}

#' @title Log remove operation for FS connector
#' @description Log remove operation for FS connector
#' @export
log_remove_connector.connector_fs <- function(connector_object, name, ...) {
  msg <- paste0("path :", connector_object$path, " , name:", name)
  whirl::log_delete(msg)
}

#' @title Log read operation for Sharepoint connector
#' @description Log read operation for Sharepoint connector
#' @export
log_read_connector.Connector_sharepoint <- function(connector_object, name, ...) {
  msg <- paste0("url :", connector_object$site_url, " , name:", name)
  whirl::log_read(msg)
}

#' @title Log write operation for Sharepoint connector
#' @description Log write operation for Sharepoint connector
#' @export
log_write_connector.Connector_sharepoint <- function(connector_object, name, ...) {
  msg <- paste0("url :", connector_object$site_url, " , name:", name)
  whirl::log_write(msg)
}

#' @title Log remove operation for Sharepoint connector
#' @description Log remove operation for Sharepoint connector
#' @export
log_remove_connector.Connector_sharepoint <- function(connector_object, name, ...) {
  msg <- paste0("url :", connector_object$site_url, " , name:", name)
  whirl::log_delete(msg)
}

#' @title Log read operation for Databricks dbi connector
#' @description Log read operation for Databricks dbi connector
#' @importFrom methods show
#' @export
log_read_connector.connector_databricks_dbi <- function(connector_object, name, ...) {
  msg <- paste0(show(connector_object$conn), "catalog:", connector_object$catalog, " , schema:", connector_object$schema, " , name:", name)
  whirl::log_read(msg)
}

#' @title Log write operation for Databricks dbi connector
#' @description Log write operation for Databricks dbi connector
#' @importFrom methods show
#' @export
log_write_connector.connector_databricks_dbi <- function(connector_object, name, ...) {
  msg <- paste0(show(connector_object$conn), "catalog:", connector_object$catalog, " , schema:", connector_object$schema, " , name:", name)
  whirl::log_write(msg)
}

#' @title Log remove operation for Databricks dbi connector
#' @description Log remove operation for Databricks dbi connector
#' @importFrom methods show
#' @export
log_remove_connector.connector_databricks_dbi <- function(connector_object, name, ...) {
  msg <- paste0(show(connector_object$conn), "catalog:", connector_object$catalog, " , schema:", connector_object$schema, " , name:", name)
  whirl::log_delete(msg)
}

#' @title Log read operation for ConnectorDatabricksVolume connector
#' @description Log read operation for ConnectorDatabricksVolume connector
#' @export
log_read_connector.ConnectorDatabricksVolume <- function(connector_object, name, ...) {
  msg <- paste0("full path:" , connector_object$full_path, " , name:", name)
  whirl::log_read(msg)
}

#' @title Log write operation for ConnectorDatabricksVolume connector
#' @description Log write operation for ConnectorDatabricksVolume connector
#' @export
log_write_connector.ConnectorDatabricksVolume <- function(connector_object, name, ...) {
  msg <- paste0("full path:" , connector_object$full_path, " , name:", name)
  whirl::log_write(msg)
}

#' @title Log remove operation for ConnectorDatabricksVolume connector
#' @description Log remove operation for ConnectorDatabricksVolume connector
#' @export
log_remove_connector.ConnectorDatabricksVolume <- function(connector_object, name, ...) {
  msg <- paste0("full path:" , connector_object$full_path, " , name:", name)
  whirl::log_delete(msg)
}

#' @title Log read operation for connector dbi
#' @description Log read operation for connector dbi
#' @export
log_read_connector.connector_dbi <- function(connector_object, name, ...) {
  msg <- paste0("dbname :", connector_object$conn@dbname, " , name:", name)
  whirl::log_read(msg)
}

#' @title Log write operation for connector dbi
#' @description Log write operation for connector dbi
#' @export
log_write_connector.connector_dbi <- function(connector_object, name, ...) {
  msg <- paste0("dbname :", connector_object$conn@dbname, " , name:", name)
  whirl::log_write(msg)
}

#' @title Log remove operation for connector dbi
#' @description Log remove operation for connector dbi
#' @export
log_remove_connector.connector_dbi <- function(connector_object, name, ...) {
  msg <- paste0("dbname :", connector_object$conn@dbname, " , name:", name)
  whirl::log_delete(msg)
}


