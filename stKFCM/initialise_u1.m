function [ u  , a ] = initialise_u1( K , c ,m , X )
n = size(K,1);
  options = statset('Display','final','MaxIter' , 150);
  obj = gmdistribution.fit( X , c  , 'Options',options , 'CovType' , 'diagonal');
  a = obj.mu ;
%a = [ 2 4 ; 7 3 ; 3 8 ; 5 8 ];
   
d = zeros(size(n , c));

for i = 1: n 
    for j = 1:c
        d(i,j) = K(i , i ) + kernel_matrix( a(j,:) , a(j,:),-0.5 ) - 2*kernel_matrix( X(i,:) , a(j,:),-0.5 );
        
    end
end

d = d + 0.000001 * (d==0) ;
u = partition_matrix1(m , d);
end