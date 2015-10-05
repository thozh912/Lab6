
context("Knapsack Test")

test_that("The output is correct ",{
  expect_equal(greedy_knapsack(knapsack_generator()[1:20,],3500)$value,28827.67,tolerance = 1)
  expect_equal(knapsack_dynamic(knapsack_generator()[1:20,],3500),28827.67)
  expect_equal(brute_force_knapsack(knapsack_generator()[1:7,],10000), 32584)
  #expect_error(brute_force_knapsack(data.frame(w=c(-5 ,3, - 11 ,15 ),v=c(2,2,-1,2)), 10000))
  
  
})

test_that("The elements are correct ",{
  expect_equal(greedy_knapsack(knapsack_generator()[1:20,],3500)$elements, c(8, 18, 14, 3) )
  expect_equal(knapsack_dynamic(knapsack_generator()[1:20,],3500)$elements, c(18, 14, 8, 3))
  expect_equal(brute_force_knapsack(knapsack_generator()[1:7,],10000)$elements, c(1, 3, 5, 6))            
  
})
