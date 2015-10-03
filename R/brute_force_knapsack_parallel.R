# brute_force_knapsack_parallel <- function(x,W){
#   #stopifnot(is.data.frame(x) & x > 0 & names(x) == c("w","v"))
#   if(TRUE){
#   winnervalue <- 0
#   winnerpackets <-c()
#   rownum <- (2^length(x[,1])-1) * 32
# 
#     testfunc <- function(rownum){
#       
#       
#       weightsum <- 0
#       valuesum <- 0
#       packetschosen <-0
#       i <- 1:2^length(x[,1])-1
#       j <- 1:32
#       iandj <- expand.grid(j=j,i=i)
#       
#       binary <- intToBits(iandj$i[rownum])
#       
#       if( binary[iandj$j[rownum]] == TRUE ){
#         weightsum <- weightsum + x[iandj$j[rownum],1]
#         valuesum <- valuesum + x[iandj$j[rownum],2]
#         packetschosen <- iandj$j[rownum]
#       }
#       
#       
#       return(list(w=weightsum,v=valuesum,p=packetschosen))
#       
#     }
#   
#   listres <- parallel::mclapply(1:rownum,testfunc, mc.cores = 8)
#   
#   resvec <- unlist(listres) 
# 
#     testfunc2 <- function(i){
#       start <- 96*(i-1)+1
#       end <- 96*i
#       temp1 <- resvec[start:end]
#       weightsum <- sum(temp1[which(names(temp1) == "w")])
#       valuesum <- sum(temp1[which(names(temp1) == "v")])
#       packetschosen <- temp1[which(names(temp1) == "p")]
#       packetschosen <- packetschosen[-which(packetschosen == 0)]
#       packetschosen <-unname(packetschosen)
#       return(list(w=weightsum,v=valuesum,p=packetschosen))
#     }
# 
#   listres2 <- parallel::mclapply(1:(rownum * 3 / 96),testfunc2, mc.cores = 8)
#   
#   lengthy <-length(listres2)
# 
#   testfunc3 <- function(number){
#     if(listres2[[number]]$w > W){
#       return(list(v=0,p=c(0,0)))
#     }else{
#       return(list(v=listres2[[number]]$v,p=listres2[[number]]$p))
#     }
#   }
# 
#   listres3 <- parallel::mclapply(1:lengthy,testfunc3, mc.cores = 8)
#   values <- unlist(listres3)
#   values <- values[which(names(values)=="v")]
#   winnervalue <- max(values)
#   winnerpackets <- max.col(matrix(values,nrow=1)) 
#   return(list(value=round(winnervalue),elements = listres3[[winnerpackets]]$p))
#   
#   }
#   else{return("ha")}
# }
# 
# 
