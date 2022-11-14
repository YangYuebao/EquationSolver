A=rand(4,4)

n=size(A,1)
L=Matrix{Float64}(I,n,n)
U=zeros(n,n)
U[1,:]=A[1,:]
L[:,1]=A[:,1]/A[1,1]
for i=2:n-1
    U[i,i]=A[i,i]-L[i,1:i-1]' * U[1:i-1,i]
    U[i,i+1:n]=A[i,i+1:n]'-L[i,1:i-1]' * U[1:i-1,i+1:n]
    L[i+1:n,i]=(A[i+1:n,i]-L[i+1:n,1:i-1] * U[1:i-1,i])/U[i,i]
end
U[n,n]=A[n,n] - L[n,1:n-1]' * U[1:n-1,n]