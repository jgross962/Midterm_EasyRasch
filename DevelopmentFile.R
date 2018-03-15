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


