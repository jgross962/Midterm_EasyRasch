#' Calculates Expected A posteriori value for proposed theta  
#'
#' Calcualtes Expected A posteriori value using Rasch model, as a fucntion of the RaschObject (data)
#'
#' @param raschObj an object containing a students name, ability and whether he got a question correct
#' @param lower lower bound of integration; defaults to -6 if not specified
#' @param upper upper bound of integration; defaults to 6 if not specified
#'
#' @return Expected value of theta
#' @author Jonathan Gross <\email{jonathan.gross@@wustl.edu}>
#' @note Calls likelihoodFunction and priorProbFunction
#' @examples
#' 
#' testRaschObj = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
#' EAPFunction(test1,-5,5)
#' @rdname EAPFunction
#' @aliases EAPFunction

#' @export
setGeneric(name="EAPFunction",
           def=function(raschObj = "Rasch",
                        lower = -6,
                        upper = 6
           ){
             standardGeneric("EAPFunction")
           })

#' @export
setMethod(f="EAPFunction",
          definition=function(raschObj="Rasch",lower=-6, upper = 6){
              numeratorFun = function(thetaInput){
                sapply(thetaInput,
                       function(thetaInput) thetaInput*likelihoodFunction(raschObj,thetaInput)*priorProbFunction(thetaInput))
              }
            denFun = function(thetaInput){
              sapply(thetaInput,
                     function(thetaInput) likelihoodFunction(raschObj,thetaInput)*priorProbFunction(thetaInput))
            }
         
            print(paste("Lower",lower))
            print(paste("Upper",upper))
            
            numerator = integrate(numeratorFun,lower = lower,upper = upper)
            print(numerator)
            # numerator = integrate(numeratorFun,-6,6)
            # print(numerator)
            # 
            denominator = integrate(denFun,lower,upper)
            return(numerator[[1]]/denominator[[1]])
          }
)

