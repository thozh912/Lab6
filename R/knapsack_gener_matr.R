knapsack_gener_matr<-function(){
  set.seed(42)
  n <- 1000000
  knapsack_objects <-
    as.matrix(data.frame(
      w=sample(1:4000, size = n, replace = TRUE),
      v=runif(n = n, 0, 10000)
    ))
  return(knapsack_objects)
}
