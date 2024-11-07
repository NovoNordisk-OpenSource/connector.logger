# Define the environment variable for the full path
http_path_local <- Sys.getenv("HTTP_PATH_LOCAL")
catalog_local <- Sys.getenv("DATABRICKS_CATALOG_NAME")
schema_local <- Sys.getenv("DATABRICKS_SCHEMA_NAME")

if (http_path_local != "" && catalog_local != "" && schema_local != "") {
  # Create a mock connector_databricks_dbi object with a temporary folder path
  dbi_connector <- connector.databricks::connector_databricks_dbi$new(
    http_path = http_path_local,
    catalog = catalog_local,
    schema = schema_local,
    extra_class = "connector_logger"
  )

  test_that(
    "log_read_connector.connector_databricks_dbi logs correct message",
    {
      # Create mock for whirl::log_read
      log_mock <- mockery::mock()
      mockery::stub(
        log_read_connector.connector_databricks_dbi,
        "whirl::log_read",
        log_mock
      )

      # Test the function
      log_read_connector.connector_databricks_dbi(dbi_connector, "test.csv")

      # Verify log_read was called with correct message
      expected_msg <- glue::glue(
        "test.csv @ dbname: hive_metastore, ",
        "dbms.name: Spark SQL, ",
        "db.version: 3.4.1, ",
        "drivername: RStudio Spark ODBC Driver, ",
        "driver.version: 2.7.7.1016, ",
        "odbcdriver.version: 03.80, ",
        "catalog:{catalog_local}, ",
        "schema:{schema_local}"
      )
      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )

  test_that(
    "log_write_connector.connector_databricks_dbi logs correct message",
    {
      # Create mock for whirl::log_write
      log_mock <- mockery::mock()
      mockery::stub(
        log_write_connector.connector_databricks_dbi,
        "whirl::log_write",
        log_mock
      )

      # Test the function
      log_write_connector.connector_databricks_dbi(dbi_connector, "test.csv")

      # Verify log_write was called with correct message
      expected_msg <- glue::glue(
        "test.csv @ dbname: hive_metastore, ",
        "dbms.name: Spark SQL, ",
        "db.version: 3.4.1, ",
        "drivername: RStudio Spark ODBC Driver, ",
        "driver.version: 2.7.7.1016, ",
        "odbcdriver.version: 03.80, ",
        "catalog:{catalog_local}, ",
        "schema:{schema_local}"
      )

      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )

  test_that(
    "log_remove_connector.connector_databricks_dbi logs correct message",
    {
      # Create mock for whirl::log_delete
      log_mock <- mockery::mock()
      mockery::stub(
        log_remove_connector.connector_databricks_dbi,
        "whirl::log_delete",
        log_mock
      )

      # Test the function
      log_remove_connector.connector_databricks_dbi(dbi_connector, "test.csv")

      # Verify log_delete was called with correct message
      expected_msg <- glue::glue(
        "test.csv @ dbname: hive_metastore, ",
        "dbms.name: Spark SQL, ",
        "db.version: 3.4.1, ",
        "drivername: RStudio Spark ODBC Driver, ",
        "driver.version: 2.7.7.1016, ",
        "odbcdriver.version: 03.80, ",
        "catalog:{catalog_local}, ",
        "schema:{schema_local}"
      )

      mockery::expect_called(log_mock, 1)
      mockery::expect_args(log_mock, 1, expected_msg)
    }
  )
}
