#Jonathan Gross
#Midterm
# Start Time: 6:59 PM 3/14/2018
# Break: 8:13 - 8:58 PM


rm(list = ls())
setwd('C:/Users/jgros/Documents/GitHub/Midterm_EasyRasch')
library(devtools)
library(roxygen2)

current.code = as.package('easyRasch')
load_all(current.code)
document(current.code)


# Tests

##Test Rasch
### Test as empty object
test1 = new("Rasch")
test1
### Test with values
test2 = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
test2

## Test Prob Function
theta = 3.5
probFunction(test2,theta)
test2@name= "BetterJon"
test2@a =c(5,5,5)
test2@y = c(1,1,1)
probFunction(test2,theta)

## Test Likelihood Function
theta = 2
likelihoodFunction(test2,theta) ## Should return small value
thetaBetter = 5
likelihoodFunction(test2,thetaBetter) ## Should return larger value

## Test Prior Probability Function
priorProbFunction(theta)
dnorm(theta, mean = 0, sd = 3) ## Two Values shuold be equal

## Test EAP Funtion
test3 = new("Rasch", name="Jon",a =c(.1,.1), y =c(1,1))
### Test without limits specified
EAPFunction(test3,-6,6)
# 
# ## Debugging Integrate
# 
test3 = new("Rasch", name="Jon",a =c(.1,.1,.2), y =c(1,1,3))
raschObj = test3
numeratorFun = function(thetaInput){
  sapply(thetaInput,
         function(thetaInput) thetaInput*likelihoodFunction(raschObj,thetaInput)*priorProbFunction(thetaInput))
}
integrate(numeratorFun,-5,5)

numeratorFun(1)
numeratorFun(2)
numeratorFun(c(1,2))
numeratorFun = Vectorize(numeratorFun)
numeratorFun(2)
numeratorFun(c(1,2))

# testFun = function(x,y){x+y}
# integrate(testFun,0,5,y=0)
# 
# test3 = new("Rasch", name="Jon",a =c(.1,.1,.2), y =c(1,1,3))
# 
# numeratorFun = function(raschInput,thetaInput){
#   thetaInput*likelihoodFunction(raschInput,thetaInput)*priorProbFunction(thetaInput)
# }
# likelihoodFunction(test3,1)
# likelihoodFunction(test3,c(0,1))
# integrate(likelihoodFunction,raschObj=test3,-5,5)
# priorProbFunction(1)
# integrate(priorProbFunction,-5,5)
# numeratorFun(test3,1)
# integrate(numeratorFun,-6,6,raschInput = test3)
# 
# 
# PFun = function(raschObj,theta){
#   exp(theta-raschObj@a)/(1+exp(theta-raschObj@a))
# 
# }
# 
# sapply(c(1,2),PFun, raschObj = test3)
# 
# denFun = function(thetaInput){
#   likelihoodFunction(raschObj,thetaInput)*priorProbFunction(thetaInput)
# }
# 
# numerator = integrate(numeratorFun,lower,upper)
# denominator = integrate(denFun,lower,upper)
