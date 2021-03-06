
#' JSON wrapper function for kwb.heatsine::run_optimisation
#' @param json_args arguments for function \link[kwb.heatsine]{run_optimisation}
#' in json format
#' @return json list with sim/observation data ("data") fit parameters ("paras"), goodness-of-fit values ("gof")
#' traveltimes ("traveltimes") and special (min, max, turning) points ("points") as returned by
#' \link[kwb.heatsine]{get_predictions}
#' @export
#' @importFrom kwb.heatsine run_optimisation
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom tibble as_tibble

run_optimisation <- function (json_args) {

args <- jsonlite::fromJSON(json_args)
args$data_gw_selected <- tibble::as_tibble(args$data_gw_selected)
args$data_sw_selected <- tibble::as_tibble(args$data_sw_selected)

output <- base::do.call(kwb.heatsine::run_optimisation, args)

jsonlite::toJSON(output, pretty = TRUE)

}
