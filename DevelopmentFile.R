
# 2.) Set Up Packages
rm(list = ls())
setwd('C:/Users/jgros/Desktop/5625/Poisson_Master/')
library(devtools)
library(roxygen2)

# 1.) Write Code
#6.) Can delete this after function is written into its own file
# poisson.lik = function(lambda,y){
#   n = length(y)
#   logl = sum(y)*log(lambda) - n*lambda
#   return(-logl)
# }

#3 Call This
#package.skeleton()

#4 -- Make man and empty folder, just have functions your wrote in r; delete NameSpace
### Want: man (empty),R(with function),Description

#5 update description file - package must match folderName

#7. Add Roxygen (copy and paste from other files) and add as appropriate

#8. Use Roxygen to document
setwd('C:/Users/jgros/Desktop/5625/Poisson_Master')
current.code = as.package('poissonLikelihood')
load_all(current.code)
document(current.code)

#9 Go to description and add
# Collate:
#   'poisson.lik.R'

# 1a.) Test
y = 1:4
lambda = 2
poisson.lik(lambda,y)
new("Poisson")

#10 Add Class (See Poisson File)
#10a. Rerun 8
#11 Update Function poisson.lik

