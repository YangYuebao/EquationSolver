module EquationSolver

using SparseArrays

include("LinearEquations.jl")

export 
    # LU分解和LU分解法解线性方程组
    LU_factorization,LU_solve

end # module
