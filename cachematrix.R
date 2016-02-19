## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix
## rather than compute it repeatedly. You can use the following pair of functions to cache the inverse of a matrix, but
## also to solve a linear equations, putting an additional argument (...) in the cacheSolve function defined below. For
## this, pull up the help for the "solve" function.

## The function "makeCacheMatrix" makes a list of 4 functions, which makes it possible to cache a value calculated
## earlier with the function "cacheSolve". The elements of the list named the same way as the functions themselves,
## so for instance you can change the original input matrix the following way:

## testMatrix <- matrix(c(1,5,6,9),nrow=2)         -- original matrix
## specMatrix <- makeCacheMatrix(testMatrix)       -- special list with the 4 functions
## specMatrix$set(matrix(c(123,455,23,42),nrow=2)) -- matrix redifined

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setInv <- function(calc) inverse <<- calc
    getInv <- function() inverse
    list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## The "cacheSolve" function calculates the inverse of the special "matrix" created with the above function. However, it first
## checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
    inverse <- x$getInv()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data, ...)
    x$setInv(inverse)
    inverse
}
