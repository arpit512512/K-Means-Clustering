function [ u  ] = initialise_u2(K , c)
n = size(K,1);
u = [ones(c , c ); zeros(n-c , c) ];
end