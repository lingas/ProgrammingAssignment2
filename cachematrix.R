## makeCacheMatrix  : Creation of Matrix Object with 4 funcations
##                    1. Get the raw matrix
##                    2. Set matrix
##                    3. Get the inverse of the matrix
##                    4. Set the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        
        xInverse <- NULL
        
        # Set new matrix and set its inverse to NULL
        set <- function(y) {
                x <<- y
                xInverse <<- NULL
        }
        
        # Get the matrix
        get <- function() {
                x       
        }
        
        # Set the inverse of the matrix
        setInverse <- function(inv){ 
                xInverse <<- inv
        }
        
        # Get the inverse of the matrix
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
        ## Retrieve the inverse of the matrix 
        inv <- x$getInverse()
        
        ## If inverse is valid/exist return the inverse from cache 
        if(!is.null(inv)) {
                message("Getting cached data")
                return(inv)
        }
        # Calculate the inverse of the matrix and store it in the matrix cache
        message("Saving newly computated inverse to cache")
        data <- x$get()
        inv <- solve(data,...)
        x$setInverse(inv)
        return(inv)
}
