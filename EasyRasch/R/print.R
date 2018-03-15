#' Print Method for Rasch Object  
#'
#' Prints name and A posteriori estimate for theta
#'
#' @param raschObj an object containing a students name, ability and whether he got a question correct
#'
#' @author Jonathan Gross <\email{jonathan.gross@@wustl.edu}>
#' @note Calls EAPFunction 
#' @examples
#' 
#' testRaschObj = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
#' print(testRaschObj)
#' @rdname print
#' @aliases print

#' @export
setMethod(f="print",
          signature(x="Rasch"),
          definition=function(x){
            
            estimate = EAPFunction(x)
            print(paste("The EAP estimate for ",x@name, " is ", estimate))
            
          }
)

