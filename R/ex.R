library(lineprof)
library(shiny)
source("R/greedy_knapsack.R")
source("R/knapsack_dynamic.R")
source("R/knapsack_generator.R")
source("R/brute_force_knapsack.R")


l <- lineprof(brute_force_knapsack(knapsack_generator()[1:15,],12000))
l
shine(l)

df <- knapsack_generator()[1:15,]
tmp <- tempfile()
Rprof(tmp, interval = 0.01)
brute_force_knapsack(df,12000)
Rprof(NULL)
summaryRprof(tmp)