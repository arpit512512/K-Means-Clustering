function [ uNormalised ] = get_u_normalised ( u , m )
% u : partition matrix
% m : fuzzification factor
n=size(u,1);

%each row is same and equal to the value of sum of the repective column of
%u
sumOfColumn= ones(n,1) * ((sum(u,1)).^m);

uNormalised = (u.^m)./sumOfColumn ;

end
