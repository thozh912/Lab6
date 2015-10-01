#' A dynamic programming solution to 0/1 Knapsack problem
#' 
#' This function solves the 0/1 Knapsack problem using dynamic programming
#' 
#' The Knapsack problem is a combinatorial optimization problem
#' where one tries to fill a limited weight knapsack with objects
#' of as high a total value as possible. Every object has a positive
#' weight and value associated with itself.
#' 
#' @param x A data.frame with two columns named in order \code{"w"} and \code{"v"}
#'  Every row in \code{x} is an object with weight \code{w} and value \code{v}.
#'  
#' @param W A numeric scalar which is the limit of the weight the knapsack can carry.
#' 
#' @return \code{list} A list with names \code{$value}, telling the maximum value of the knapsack
#'  and \code{$elements} which indicates which row objects in data.frame \code{x} was put
#'  in the knapsack.
#' @examples
#'  knapsack_dynamic(data.frame(w=c(20,30,40,50),v=c(2,2,1,2)),W =20)
#'  
#' @references \url{http://en.wikipedia.org/wiki/Knapsack_problem}  
#'
  
knapsack_dynamic <- function(x, W){
  m <- matrix(0, nrow = length(x[,1]) + 1, ncol = W + 1 )
  for(i in 1:length(x[,1])){
    for(j in 0:W){
      if( x[i,1] <= j) {
  
        m[i+1,j+1] <- max( m[i, j+1], m[i, j+1-x[i, 1]] + x[i, 2])
      }
      else {
        
        m[i+1,j+1] <- m[i, j+1]
      
    }
    }
  }
  
  element <- c()
  pointer <- m[length(x[,1]) + 1, W + 1]
  position <- c(length(x[,1]) + 1, W + 1)
  for(i in (length(x[,1]) + 1):2){
   
      if(m[i,position[2]] == m[i-1,position[2]]) {
        pointer <- m[i-1, W]
        position[1] <- position[1] - 1
      }
      else {
        pointer <- m[ i- 1, position[2] - x[i-1, 1]]
        position[2] <- position[2]- x[i-1,1]
        position[1] <- position[1] - 1
        element <- c(element,i-1)
      }
    
   }

  values <- m[length(x[,1]) + 1,W + 1]
  result <- list(value = values, elements = element )
  
 return(result)
}
