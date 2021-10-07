#' Downloads data from the Castor EDC database
#'
#' @param client_id The client id of your Castor account
#' @param client_secret The client secret of your Castor account
#' @param study_id The id of the study you wish to interact with
#' @param url The url where your Castor database resides
#'
#' @return A list containing dataframes with all study, survey and report data.
#' @export
#'
#' @examples
#' \dontrun{
#' export_data('client_id', 'client_secret', 'study_id', 'data.castoredc.com')
#' }
export_data <- function(client_id, client_secret, study_id, url) {
  # Deal with timezones, API returns timezone naive files for datapoints
  # And they shouldn't be changed
  castor_api <- reticulate::import("castoredc_api")
  study <- castor_api$CastorStudy(client_id, client_secret, study_id, url)
  dataframes <- study$export_to_feather()

  dataframes$Study <- read_and_delete(dataframes$Study)
  dataframes$Reports <- lapply(dataframes$Reports, read_and_delete)
  dataframes$Surveys <- lapply(dataframes$Surveys, read_and_delete)

  return(dataframes)
}

#' Reads a feather file from path, deletes the file and returns the dataframe.
#' @param path The path where the feather file resides
#'
#' @return A dataframe read from the feather file
#'
#' @examples
#' \dontrun{
#' read_and_delete(path_to_file)
#' }
read_and_delete <- function(path) {
  data <- arrow::read_feather(path)
  file.remove(path)
  return(data)
}
