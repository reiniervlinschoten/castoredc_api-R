#' Sets up a conda environment called castoredc_api for exporting Castor EDC data
#' If environment already exists, loads the environment and installs necessary packages.
#' @export
#'
#' @examples
#' \dontrun{
#' configure_python()
#' }
configure_python <- function(libname, pkgname) {
  if (!("castoredc_api" %in% reticulate::conda_list()$name)) {
    reticulate::conda_create(envname="castoredc_api",
                             packages=c("castoredc_api"),
                             python_version="3.8")
  }
  else {
    reticulate::use_condaenv("castoredc_api")
    reticulate::conda_install(envname="castoredc_api", "castoredc_api")
  }
}
