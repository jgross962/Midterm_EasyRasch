probFunction <-
function(raschObj, theta){
  P.vector = exp(theta-raschObj@a)/(1+exp(theta-raschObj@a))
  Q.vector = 1-P.vector
  return(P.vector)
}
