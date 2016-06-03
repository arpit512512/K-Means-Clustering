function [qnorm] = meta_partition( ut , ualpha , wt , wa ,alpha , m )
n=size(ut,1);
c=size(ut,2);
qnorm = ones(n,c);
ut = ut.^m;
ualpha = ualpha.^m;
for k=1:c
  qnorm(1:n,k) = wt.*ut(1:n,k)  ;
  for i=1:n
    qnorm(i,k) = qnorm(i,k) + sum(alpha(i,1:c)'.*wa.*ualpha(1:c,k) , 1);
  end
  qnorm(1:n,k) = qnorm(1:n,k) ./ (norm(wt.*ut(1:n,k)) + norm(wa.*ualpha(1:c,k)));  
  %qnorm(1:n,k) = qnorm(1:n,k) ./ norm(qnorm(1:n,k));
end
end







%q = (wt .* (ut.^m)) + (alpha * (wa .* (ualpha .^ m)));

% firstTerm = column_mod(wt.*(ut.^m));
% secondTerm = ones(size(ut,1) , 1) * sqrt(sum((wa.*(ualpha.^m)),1));
%denominator = abs(column_mod(wt.*(ut.^m)))  +   abs(ones(size(ut,1) , 1) * sqrt(sum((wa.*(ualpha.^m)),1))) ;
%qnorm = abs(q./denominator) ;

