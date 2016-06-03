function [ u ] = partition_matrix1 ( m ,d ) 
u = zeros(size(d));
d=abs(d);
for i = 1:size(d,1)
    for j = 1:size(d,2)
        for k = 1: size(d,2)
          if (i!=j && i!=k),
            u(i,j) = u(i,j) + (d(i,j)/d(i,k)).^( 1/(m-1));
            end
        end
    end
end
u = u + 1*(u==0); 
u = abs(u.^(-1));

end
