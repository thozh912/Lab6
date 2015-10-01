#' Greedy heuristic solver for the Knapsack problem 
#'
#'  This function solves the Knapsack problem using a greedy heuristic approach.
#'  It does not return an exact result but is computationally faster than the other 
#'  approaches in this package.
#'  
#'   @param x A data.frame with two columns named in order \code{"w"} and \code{"v"}
#'  Every row in \code{x} is an object with weight \code{w} and value \code{v}.
#'  
#'  @param W A numeric scalar which is the limit of the weight the knapsack can carry.
#'   
#'   @return \code{list} A list with names \code{$value}, telling the maximum value of the knapsack
#'  and \code{$elements} which indicates which row objects in data.frame \code{x} was put
#'  in the knapsack.
#'  
#'  @examples
#'  greedy_knapsack(data.frame(w=c(20,30,40,50),v=c(2,2,1,2)),W =200)
#'  
#'  @references \url{http://en.wikipedia.org/wiki/Knapsack_problem} 


greedy_knapsack <- function(x, W){
  valuable <- vector(length = length(x[,1]))
  
  for(i in 1:length(x[,1])){
    valuable[i] <- x[i,2] / x[i,1]
  }
  
  sortlist <- sort(valuable,decreasing = TRUE,index.return= TRUE)
  sortedweights <- x[,1][sortlist$ix]
  sortedvalues <- x[,2][sortlist$ix]
  totalweights <- 0
  totalvalues <- 0
  i <- 1
 while(totalweights <= W & i <= length(sortedweights)){
   if(sortedweights[i] + totalweights > W){
     break
   }
   else{
   totalweights <- sortedweights[i] + totalweights
   totalvalues <- sortedvalues[i] + totalvalues
   i <- i+1
   }
 }
  result <- list(value = totalvalues, elements = sortlist$ix[1:i-1])
  return(result)
}

