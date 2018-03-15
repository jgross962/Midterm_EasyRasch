#' Calculates Likelihood of proposed theta value 
#'
#' Calcualtes the like likelihood using rasch model of a proposed theta value, using product of probablities
#'
#' @param raschObj an object containing a students name, ability and whether he got a question correct
#' @param theta a numeric value representing a propsed theta value
#'
#' @return The likelihood - the probablitiy that the proposed theta value is correct given the data
#' @author Jonathan Gross <\email{jonathan.gross@@wustl.edu}>
#' @note Has some redundancy with probFunction
#' @examples
#' 
#' testRaschObj = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
#' theta = 3.5
#' likelihoodFunction(test1,theta)
#' @rdname likelihoodFunction
#' @aliases likelihoodFunction

#' @export
setGeneric(name="likelihoodFunction",
           def=function(raschObj = "Rasch",
                        theta = "numeric"
           ){
             standardGeneric("likelihoodFunction")
           })

#' @export
setMethod(f="likelihoodFunction",
          definition=function(raschObj="Rasch",theta="numeric"){
            P.vector = exp(theta-raschObj@a)/(1+exp(theta-raschObj@a))
            Q.vector = 1-P.vector
            PQ = P.vector
            PQ[which(raschObj@y==0)] = Q.vector[which(raschObj@y==0)]
            return(prod(PQ))
            
          }
)
