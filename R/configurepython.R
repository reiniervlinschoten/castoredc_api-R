.onLoad <- function(libname, pkgname) {
  reticulate::conda_create("castoredc_api", python_version="3.8")
  reticulate::configure_environment(pkgname)
}