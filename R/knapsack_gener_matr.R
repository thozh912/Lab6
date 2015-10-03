#' Generates values for knapsack problem
#' 
#' This function is the knapsack value generator in the Lab instructions 
#' for Lab 6 in 732A50. It is the same as the \code{knapsack_generator} function but this one uses 
#' matrix instead of data frame.
#' 
#'
#' 
#' @return \code{knapsack_objects} A dataframe with two columns, w and v
#' containing weights and values for use in the knapsack problem.
#'

knapsack_gener_matr<-function(){
  set.seed(42)
  n <- 1000000
  w=sample(1:4000, size = n, replace = TRUE)
  set.seed(42)
  v=runif(n = n, 0, 10000)
  knapsack_objects <-
    as.matrix(data.frame(
      w,
      v
    ))
  return(knapsack_objects)
}
