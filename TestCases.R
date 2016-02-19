Please, run it from the console! :-)

source('C:/Users/Aliz/Desktop/Coursera_R/cachematrix.R')
testMatrix <- matrix(c(1,5,6,9),nrow=2)
specMatrix <- makeCacheMatrix(testMatrix)
cacheSolve(specMatrix) # first call on matrix, caching inverse
cacheSolve(specMatrix) # getting cached data

specMatrix$set(matrix(c(123,455,23,42),nrow=2)) #changing the original matrix
cacheSolve(specMatrix, testMatrix) # solves the equation [specMatrix %*% x = testMatrix] for x
cacheSolve(specMatrix, testMatrix) # getting cached data

#testing the correctness of matrix multiplication:
testMatrix2 <- cacheSolve(specMatrix, testMatrix)
settedMatrix <- matrix(c(123,455,23,42),nrow=2)
settedMatrix %*% testMatrix2
