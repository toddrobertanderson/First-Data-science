

## These functions allow the calculating of a matrix inverse, caching it, and retreiving or recalculating the next inverse

##this function is run first to store the input matrix and supply the caching functions
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  
  getinverse <-function () m
 
  
  get<-function() {x}
  setinverse<-function (inverse) {m<<-inverse}
  
  list(getinverse=getinverse, get=get, setinverse=setinverse)
}


## This function is run second to use the previously defined functions, access the cached information, and solve the matrix inverse

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x' supplied in the first function
  m<- x$getinverse()
  if(is.null(m)){message("calculating new inverse")}

  data<-x$get()
  
  m<- solve(data,...)
  x$setinverse(m)
  return(m)
}