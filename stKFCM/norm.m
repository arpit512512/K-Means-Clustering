function [output] = norm(M)

n = size(M,1);
M = M.*M;
output = sqrt(sum(M,1));

end