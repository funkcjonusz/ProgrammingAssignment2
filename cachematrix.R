## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL              ## s is our 'inverse matrix' and it's reset to NULL every    
  set <- function(y) {   ## function set original matrix/data without calculating inverse matrix
    x <<- y
    m <<- NULL
  }
  get <- function() x    ## function returns the original matrix
  setsolve <- function(solve) s <<- solve ## set external solution (inverse matrix) to internal s
  getsolve <- function() s                ## function returns inveerse matrix
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()     # accesses the object 'x' and gets the inverse matrix
  if(!is.null(s)) {     # if inverse matrix was already calculated return it an print message
    message("getting cached data")
    return(s)
  }
  data <- x$get()       # get data(matrix) from x 
  s <- solve(data)      # calulate inverse matrix
  x$setsolve(s)         # save inverse matrix, as cache, in x
  s

}
