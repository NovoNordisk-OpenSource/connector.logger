library(testthat)
library(mockery)

test_that("log_read_connector.connector_dbi logs correct message", {
  # Create a mock connector_dbi object
  connector_object <- connector::connector_dbi$new(RSQLite::SQLite(),
    extra_class = "connector_logger"
  )

  # Create mock for whirl::log_read
  log_mock <- mock()
  stub(log_read_connector.connector_dbi, "whirl::log_read", log_mock)

  # Test the function
  log_read_connector.connector_dbi(connector_object, "test_connector")

  # Verify log_read was called with correct message
  expected_msg <- "test_connector @ driver: SQLiteConnection, dbname: "
  expect_called(log_mock, 1)
  expect_args(log_mock, 1, expected_msg)
})

test_that("log_write_connector.connector_dbi logs correct message", {
  # Create a mock connector_dbi object
  connector_object <- connector::connector_dbi$new(RSQLite::SQLite(),
    extra_class = "connector_logger"
  )

  # Create mock for whirl::log_write
  log_mock <- mock()
  stub(log_write_connector.connector_dbi, "whirl::log_write", log_mock)

  # Test the function
  log_write_connector.connector_dbi(connector_object, "test_connector")

  # Verify log_write was called with correct message
  expected_msg <- "test_connector @ driver: SQLiteConnection, dbname: "
  expect_called(log_mock, 1)
  expect_args(log_mock, 1, expected_msg)
})

test_that("log_remove_connector.connector_dbi logs correct message", {
  # Create a mock connector_dbi object
  connector_object <- connector::connector_dbi$new(RSQLite::SQLite(),
    extra_class = "connector_logger"
  )

  # Create mock for whirl::log_delete
  log_mock <- mock()
  stub(log_remove_connector.connector_dbi, "whirl::log_delete", log_mock)

  # Test the function
  log_remove_connector.connector_dbi(connector_object, "test_connector")

  # Verify log_delete was called with correct message
  expected_msg <- "test_connector @ driver: SQLiteConnection, dbname: "
  expect_called(log_mock, 1)
  expect_args(log_mock, 1, expected_msg)
})
