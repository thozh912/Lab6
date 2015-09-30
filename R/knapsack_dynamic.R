helpfu <- function(x, maxweight){
  x  <- x[which(x[,1] <= maxweight),]
  x2 <- x[,2]
  greatest <- max(x2)
  return(greatest)
}


knapsack_dynamic <- function(x, W){
  m <- matrix(0, nrow = length(x[,1]) + 1, ncol = W + 1 )
  for(i in 2:(length(x[,1]) + 1)){
    for(j in 0:W){
      if( x[i-1,1] <= j) {
  
        m[i,j] <- max( m[i-1, j], m[i-1, j-x[i, 1]] + x[i, 2])
      }
      else {
        
        m[i,j] <- m[i-1, j]
      
    }
    }
  }
  
  value <- m[length(x[,1]) + 1,W]
  #elements <-  
 return(value)
}