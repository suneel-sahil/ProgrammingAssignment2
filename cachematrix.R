## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #stores the cached value
  #initialize to null
  inv<-NULL
  
  #create the matrix in the working environment
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  #get the value of the matrix
get<-function() x
#invert the matrix and store in cache
setInverse<-function(solveMatrix) inv<<-solveMatrix
#get the inverted matrix from cache
getInverse<-function() inv
#return the created functions to the working environment
list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<-x$getInverse()
  #else create the matrix in working environment
  if(!is.null(inv)){
    message("getting data")
    #display matrix in console
    return(inv)
  }
  #create matrix since it does not exist
  data<-x$get()
  #return inverse of matrix
  inv<-solve(data)
  x$setInverse(inv)
  inv
}
