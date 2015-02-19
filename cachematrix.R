## makeCacheMatrix  : Creation of Matrix Object with 4 funcations
##                    1. Get the raw matrix
##                    2. Set matrix
##                    3. Get the inverse of the matrix
##                    4. Set the inverse of the matrix

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


## cacheSolve  : Find the inverse of the matrix , if inverse have been calcuated before 
##               retrieve inverse from cache else calculate the inverse and store in cache
## Returns the inverse of the matrix 

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
        return(inv)
}
