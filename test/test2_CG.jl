using EquationSolver, LinearAlgebra
A=rand(5,5)
A=A+A'+2*I
b=2*rand(5)

x,_=CG_solve(A,b)
