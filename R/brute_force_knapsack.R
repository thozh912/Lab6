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
#'  @param parallel It is set to FALSE as default, if you set it to TRUE the function will be parallellized.
#'  
#'  @return \code{list} A list with names \code{$value}, telling the maximum value of the knapsack
#'  and \code{$elements} which indicates which row objects in data.frame \code{x} was put
#'  in the knapsack.
#'  
#'  @examples
#'  brute_force_knapsack(data.frame(w=c(20,30,40,50),v=c(2,2,1,2)),W =20, parallel = FALSE)
#'  
#'  @references \url{http://en.wikipedia.org/wiki/Knapsack_problem}  
#'


brute_force_knapsack <- function(x,W, parallel = FALSE){
  #stopifnot(is.data.frame(x) & x > 0 & names(x) == c("w","v"))
  if(parallel == TRUE){
    winnervalue <- 0
    winnerpackets <-c()
    rownum <- (2^length(x[,1])-1) * 32
    
    testfunc <- function(rownum){
      
      
      weightsum <- 0
      valuesum <- 0
      packetschosen <-0
      i <- 1:(2^length(x[,1])-1)
      j <- 1:32
      iandj <- expand.grid(j=j,i=i)
      
      binary <- intToBits(iandj$i[rownum])
      
      if( binary[iandj$j[rownum]] == TRUE ){
        
        weightsum <- weightsum + unname(x[iandj$j[rownum],1])
        
        valuesum <- valuesum + unname(x[iandj$j[rownum],2])
        
        packetschosen <- iandj$j[rownum]
      }
      
      
      return(list(w=weightsum,v=valuesum,p=packetschosen))
      
      
    }
    
    listres <- parallel::mclapply(1:rownum,testfunc, mc.cores = 8)
    
    resvec <- unlist(listres) 
    
    testfunc2 <- function(i){
      start <- 96*(i-1)+1
      end <- 96*i
      temp1 <- resvec[start:end]
      
      weightsum <- sum(temp1[which(names(temp1) == "w")])
      weightsum <- unname(weightsum)
      valuesum <- sum(temp1[which(names(temp1) == "v")])
      valuesum <-unname(valuesum)
      packetschosen <- temp1[which(names(temp1) == "p")]
      packetschosen <- packetschosen[-which(packetschosen == 0)]
      packetschosen <-unname(packetschosen)
      return(list(w=weightsum,v=valuesum,p=packetschosen))
    }
    
    listres2 <- parallel::mclapply(1:(rownum * 3 / 96),testfunc2, mc.cores = 8)
    
    lengthy <-length(listres2)
    
    testfunc3 <- function(number){
      if(listres2[[number]]$w > W){
        return(list(v=0,p=c(0,0)))
      }else{
        return(list(v=unname(listres2[[number]]$v),p=unname(listres2[[number]]$p)))
      }
    }
    
    listres3 <- parallel::mclapply(1:lengthy,testfunc3, mc.cores = 8)
    
    values <- unlist(listres3)
    values <- values[which(names(values)=="v")]
    winnervalue <- max(values)
    winnerpackets <- max.col(matrix(values,nrow=1)) 
    return(list(value=round(unname(winnervalue)),elements = listres3[[winnerpackets]]$p))
    
  }
  else{
    winnervalue <- 0
    winnerpackets <-c()
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
    
    return(list(value=round(unname(winnervalue)),elements=winnerpackets))
  }
}
  


