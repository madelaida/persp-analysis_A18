#Applied Microeconometrics
#Problem Set 6.
#Maria Adelaida Martinez
#Question 2. b. 

#Sum even Fibonacci sequence: For this solution I found that every third fibonacci number 
#starting by 1,1 is even, and that follows the equation: EFn = 4*EFn-1 + EFn-2. Starting by 0 and 2.
#https://www.geeksforgeeks.org/nth-even-fibonacci-number/
  
#Starting values 
  n1<-0
  n2<-2
  sum <- n1 + n2
  while (n2 < 4000000){
    
    n3 <- 4*n2 + n1
    n1 <- n2
    n2 <- n3
    sum <- sum + n2
  } 
 #Correct sum by last term
  sum_ev <- sum - n2
