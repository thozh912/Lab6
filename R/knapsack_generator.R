#' Generates values for knapsack problem
#' 
#' This function is the knapsack value generator in the Lab instructions 
#' for Lab 6 in 732A50.
#' 
#'
#' 
#' @return \code{knapsack_objects} A dataframe with two columns, w and v
#' containing weights and values for use in the knapsack problem.
#'


knapsack_generator<-function(){
  set.seed(42)
  n <- 1000000
  knapsack_objects <-
    data.frame(
      w=sample(1:4000, size = n, replace = TRUE),
      v=runif(n = n, 0, 10000)
    )
  return(knapsack_objects)
}
