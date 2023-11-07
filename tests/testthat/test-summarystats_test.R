# test using a dataframe that has no NA's
test_that("calc_summary_stats with vector containing no NA's", {
  data <- data.frame(
    grouping_variable = c("A", "B", "A", "B"),
    data_variable = c(5, 10, 15, 20)
  )
  result <- calc_summary_stats(data, grouping_variable, data_variable)

  expect_type(result, "list") # check that the resulting object is a list
  expect_equal(ncol(result), 5) # check that there are 5 columns
  expect_equal(result$grouping_variable, c("A", "B")) # check that the samples are grouped correctly
  expect_equal(result$range, c(10, 10)) # check range
  expect_equal(result$mean, c(10, 15)) # check mean
  expect_equal(result$median, c(10, 15)) # check median
  expect_equal(result$std_dev, c(7.07, 7.07), tolerance = 1e5)

})

# test using a dataframe that has no NA's
test_that("calc_summary_stats with vector with NA's", {
  data <- data.frame(
    grouping_variable = c("A", "B", "A", "B"),
    data_variable = c(5, 10, NA, 20) # added a NA
  )
  result <- calc_summary_stats(data, grouping_variable, data_variable)

  expect_type(result, "list") # check that the resulting object is a list
  expect_equal(ncol(result), 5) # check that there are 5 columns
  expect_equal(result$grouping_variable, c("A", "B")) # check that the samples are grouped correctly
  expect_equal(result$range, c(NA, 10)) # check range
  expect_equal(result$mean, c(5, 15)) # check mean
  expect_equal(result$median, c(5, 15)) # check median
  expect_equal(result$std_dev, c(NA, 7.07), tolerance = 1e5) # check standard deviation

})

# test using a dataframe that has non numeric values
test_that("calc_summary_stats with non-numeric data_variable", {
  data <- data.frame(
    grouping_variable = c("A", "B", "A", "B"),
    data_variable = c("five", "ten", "fifteen", "twenty") # non numeric values
  )

  expect_error(calc_summary_stats(data, grouping_variable, data_variable))
})

