#' Calculates Probablity of correct response for Rasch Model
#'
#' Calcualtes probablitiy of a correct response given theta (ability) and a(difficulty parameter)
#'
#' @param raschObj an object containing a students name, ability and whether he got a question correct
#' @param theta a numeric value representing the ability of a student
#'
#' @return A data frame containing Probabiltiy of a correct answer(P.vector), and the probability of the students actual outcome (PQ)
#' @author Jonathan Gross <\email{jonathan.gross@@wustl.edu}>
#' @note Add If desired
#' @examples
#' testRaschObj = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
#' theta = 3.5
#' probFunction(test1,theta)
#' @rdname probFunction
#' @export
probFunction <-
function(raschObj, theta){
  # Probability as calculated by Eq 1
  P.vector = exp(theta-raschObj@a)/(1+exp(theta-raschObj@a)
  Q.vector = 1-P.vector

  PQ = P.vector 
  PQ[which(y==1)] = Q.vector[which(y==1)]
  return(data.frame(P,PQ))
}
