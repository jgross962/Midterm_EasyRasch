#' Calculates Probablity of correct response for Rasch Model
#'
#' Calcualtes probablitiy of a correct response given theta (ability) and a(difficulty parameter)
#'
#' @param raschObj an object containing a students name, ability and whether he got a question correct
#' @param theta a numeric value representing the ability of a student
#'
#' @return A data frame containing probability of a correct answer, and the probability of the students actual outcome
#' P.vector- a vector containing the probabilities the student gets a each correct
#' PQ- a vector containing the probabilities the student got the output he did
#' @author Jonathan Gross <\email{jonathan.gross@@wustl.edu}>
#' @note Probablity calculated as per equation 1 in documentation
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
            # Calculate P as per equation 1 in directions
              P.vector = exp(theta-raschObj@a)/(1+exp(theta-raschObj@a))
              # Q = 1 -P
              Q.vector = 1-P.vector

              # PQ should contain p if y is 1, else contains q
              # set all values to p, then update incorrect values to q using which() function on y vector
              PQ = P.vector
              PQ[which(raschObj@y==0)] = Q.vector[which(raschObj@y==0)]
              return(data.frame(P.vector,PQ))
            
          }
)

