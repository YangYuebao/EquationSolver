
function LU_factorization(A;sparsed=false)
    #下三角L，Doolittle分解
    n,m=size(A)
    L=zeros(n,n)
    for i=1:n L[i,i]=1 end
    U=zeros(n,m)
    U[1,:]=A[1,:]
    L[:,1]=A[:,1]/A[1,1]
    for i=2:n-1
        U[i,i]=A[i,i]-L[i,1:i-1]' * U[1:i-1,i]
        U[i,i+1:m]=A[i,i+1:m]'-L[i,1:i-1]' * U[1:i-1,i+1:m]
        L[i+1:n,i]=(A[i+1:n,i]-L[i+1:n,1:i-1] * U[1:i-1,i])/U[i,i]
    end
    U[n,n:m]=A[n,n:m]' - L[n,1:n-1]' * U[1:n-1,n:m]
    return sparsed ? (sparsed(L),sparsed(U)) : (L,U)
end

function LU_solve(A,b)
    n=size(A,1)
    _,U0=LU_factorization(hcat(A,b))
    U=U0[:,1:end-1]
    y=U0[:,end]
    x=zeros(n)
    x[n]=y[n]/U[n,n]
    for i=n-1:-1:1
        x[i]=(y[i]-U[i,i+1:n]' * x[i+1:n])/U[i,i]
    end
    return x
end

function linearSolve(A,b,method::Symbol=:LU)
    
end