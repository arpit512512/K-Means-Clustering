function [U]=kernel_fcm(k,m,X,init)
global K
K = kernel_matrix(X , X , -0.5);
K = K + 0.00000000000000000000001*(K==0);
% Inputs;
% K - N x N kernel matrix, e.g. H = (X*X'+1).^2
% k - number of clusters
% m - fuzzifier, m > 1
% init - (1 x k) initialization labels
%
% Outputs:
% U - (k x N) partition matrix

N=size(K,1);
if(nargin < 3)
    init=randperm(N);
end;
U=full(sparse(1:k,init(1:k),1,k,N,N));
m2=2/(m-1);

t=0; max_iter=10000; eps = 1e-3; % stop criterion
Uold=zeros(k,N);

while(max(abs(U(:)-Uold(:)))>eps && t<max_iter)
    %tic
    Uold=U;
    U=U.^m;
    U=bsxfun(@rdivide,U,sum(U,2));
    
    T=U*double(K);
    D=bsxfun(@plus,-2*T,diag(T*U'));
    D=bsxfun(@plus,D,double(diag(K))');
    
    U=1./bsxfun(@times,D.^m2,sum((1./D).^m2,1));
    U(isnan(U))=1;
    t=t+1;
    %toc
end;