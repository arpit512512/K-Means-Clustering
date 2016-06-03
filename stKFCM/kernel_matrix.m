function [K] = kernel_matrix (x1 , x2 ,sigma)
m=size(x1,1);
n=size(x2,1);

%making a temp. matrix having repeated columns
X1= sum (x1.*x1,2) * ones(1,n) ;
X2=ones(m,1) * (sum( x2.*x2,2))' ;

%evaluating the kernel using ( ||xi - xj||^2 =sum ( xi^2 + xj^2 - 2*xi*xj ) )
k = X1 + X2 - 2*( x1 * x2' );
K = exp ( sigma * k );

end



