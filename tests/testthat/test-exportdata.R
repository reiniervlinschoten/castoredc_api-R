context("test-export-data")

test_that("export works", {
  skip_on_cran()
  api_dfs <- export_data(Sys.getenv(x = "CLIENT_ID"),
                         Sys.getenv(x = "CLIENT_SECRET"),
                         Sys.getenv(x = "STUDY_STUDY_ID"),
                         "data.castoredc.com")

  load("testfiles/studyoutput.Rdata")

  expect_equal(api_dfs$Study, test_data$Study)
})
#   survey_df <- dplyr::read_delim("testfiles/CastorQOLSurvey.csv",
#                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
#   expect_equal(survey_df, api_dfs$Surveys$`QOL Survey`)
#
#   adverse_df <- readr::read_delim("testfiles/CastorAdverseEvent.csv",
#                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
#   expect_equal(adverse_df, api_dfs$Reports$`Adverse Events`)
#
#   medication_df <- readr::read_delim("testfiles/CastorMedication.csv",
#                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
#   expect_equal(medication_df, api_dfs$Reports$Medication)
#
#   comorb_df <- readr::read_delim("testfiles/CastorComorbidities.csv",
#                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
#   expect_equal(comorb_df, api_dfs$Reports$Comorbidities)
#
#   visit_df <- readr::read_delim("testfiles/CastorUnscheduledVisit.csv",
#                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
#   expect_equal(visit_df, api_dfs$Reports$`Unscheduled Visit`)
#
# })
