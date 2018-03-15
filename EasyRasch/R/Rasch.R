#' A Rasch Object
#'
#' Object of class \code{Rasch} is useed by the \code{probFunction}
#'
#'
#' An object of the class `Rasch' has the following slots:
#' \itemize{
#' \item \code{name} The name of the student
#' \item \code{a} A vector containing difficulty parameters 
#' \item \code{y} A vector containing responses of student (1 = correct, 0 =wrong)
#' }
#'
#' @author Jonathan Gross: \email{jonathan.gross@@wustl.edu}
#' @aliases Rasch-class initialize
#' @rdname Rasch
#' @export
setClass(Class="Rasch",
         representation = representation(
           name = "character",
           a = "numeric",
           y = "numeric"
         ),
         prototype = prototype(
           name= c(),
           a = c(),
           numeric()
         )
)
#Set Initalize Method
#' @export
setMethod("initialize","Rasch",
          function(.Object,...){
            value = callNextMethod()
            validObject(value)
            return(value)
          }
)

#Check User has properly created Rasch Object Properly
#' @export
setValidity("Rasch",function(object){
  if (class(object@name) != "character"){
    return("@name is not a valid value")
  }
  if (class(object@a) != "numeric"){
    return("@a is not a valid value")
  }
  if (class(object@y) != "numeric"){
    return("@y is not a valid value")
  }
  if (length(object@a) != length(object@y)){
    return("@a and @y must have the same length and do not")
  }
})
