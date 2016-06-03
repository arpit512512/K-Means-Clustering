function [u_mod] = column_mod( u )
n = size(u,1);
a = abs(u.*u) ;
b = ones(n,1) * sum(a,1);
u_mod = sqrt(b) ; 
end



