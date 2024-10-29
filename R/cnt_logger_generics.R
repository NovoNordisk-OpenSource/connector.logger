#' @export
connector_logger <- R6::R6Class("connector_logger",
                                inherit = connector
                                )

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



