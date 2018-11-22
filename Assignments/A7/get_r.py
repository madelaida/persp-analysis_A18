# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 09:58:24 2018
Problem Set 7 - Question 2
@author: Maria Adelaida Martínez
"""
#Import packages
import numpy as np

def get_r(K, L, alpha, Z, delta):
    '''
    This function generates the interest rate or vector of interest rates
    '''
    K = np.array(K)
    L = np.array(L)
    r = alpha*Z*np.divide(L,K)**(1-alpha)-delta
    return r

#Random example to see if its working
K = [2,4,6,4,6]
L = [2,2,6,3,6]
#K = 2
#L = 4
alpha = 0.5
Z = 0.8
delta = 0.6
get_r(K, L, alpha, Z, delta)

