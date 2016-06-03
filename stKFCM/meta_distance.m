function [ d ] = meta_distance(alpha , K , qnorm )
%qnorm = get_u_normalised ( qnorm , 1.7 );
%alpha = get_u_normalised ( alpha , 1.7 );
n=size(alpha,1);
c=size(alpha,2);
d=zeros(c,c);
for i=1:c
    for k=1:c
        firstTerm = alpha(1:n,i)'*K*alpha(1:n,i);
        secondTerm = qnorm(1:n,k)'*K*qnorm(1:n,k);
        thirdTerm = alpha(1:n,i)'*K*qnorm(1:n,k);
        d(i,k) = abs(firstTerm + secondTerm - 2*thirdTerm);
    end
end
d = get_u_normalised(d,1);
end





%c = size(alpha , 2);
%firstTerm = diag(alpha'* K *alpha) * ones(1,c);
%secondTerm = ones(c,1) * (diag(qnorm' * K * qnorm))';
%thirdTerm = 2 * alpha' * K * qnorm ;
%d = firstTerm + secondTerm - thirdTerm ;
%d = d + 0.0000000001 .* (d== 0 ) ;
%d=abs(d);
%end



