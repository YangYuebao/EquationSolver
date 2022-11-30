using EquationSolver

A=rand(4,5)
LUA=LU_factorization(A)

B=rand(4,3)
LUB=LU_factorization(B)

C=rand(1000,1000)
b=rand(1000)

@time LU_solve(C,b)