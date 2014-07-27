## This R program file has a pair of functions to cache 
## inversion of a matrix and return it instead of 
## computing it everytime.

## makeCacheMatrix function creates a special "matrix" object 
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x

## Cache the inverse

    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv

## Return a vecor of functions
 
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    

}

## cacheSolve function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'

    inv <- x$getinverse()

## Check if inverse is already available. If so, return the 
## calculated value

    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

## Calculate inverse of the given Matix

    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv

}
