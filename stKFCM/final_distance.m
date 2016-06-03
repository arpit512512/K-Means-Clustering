function [ d ] = final_distance( X , qt , Kt  ) 
[m , c] = size(qt);

n = size(X,1);
b = zeros(n,1);

for i = 1 : n
 b(i,1)= kernel_matrix(X(i,:),X(i,:),-0.5);
end 

Kxx = b * ones(1 , c) ;

Kx_Xt = kernel_matrix( X ,X( (floor(n/m)-1)*(m)+1 : floor(n/m)*m , :),-0.5);

d = Kxx + ones(n , 1)*(diag( qt' * Kt *qt))'  - 2 * Kx_Xt * qt ;

end