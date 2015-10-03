# #' Profiling
# 
# 
# knapsack_matr <- knapsack_gener_matr()
# knapsack_df <- knapsack_generator()
# boz <- function(data){
#   for(i in 1:2){
#     for(j in 1:1000){
#       tag <- data[j,i]
#     }
#   }
#   return(paste("Done"))
# }
# 
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# boz(knapsack_matr)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# boz(knapsack_df)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# #brute_force_knapsack(knapsack_matr[1:15,], W = 2000, parallel = TRUE)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# brute_force_knapsack(knapsack_matr[1:15,], W = 2000)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# knapsack_dynamic(knapsack_matr[1:100,], W = 8000)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# greedy_knapsack(knapsack_matr[1:100000,], W = 8000)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# 
# 
# 
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# #brute_force_knapsack(knapsack_df[1:15,], W = 2000, parallel = TRUE)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# brute_force_knapsack(knapsack_df[1:15,], W = 2000)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# knapsack_dynamic(knapsack_df[1:100,], W = 8000)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# tmp <- tempfile()
# Rprof(tmp,interval = 0.001)
# greedy_knapsack(knapsack_df[1:100000,], W = 8000)
# Rprof(NULL)
# summaryRprof(tmp)