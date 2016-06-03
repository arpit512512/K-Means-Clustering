function [ u ] = partition_matrix ( m ,d )
format long 
numerator = d.^( 1/(m-1) );
c=size(d,2);

%working on denominator
% matking a matrix with value d(xi,vk)^(1/(1-m))
a =  d .^ (1/(1-m)) ;
b = sum(a,2) ;                            %column matrix of mx1
denominator = (b * ones(1,c)) ;

u = ( numerator ./ denominator ).^(-1) ;

end










