#Jonathan Gross
#Midterm
# Start Time: 6:59 PM 3/14/2018


# 2.) Set Up Packages
rm(list = ls())
setwd('C:/Users/jgros/Documents/GitHub/Midterm_EasyRasch')
library(devtools)
library(roxygen2)

# 1.) Write Code
#6.) Can delete this after function is written into its own file
# probFunction = function(raschObj, theta){
#   P.vector = exp(theta-raschObj@a)/(1+exp(theta-raschObj@a))
#   Q.vector = 1-P.vector
#   return(P.vector)
# }
# 


#3 Call This
#package.skeleton()

#4 -- Make man and empty folder, just have functions your wrote in r; delete NameSpace
### Want: man (empty),R(with function),Description

#5 update description file - package must match folderName

#7. Add Roxygen Documentation (copy and paste from other files) and add as appropriate

#8. Use Roxygen to document
setwd('C:/Users/jgros/Documents/GitHub/Midterm_EasyRasch')
current.code = as.package('easyRasch')
load_all(current.code)
document(current.code)

#9 Go to description and add
# Collate:
#   'poisson.lik.R'

# 1a.) Test
#Test Rasch
test1 = new("Rasch")
test2 = new("Rasch", name="Jon",a =c(2,4,3), y =c(1,1,0))
theta = 3.5
probFunction(test1,theta)


#10 Add Class (See Poisson File)
#10a. Rerun 8
#11 Update Function poisson.lik

