#' Calculate Summary Statistics
#'
#' 'calc_summary_stats' calculates summary statistics (range, mean, median, and standard deviation) for a given variable within a dataset,
#' grouped by another variable.
#'
#' @param data A data frame containing the dataset.
#' @param grouping_variable A character string specifying the variable by which the data
#' should be grouped, therefore named grouping_variable.
#' @param data_variable A character string specifying the variable for which summary
#' statistics will be calculated. The variable is wthin a dataset, thus named data_variable.
#'
#' @return A data frame containing the summary statistics range, mean, median,
#' and standard deviation.
#'
#' @import dplyr
#' @importFrom stats median sd
#'
#' @examples
#' sepal <- calc_summary_stats(data = iris, grouping_variable = Species,data_variable = Sepal.Length)
#'
#' @export

calc_summary_stats <- function(data, grouping_variable, data_variable) {
  if (data %>%  pull({{data_variable}}) %>% is.numeric()) {
    summary_stats <- data %>%
      group_by({{grouping_variable}}) %>%
      summarise(
        range = max({{data_variable}}) - min({{data_variable}}),
        mean = mean({{data_variable}}, na.rm = TRUE),
        median = median({{data_variable}}, na.rm = TRUE),
        std_dev = sd({{data_variable}}, na.rm = TRUE))
    return(summary_stats)
  } else {
    stop ("The specificed 'data_variable' must contain numeric values.")
  }
}
