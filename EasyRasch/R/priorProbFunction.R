#' Calculates the prior probablitiy value
#'
#' Calcualtes the height of a zero mean, standard deviation = 3 normal distribution at specified point
#'
#' @param theta a numeric value representing a propsed theta value
#'
#' @return The hieght of the distribution at the specified value
#' @author Jonathan Gross <\email{jonathan.gross@@wustl.edu}>
#' @note uses dnorm to calculate height
#' @examples
#' theta = 3.5
#' priorProbFunction(theta)
#' @rdname priorProbFunction
#' @aliases priorProbFunction

#' @export
setGeneric(name="priorProbFunction",
           def=function(
                        theta = "numeric"
           ){
             standardGeneric("priorProbFunction")
           })

#' @export
setMethod(f="priorProbFunction",
          definition=function(theta="numeric"){
            # Use dnorm as per directions
            return(dnorm(theta,mean = 0, sd =3))
          }
)