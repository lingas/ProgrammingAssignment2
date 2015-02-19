## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        
        xInverse <- NULL
        
        # Create 4 function to get/set raw matrix and get/set inverse
        set <- function(y) {
                x <<- y
                xInverse <<- NULL
        }
        
        get <- function() {
                x       
        }
        
        setInverse <- function(inv){ 
                xInverse <<- inv
        }
        
        getInverse <- function(){
                xInverse
        }
        
        # List of function
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
        
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        
        if(!is.null(inv)) {
                message("Getting cached data")
                return(inv)
        }
        message("Saving newly computated inverse to cache")
        data <- x$get()
        inv <- solve(data,...)
        x$setInverse(inv)
        inv
}
