# Define the environment variable for the full path
full_path_env_var <- "DATABRICKS_VOLUME"

get_full_path <- Sys.getenv(full_path_env_var)
if (get_full_path != "") {
  # Create a mock ConnectorDatabricksVolume object with a temporary folder path
  db_vol_connector <- connector.databricks::ConnectorDatabricksVolume$new(
    full_path = get_full_path, extra_class = "connector_logger"
  )

  test_that(
    "log_read_connector.ConnectorDatabricksVolume logs correct message",
    {
      # Create mock for whirl::log_read
      log_mock <- mockery::mock()
      mockery::stub(
        log_read_connector.ConnectorDatabricksVolume,
        "whirl::log_read",
        log_mock
      )

      # Test the function
      log_read_connector.ConnectorDatabricksVolume(db_vol_connector, "test.csv")

      # Verify log_read was called with correct message
      expected_msg <- glue::glue("test.csv @ /Volumes/{get_full_path}")
      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )

  test_that(
    "log_write_connector.ConnectorDatabricksVolume logs correct message",
    {
      # Create mock for whirl::log_write
      log_mock <- mockery::mock()
      mockery::stub(
        log_write_connector.ConnectorDatabricksVolume,
        "whirl::log_write",
        log_mock
      )

      # Test the function
      log_write_connector.ConnectorDatabricksVolume(
        db_vol_connector,
        "test.csv"
      )

      # Verify log_write was called with correct message
      expected_msg <- glue::glue("test.csv @ /Volumes/{get_full_path}")
      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )

  test_that(
    "log_remove_connector.ConnectorDatabricksVolume logs correct message",
    {
      # Create mock for whirl::log_delete
      log_mock <- mockery::mock()
      mockery::stub(
        log_remove_connector.ConnectorDatabricksVolume,
        "whirl::log_delete",
        log_mock
      )

      # Test the function
      log_remove_connector.ConnectorDatabricksVolume(
        db_vol_connector,
        "test.csv"
      )

      # Verify log_delete was called with correct message
      expected_msg <- glue::glue("test.csv @ /Volumes/{get_full_path}")
      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )
}
