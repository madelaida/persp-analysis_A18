# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 09:14:57 2018
Problem Set 7 - Question 1.1
@author: Maria Adelaida Martinez C
"""
def smallest_factor(n):
    """Return the smallest prime factor of the positive integer n."""
    if n==1: return 1
    for i in range(2, int(n**.5)):
        if n % i == 0: return i
        return n
    
#Test for zero and negative values
def test_smallest_factor():
    assert smallest_factor(0)==None, "error"
    assert smallest_factor(-1)==None, "error"

#New corrected function
def smallest_factor_new(n):

    if n <= 0 or n-int(n)!= 0:
        #print("Non positive")
        return None
    
    if n == 1: return 1        
    for i in range(2, int(n**.5)):
        if n%i == 0: return i
    
    return n