#' Sets up a conda environment called castoredc_api for exporting Castor EDC data
#' If environment already exists, loads the environment and installs necessary packages.
#' @export
#'
#' @examples
#' \dontrun{
#' configure_python()
#' }
configure_python <- function(libname, pkgname) {
  tryCatch(reticulate::install_miniconda(), error=function(e) print("Miniconda Already Installed"))
  if (!("castoredc_api" %in% reticulate::conda_list()$name)) {
    reticulate::conda_create(envname="castoredc_api",
                             packages=c("castoredc_api", "pyarrow"),
                             python_version="3.8")
    reticulate::use_condaenv("castoredc_api", required=TRUE)
  }
  else {
    reticulate::use_condaenv("castoredc_api", required=TRUE)
    reticulate::conda_install(envname="castoredc_api", c("castoredc_api", "pyarrow"))
  }
}
