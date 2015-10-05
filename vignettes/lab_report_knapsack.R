## ---- echo = FALSE, message = FALSE--------------------------------------
library(Lab6)

## ------------------------------------------------------------------------

system.time(brute_force_knapsack(knapsack_generator()[1:16,],W =2000))


## ------------------------------------------------------------------------
system.time(knapsack_dynamic(knapsack_generator()[1:500,],W =2000))

## ------------------------------------------------------------------------
system.time(greedy_knapsack(knapsack_generator()[1:1000000,],W =2000))

## ----echo=FALSE----------------------------------------------------------

knapsack_matr <- knapsack_gener_matr()
knapsack_df <- knapsack_generator()

## ------------------------------------------------------------------------
tmp <- tempfile()
Rprof(tmp,interval = 0.01)
brute_force_knapsack(knapsack_matr[1:15,], W = 2000)
Rprof(NULL)
summaryRprof(tmp)$by.self


## ------------------------------------------------------------------------

tmp <- tempfile()
Rprof(tmp,interval = 0.01)
brute_force_knapsack(knapsack_df[1:15,], W = 2000)
Rprof(NULL)
summaryRprof(tmp)$by.self


## ------------------------------------------------------------------------

  tmp <- tempfile()
  Rprof(tmp,interval = 0.01)
  brute_force_knapsack(knapsack_matr[1:10,], W = 2000, parallel = TRUE)
  Rprof(NULL)
  summaryRprof(tmp)$by.self

## ------------------------------------------------------------------------
  tmp <- tempfile()
  Rprof(tmp,interval = 0.01)
  alt_brute_force_knapsack(knapsack_matr[1:10,], W = 2000, parallel = TRUE)
  Rprof(NULL)
  summaryRprof(tmp)$by.self

