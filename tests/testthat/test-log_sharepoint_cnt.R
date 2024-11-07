# Define the environment variable for the full path
url_var <- "SHAREPOINT_SITE_URL"

get_url_var <- Sys.getenv(url_var)
if (get_url_var != "") {
  # Create a mock Connector_sharepoint object with a temporary folder path
  sharepoint_connector <- connector.sharepoint::connector_sharepoint(
    get_url_var,
    extra_class = "connector_logger"
  )

  test_that(
    "log_read_connector.Connector_sharepoint logs correct message",
    {
      # Create mock for whirl::log_read
      log_mock <- mockery::mock()
      mockery::stub(
        log_read_connector.Connector_sharepoint,
        "whirl::log_read",
        log_mock
      )

      # Test the function
      log_read_connector.Connector_sharepoint(sharepoint_connector, "test.csv")

      # Verify log_read was called with correct message
      expected_msg <- glue::glue("test.csv @ {get_url_var}")
      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )

  test_that(
    "log_write_connector.Connector_sharepoint logs correct message",
    {
      # Create mock for whirl::log_write
      log_mock <- mockery::mock()
      mockery::stub(
        log_write_connector.Connector_sharepoint,
        "whirl::log_write",
        log_mock
      )

      # Test the function
      log_write_connector.Connector_sharepoint(sharepoint_connector, "test.csv")

      # Verify log_write was called with correct message
      expected_msg <- glue::glue("test.csv @ {get_url_var}")
      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )

  test_that(
    "log_remove_connector.Connector_sharepoint logs correct message",
    {
      # Create mock for whirl::log_delete
      log_mock <- mockery::mock()
      mockery::stub(
        log_remove_connector.Connector_sharepoint,
        "whirl::log_delete",
        log_mock
      )

      # Test the function
      log_remove_connector.Connector_sharepoint(
        sharepoint_connector, "test.csv"
      )

      # Verify log_delete was called with correct message
      expected_msg <- glue::glue("test.csv @ {get_url_var}")
      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )
}
