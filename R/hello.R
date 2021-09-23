#' @title Exports Castor Data to R
#'
#' @description This package is a R wrapper to the Castor EDC API. Under the hood, it uses the Python wrapper (castoredc_api) to export data and transports it to R using feather.
#'
#' @param client_id,client_secret,study_id
#'
#' @return NULL
#'
#' @examples export_data('CLIENT_ID', 'CLIENT_SECRET', 'STUDY_ID', 'DATABASE_URL')
#'
#' @export export_data

library(reticulate)
library(arrow)

export_data <- function(client_id, client_secret, study_id, url) {
  # Deal with timezones, API returns timezone naive files for datapoints
  # And they shouldn't be changed
  current <- Sys.timezone()
  Sys.setenv(TZ="GMT")

  api <- import("castoredc_api")
  study <- api$CastorStudy(client_id, client_secret, study_id, url)
  dataframes <- study$export_to_feather()

  dataframes$Study <- read_and_delete(dataframes$Study)
  dataframes$Reports <- lapply(dataframes$Reports, read_and_delete)
  dataframes$Surveys <- lapply(dataframes$Surveys, read_and_delete)

  # Reset timezone
  Sys.setenv(TZ=current)

  return(dataframes)

}

read_and_delete <- function(path) {
  data <- arrow::read_feather(path)
  file.remove(path)
  return(data)
}
