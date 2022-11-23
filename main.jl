using LinearAlgebra

A=rand(4,4)

F=factorize(A)

F2=lu(A)