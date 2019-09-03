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
generate_report <- function(report_template_name,
                            output_file = NULL,
                            param_list,
                            see_now = FALSE) {
  if (!file.exists("skeleton.Rmd")) {
    copy_skeleton_to_wd(report_template_name)
  }
  output_file <- file.path(getwd(), output_file)
  rmarkdown::render(input = "skeleton.Rmd", output_file = output_file, params = param_list)
  if (see_now) browseURL(output_file)
}

report_path <- function () file.path(.libPaths(), "reportsAsFunctions",
                                     "rmarkdown", "templates", "report",
                                     "skeleton", "skeleton.Rmd")

copy_skeleton_to_wd <- function(template_name) {
  p <- file.path(.libPaths(), "reportsAsFunctions",
                 "rmarkdown", "templates", template_name,
                 "skeleton", "skeleton.Rmd")
  invisible(file.copy(p, getwd()))
}
