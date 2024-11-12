.onLoad <- function(...) {
  vctrs::s3_register("connector::read_cnt", "connector_logger")
  vctrs::s3_register("connector::write_cnt", "connector_logger")
  vctrs::s3_register("connector::remove_cnt", "connector_logger")
}
