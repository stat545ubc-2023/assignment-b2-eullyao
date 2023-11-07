
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

## Examples

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

This example calculates the summary statistics for the dataset
`PlantGrowth` for the variable weight, grouped by the samples’ treatment
group.

``` r
library(summarystats)
plant_weight_summary <- calc_summary_stats(data = PlantGrowth, grouping_variable = group, data_variable = weight)
head(plant_weight_summary)
#> # A tibble: 3 × 5
#>   group range  mean median std_dev
#>   <fct> <dbl> <dbl>  <dbl>   <dbl>
#> 1 ctrl   1.94  5.03   5.15   0.583
#> 2 trt1   2.44  4.66   4.55   0.794
#> 3 trt2   1.39  5.53   5.44   0.443
```
