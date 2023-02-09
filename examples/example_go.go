func factorial(n uint64) (result uint64){
    if(n >0){
       result = n*factorial(n-1)
       return result
    }
    return 1
 }