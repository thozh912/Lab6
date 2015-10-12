
context("Knapsack Test")

test_that("The output is correct ",{
  expect_equal(round(greedy_knapsack(knapsack_generator()[1:20,],3500)$value), 8479)
  expect_equal(knapsack_dynamic(knapsack_generator()[1:20,],3500)$value, 8712.549)
  expect_equal(brute_force_knapsack(knapsack_generator()[1:7,],10000)$value, 24949)
  
  
  #expect_error(brute_force_knapsack(data.frame(w=c(-5 ,3, - 11 ,15 ),v=c(2,2,-1,2)), 10000))
  
})

test_that("The elements are correct ",{
  expect_equal(knapsack_dynamic(knapsack_generator()[1:20,],3500)$elements,c(8,7))
  expect_equal(greedy_knapsack(knapsack_generator()[1:20,],3500)$elements, c(19,18,14))
  expect_equal(brute_force_knapsack(knapsack_generator()[1:7,],10000)$elements, c(3, 4, 5, 7))           
  
})
