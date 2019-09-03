#' Generate a report from template
#'
#' @param report_template_name name of template.
#' @param output_file name of the output file.
#' @param param_list A list of named parameters.
#' @param see_now Will launch browser if TRUE.
#'
#' @return invisible
#' @export
#'
#' @examples
#' generate_report("report", output_file = "setosa-report.html", param_list = list(species = "setosa"))
generate_report <- function(template_name,
                            output_file,
                            param_list,
                            see_now = FALSE) {
  if (!file.exists("skeleton.Rmd")) {
    copy_skeleton(template_name)
  }
  output_file <- file.path(here::here(), output_file)
  rmarkdown::render(input = "skeleton.Rmd", output_file = output_file, params = param_list)
  if (see_now) browseURL(output_file)
}

template_path <- function(template_name) file.path(.libPaths(), "reportsAsFunctions",
                                     "rmarkdown", "templates", template_name,
                                     "skeleton", "skeleton.Rmd")

copy_skeleton <- function(template_name) {
  p <- template_path(template_name)
  invisible(file.copy(p, here::here()))
}
