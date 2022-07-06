#I learned how to use the ... argument :)
test_function <- function(x, ..., y = 1, z = 1){
  
  x + y + z
}

higher_function<- function(x, ...){
  test_function(x,...)
}
higher_function(x = 4, y = 2, z = 0)
