
<!-- README.md is generated from README.Rmd. Please edit that file -->

# summarystats

<!-- badges: start -->
<!-- badges: end -->

The goal of summarystats is to calculate summary statistics for a given
variable within a dataset, grouped by another variable. Below shows an
example of its usage. Package dependency involves `dplyr`.

## Installation

You can install summarystats from Github by running:

``` r
devtools::install_github("https://github.com/stat545ubc-2023/summarystats")
```

## Example

This example calculates the summary statistics for the dataset ‘iris’
for the variable `Sepal.Length` for each species:

``` r
library(summarystats)

sepal_length_summary <- calc_summary_stats(data = iris, grouping_variable = Species, data_variable = Sepal.Length)
print(sepal_length_summary)
#> # A tibble: 3 × 5
#>   Species    range  mean median std_dev
#>   <fct>      <dbl> <dbl>  <dbl>   <dbl>
#> 1 setosa       1.5  5.01    5     0.352
#> 2 versicolor   2.1  5.94    5.9   0.516
#> 3 virginica    3    6.59    6.5   0.636
```
