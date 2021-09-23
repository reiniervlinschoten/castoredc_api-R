context("test-export-data")

test_that("export works", {
  skip_on_cran()
  api_dfs <- export_data('client_id', "client_secret", "study_id", "data.castoredc.com")
  study_df <- readr::read_delim("tests/testthat/testfiles/CastorStudy.csv",
                            delim = ";", escape_double = FALSE, trim_ws = TRUE)
  expect_equal(study_df, api_dfs["Study"])

  survey_df <- readr::read_delim("tests/testthat/testfiles/CastorQOLSurvey.csv",
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
  expect_equal(study_df, api_dfs["Surveys"]["QOL Survey"])

  adverse_df <- readr::read_delim("tests/testthat/testfiles/CastorAdverseEvent.csv",
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
  expect_equal(study_df, api_dfs["Reports"]["Adverse Events"])

  medication_df <- readr::read_delim("tests/testthat/testfiles/CastorMedication.csv",
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
  expect_equal(study_df, api_dfs["Reports"]["Medication"])

  comorb_df <- readr::read_delim("tests/testthat/testfiles/CastorComorbidities.csv",
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
  expect_equal(study_df, api_dfs["Reports"]["Comorbidities"])

  visit_df <- readr::read_delim("tests/testthat/testfiles/CastorUnscheduledVisit.csv",
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
  expect_equal(study_df, api_dfs["Reports"]["Unscheduled Visit"])

})
