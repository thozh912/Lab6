
#' Brute force solver of Knapsack problem
#' 
#' This function solves the Knapsack probem by brute force.
#' 
#' The Knapsack problem is a combinatorial optimization problem
#' where one tries to fill a limited weight knapsack with objects
#' of as high a total value as possible. Every object has a positive
#' weight and value associated with itself.
#' 
#'  @param x A data.frame with two columns named in order \code{"w"} and \code{"v"}
#'  Every row in \code{x} is an object with weight \code{w} and value \code{v}.
#'  
#'  @param W A numeric scalar which is the limit of the weight the knapsack can carry.
#'  
#'  @return \code{list} A list with names \code{$value}, telling the maximum value of the knapsack
#'  and \code{$elements} which indicates which row objects in data.frame \code{x} was put
#'  in the knapsack.
#'  
#'  @examples
#'  brute_force_knapsack(data.frame(w=c(20,30,40,50),v=c(2,2,1,2)),W =20)
#'  
#'  @references \url{http://en.wikipedia.org/wiki/Knapsack_problem}  
#'


brute_force_knapsack <- function(x,W){
  stopifnot(is.data.frame(x) & x > 0 & names(x) == c("w","v"))
  
  winnervalue <- 0
  winnerpackets <-c()
  for(i in 1:2^length(x[,1])-1){
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
