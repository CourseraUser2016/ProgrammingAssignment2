## Put comments here that give an overall description of what your
## functions do

## This "list" that is able to set the value of the matrix to be inverted, 
## to get the value of the matrix to be inverted
## to set the value of the inverse matrix
## to get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function checks if the inverse exists; if it does then it retrieves it
## otherwise it creates it and sets it in the global environment

cacheSolve <- function(x) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
