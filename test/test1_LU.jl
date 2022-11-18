using EquationSolver

A=rand(4,5)
LUA=LU_factorization(A)

B=rand(4,3)
LUB=LU_factorization(B)

C=rand(5,5)
b=rand(5)

LU_solve(C,b)