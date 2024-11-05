# Create a mock connector_fs object with a temporary folder path
fs_connector  <- connector::connector_fs$new(
  path = tempdir(),
  extra_class = "connector_logger"
)

test_that("log_read_connector.connector_fs logs correct message", {
  # Create mock for whirl::log_read
  log_mock <- mockery::mock()
  mockery::stub(log_read_connector.connector_fs, "whirl::log_read", log_mock)

  # Test the function
  log_read_connector.connector_fs(fs_connector, "test.csv")

  # Verify log_read was called with correct message
  expected_msg <- glue::glue("path :{tempdir()} , name:test.csv")  # Placeholder for temp directory
  mockery::expect_called(log_mock, 1)
  mockery::expect_args(log_mock, 1, expected_msg)
})

test_that("log_write_connector.connector_fs logs correct message", {
  # Create mock for whirl::log_write
  log_mock <- mockery::mock()
  mockery::stub(log_write_connector.connector_fs, "whirl::log_write", log_mock)

  # Test the function
  log_write_connector.connector_fs(fs_connector, "test.csv")

  # Verify log_write was called with correct message
  expected_msg <- glue::glue("path :{tempdir()} , name:test.csv")  # Placeholder for temp directory
  mockery::expect_called(log_mock, 1)
  mockery::expect_args(log_mock, 1, expected_msg)
})

test_that("log_remove_connector.connector_fs logs correct message", {
  # Create mock for whirl::log_delete
  log_mock <- mockery::mock()
  mockery::stub(log_remove_connector.connector_fs, "whirl::log_delete", log_mock)

  # Test the function
  log_remove_connector.connector_fs(fs_connector, "test.csv")

  # Verify log_delete was called with correct message
  expected_msg <- glue::glue("path :{tempdir()} , name:test.csv")  # Placeholder for temp directory
  mockery::expect_called(log_mock, 1)
  mockery::expect_args(log_mock, 1, expected_msg)
})

test_that("connector_fs logging methods handle spaces in paths", {
  # Create a mock connector_fs object with path containing spaces
  fs_connector_spaces <- structure(
    list(path = file.path(tempdir(), "path with spaces")),
    class = "connector_fs"
  )

  # Test read logging with spaces
  {
    log_mock <- mockery::mock()
    mockery::stub(log_read_connector.connector_fs, "whirl::log_read", log_mock)
    log_read_connector.connector_fs(fs_connector_spaces, "file with spaces.csv")
    expected_msg <- glue::glue("path :{tempdir()}/path with spaces , name:file with spaces.csv")  # Placeholder for temp directory
    mockery::expect_called(log_mock, 1)
    mockery::expect_args(log_mock, 1, expected_msg)
  }
})

test_that("connector_fs logging methods handle edge cases", {

  # Test with empty path
  fs_connector_empty_path <- structure(
    list(path = ""),
    class = "connector_fs"
  )

  log_mock <- mockery::mock()
  mockery::stub(log_read_connector.connector_fs, "whirl::log_read", log_mock)

  log_read_connector.connector_fs(fs_connector_empty_path, "test.csv")

  expected_msg <- glue::glue("path : , name:test.csv")  # Placeholder for temp directory

  mockery::expect_called(log_mock, 1)
  mockery::expect_args(log_mock, 1, expected_msg)


  # Test with empty name
  log_mock <- mockery::mock()
  mockery::stub(log_write_connector.connector_fs, "whirl::log_write", log_mock)

  log_write_connector.connector_fs(fs_connector, "")

  expected_msg <- glue::glue("path :{tempdir()} , name:")  # Placeholder for temp directory
  mockery::expect_called(log_mock, 1)
  mockery::expect_args(log_mock, 1, expected_msg)
})
