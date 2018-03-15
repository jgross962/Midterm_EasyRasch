#' Calculates Probablity of correct response for Rasch Model
#'
#' Calcualtes probablitiy of a correct response given theta (ability) and a(difficulty parameter)
#'
#' @param raschObj an object containing a students name, ability and whether he got a question correct
#' @param theta a numeric value representing the ability of a student
#'
#' @return A data frame containing probability of a correct answer, and the probability of the students actual outcome
#' \item \code{P.vector} a vector containing the probabilities the student gets a each correct
#' \item \code{PQ} a vector containing the probabilities the student got the output he did
#' @author Jonathan Gross <\email{jonathan.gross@@wustl.edu}>
#' @note Add If desired
#' @examples
#' 
#' testRaschObj = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
#' theta = 3.5
#' probFunction(test1,theta)
#' @rdname probFunction
#' @aliases probFunction

#' @export
setGeneric(name="probFunction",
           def=function(raschObj = "Rasch",
                        theta = "numeric"
           ){
             standardGeneric("probFunction")
           })

#' @export
setMethod(f="probFunction",
          definition=function(raschObj="Rasch",theta="numeric"){
              # Probability as calculated by Eq 1
              P.vector = exp(theta-raschObj@a)/(1+exp(theta-raschObj@a))
              Q.vector = 1-P.vector

              PQ = P.vector
              PQ[which(y==1)] = Q.vector[which(y==1)]
              return(data.frame(P.vector,PQ))
            
          }
)


## IF S3 Instead
# probFunction <-
# function(raschObj, theta){
#   # Probability as calculated by Eq 1
#   P.vector = exp(theta-raschObj@a)/(1+exp(theta-raschObj@a)
#   Q.vector = 1-P.vector
# 
#   PQ = P.vector 
#   PQ[which(y==1)] = Q.vector[which(y==1)]
#   return(data.frame(P.vector,PQ))
# }
