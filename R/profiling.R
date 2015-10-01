library(parallel)

cores <- parallel::detectCores()
cores
ass <- c(knapsack_generator()[1:2,],knapsack_generator()[1:3,]) 

a <- Sys.time()
#bs <- parallel::mclapply(1:10,sum,c(11,100),mc.cores = 8)
bf <- parallel::mclapply(knapsack_generator()[1:2,], brute_force_knapsack, W = 4000,  mc.cores = cores)
Sys.time() - a