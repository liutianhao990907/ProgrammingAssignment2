## This pair of functions give the inverse of a matrix.
## First check whether there is cache value. If not, calculate one.

## This function returns a list of functions, which can get or set the matrix or its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL   #create an empty matrix to store the inverse
  set<-function(y){  #initiate the matrix
    x<<-y
    i<<-NULL
  }
  get<-function() x  #get the matrix
  setinverse<-function(inverse) i<<-inverse  #set the inverse matrix
  getinverse<-function() i  #get the inverse matrix
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)  #return a list of functions
}


## This function first checks whether there is cache value of inverse
## If not, calculate one and save it.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i<-x$getinverse() 
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  i<-solve(data)
  x$setinverse(i)
  i
}
