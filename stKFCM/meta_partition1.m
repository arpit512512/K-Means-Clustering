function [qnorm] = meta_partition1( ut , ualpha , wt , wa ,alpha , m )
q = (wt .* (ut.^m)) + (alpha * (wa .* (ualpha .^ m)));

% firstTerm = column_mod(wt.*(ut.^m));
% secondTerm = ones(size(ut,1) , 1) * sqrt(sum((wa.*(ualpha.^m)),1));
denominator = column_mod(wt.*(ut.^m))  +   ones(size(ut,1) , 1) * sqrt(sum((wa.*(ualpha.^m)),1)) ;
qnorm = q./denominator ;

end
