function [ u  , idx ] = initialise_u( K , c ,m )

n = size(K,1);
a = randi(n , [c,1]);
idx = a;
Kii = diag(K)* ones(1,c) ;
Kjj = ones( n , 1) * K( sub2ind(size(K) , a' , a' )) ;

row=[] ;
column=[] ;
for i = 1:c
    column = [column ; ones(n,1)*a(i) ];
    row = [row ; [1 : n ]' ];
end


Kij = K(sub2ind(size(K) , row , column )) ;
Kij = reshape(Kij , n , c ) ; 
d = Kii + Kjj - 2*Kij ;
d = d + 0.000000001 * (d==0) ; 
u = partition_matrix1(m , d);
disp(u);
end




 
