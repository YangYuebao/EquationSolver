module EquationSolver

using SparseArrays, LinearAlgebra

include("LinearEquations.jl")

export 
    # LU分解和LU分解法解线性方程组
    LU_factorization,LU_solve,
    # 共轭梯度法
    CG_solve
end # module
