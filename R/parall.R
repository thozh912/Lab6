
getvalues <-function(rowid){
  index_i <- 1:(2^length(x[,1])-1)
  index_j <- 1:length(intToBits(1))
  iandj <- expand.grid(i = index_i, j =index_j)
  binary <- intToBits()
  weightsum <- 0
  valuesum <- 0
  if(iandj$j[rowid] == TRUE)
    chosen <- c()
  matr <- matrix(4,4,4)
  if( matr[i,j] > 0){
    weightsum <- weightsum + matr[i,j]
  }
  
  return(weightsum)
}

brute_force_knapsack <- function(x,W,parallel= FALSE){
  stopifnot(is.data.frame(x) & x > 0 & names(x) == c("w","v"))
  
  winnervalue <- 0
  winnerpackets <-c()
  if(parallel){
    index_i <- 1:(2^length(x[,1])-1)
    binary <- parallel::mclapply(index_i, intToBits,  mc.cores = 8)
    index_j <- 1:length(binary[[1]])
    
    weightsum <- parallel::mclapply(binary[[index_i]][index_j],insideweights ,mc.cores = 8)
    valuesum <- parallel::mclapply(binary[[index_i]][index_j], insidevalues ,mc.cores = 8)
    #     print(weightsum)
    #     print(valuesum)
    
    return("hi")
  }
  for(i in 1:(2^length(x[,1])-1)){
    weightsum <- 0
    valuesum <- 0
    packetschosen <-c()
    binary <- intToBits(i)
    for(j in 1:length(binary)){
      if( binary[j] == TRUE ){
        weightsum <- weightsum + x[j,1]
        valuesum <- valuesum + x[j,2]
        
        packetschosen <- c(packetschosen,j)
      }
      
    }
    if(valuesum > winnervalue & weightsum <= W){
      winnervalue <- valuesum
      winnerpackets<- packetschosen
    }
  }
  
  return(list(value=round(winnervalue),elements=winnerpackets))
}


