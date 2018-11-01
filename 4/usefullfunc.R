rx = function(a,rw,l=1000){
  return(rw*(a/(l-a)))
}
isApproved = function(row){
  return(abs(row-mean(row))<sd(row))
}
approvedMean = function(table){
  return(mean(table$RX[table$approved]))
}
approvedSd= function(table){
  return(sd(table$RX[table$approved]))
}

updateMeanTable = function(){
mean$mean=c(approvedMean(R1),approvedMean(R2),approvedMean(R1R1szereg),approvedMean(R1R2rown))
mean$n=c(sum(R1$approved),sum(R2$approved),sum(R1R1szereg$approved),sum(R1R2rown$approved))
mean$sd=c(approvedSd(R1),approvedSd(R2),approvedSd(R1R1szereg),approvedSd(R1R2rown))
mean$sdsqrtn=mean$sd/sqrt(mean$n)
}
