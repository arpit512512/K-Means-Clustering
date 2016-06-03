function [ d ] = distance_matrix( u , K , m)
%u = get_u_normalised ( u , m );
n=size(u,1);
c=size(u,2);
d=zeros(n,c);
for k=1:c
    M = K*u(1:n,k);
    secondTerm = u(1:n,k)'*K*u(1:n,k);
    for i=1:n
        firstTerm = K(i,i);
        thirdTerm = M(i);
        d(i,k) = abs(firstTerm + secondTerm - 2*thirdTerm);
    end
end
d = get_u_normalised(d,1);
end
%uNormalised = get_u_normalised ( u , m );
%c = size(u,2);
%n = size(u,1);

% d(xi,vj) = unorm(j)'*K*unorm(j) + Kii - 2*(unorm(j)'*K)i
% considering only the first term ,if we take (unorm'*K*unorm ) it will be
% a cxc matrix whose diagonal values will hav the values of the products derired
% for all the centroid pts


%a = uNormalised' * K * uNormalised ;
%diag_a = (diag(a))';
%firstTerm = ones(n,1)* diag_a ;

%secondTerm = diag(K) * ones(1,c) ;

%thirdTerm = 2 * (uNormalised' * K )' ;

%d = abs(firstTerm + secondTerm - thirdTerm) ; 

%end