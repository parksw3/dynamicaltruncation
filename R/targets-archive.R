#' Upload the targets archive
#' @export
upload_targets_archive <- function(...) {
  zip("_targets.zip", "_targets")
  piggyback::pb_upload("_targets.zip")
  fs::file_delete("_targets.zip")
}

#' Downloads the targets archive
#' @export
get_targets_archive <- function(dir = ".", ...) {
  piggyback::pb_download("_targets.zip")
  unzip("_targets.zip", exdir = dir)
  fs::file_delete("_targets.zip")
}