#Jonathan Gross
#Midterm -Spring 2018
# Start Time: 6:59 PM 3/14/2018
# Break: 8:13 - 8:58 PM

# Clear Workspace
rm(list = ls())
setwd('C:/Users/jgros/Documents/GitHub/Midterm_EasyRasch')
library(devtools)
library(roxygen2)

## Rerun this section everytime a function is changed or added
#package.skeleton() # Run in very beginning to format code into a package
current.code = as.package('easyRasch')
load_all(current.code)
document(current.code)


# Tests

##Test Rasch
test1 = new("Rasch", name="Jon",a =1, y =1)
test1
test2 = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
test2
### Test to ensure set Validity works 
testBad1 = new("Rasch", name=3,a =c(2,4,3), y =c(1,1,0))
testBad2 = new("Rasch", name="Jon",a =c(2,4,3,5), y =c(1,1,0))


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
test3 = new("Rasch", name="Jon",a =c(1,.1,2), y =c(1,1,0))
### Test with limits specified
EAPFunction(test3,-6,6)
EAPFunction(test3,-15,15) # Shuold be slightly higher than above result
EAPFunction(test3,-25,25)# Shuold be similar to above
test4 = new("Rasch", name="Jon2",a =c(1,1.5,2), y =c(1,1,1)) ## Should get higher EAP estimates since got harder questions right
EAPFunction(test4,-6,6)
EAPFunction(test4,-15,15) # Shuold be slightly higher than above result
EAPFunction(test4,-25,25)# Shuold be similar to above 
### Test w/o limits specified (should match result above for bounds +/- 6)
EAPFunction(test3) 
est = EAPFunction(test4)

## Test Print
print(test3) # Print Rasch Object
print("hello") # Print non-rasch object
