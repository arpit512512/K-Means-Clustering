function [ q_tm1 , u ] = stKFCM( c , m , X )

epsilon = 10^(-2) ;
n = 1249;
T = size(X , 1) ;

X0 = X(1:n , :) ;
init = randperm(n);
u0 = (kernel_fcm(c , m , X0,init ))';
q_tm1 = zeros(n,c);
for k=1:c
  q_tm1(1:n,k) = u0(1:n,k) ./ norm(u0(1:n,k));
end
%q_tm1 = q_tm1 + .0000000001*(q_tm1==0);
plot2D15(kernel_fcm(c, m, X, init)', c, X);
for t = n : n : T-n
    %disp(t);
    disp('***************************************************************' );
    Kt = kernel_matrix(X(t+1 : t+n ,:) ,X(t+1 : t+n , :),-0.5 );
    Kt = Kt + 0.00000000000000000000001*(Kt==0);
    Kt_tm1 = kernel_matrix( X(t+1 : t+n ,:) , X(t-n+1 : t, :), -0.5 ) ;
    Kt_tm1 = Kt_tm1 + 0.00000000000000000000001*(Kt_tm1==0);
    wa = ones(c,1);
     for k=1:c 
      wa(k) = norm(q_tm1(1:n,k));
     end
    alpha = abs(pinv(Kt)* Kt_tm1 * q_tm1) ;
    %alpha = alpha + .0000000001*(alpha==0);
    wt = ones(n,1).*mean(wa);
    
    % uik = 1 if i=k else uik = 0 ;
    % Ut = [0]
    ualpha = eye(c,c);
    ut = zeros(n , c);
    max_dist1 = 1;
    max_dist2 = 1;
    while max_dist1 > epsilon || max_dist2 > epsilon
       ualpha_old = ualpha ;
       ut_old = ut ;
       %calculating ualpha 
       qt_norm =  meta_partition( ut , ualpha , wt , wa ,alpha , m ) ;
       %qt_norm = qt_norm + .0000000001*(qt_norm==0);
       d = meta_distance(alpha , Kt , qt_norm );
       %d = d + .0000000001*(d==0);
       %disp('d...');
       %disp(d);
       ualpha = partition_matrix1 ( m ,d );

       %ualpha = ualpha + .0000000001*(ualpha==0);

       
       %calculating ut
       d = distance_matrix( qt_norm , Kt , m) ;       
       ut = partition_matrix1( m , d );
       %disp('ut...');
       %disp(ut);
       %d = d + .0000000001*(d==0);
       %ut = ut + .0000000001*(ut==0);
       
       %calculating change in ualpha
       dist1 = dot(ualpha,ualpha) + dot(ualpha_old , ualpha_old)- 2*dot(ualpha , ualpha_old)  ;
       max_dist1 = abs(max(sum(dist1,2)));
       
       
       %calculating change in ut 
       dist2 = dot(ut,ut) + dot(ut_old,ut_old) - 2*dot(ut , ut_old) ;
       max_dist2 = abs(max(sum(dist2,2)));
       d =  plot2D15(ut , c ,  X(t+1 : t+n ,:));
      disp(max_dist1);
      disp(max_dist2);
      
      
    end

    q_tm1 = meta_partition( ut , ualpha , wt , wa , alpha , m ) ;
    %q_tm1 = q_tm1 + .0000000001*(q_tm1==0);
        
end

% getting centroid points
v = sum(q_tm1,1);

% partition matrix for the entire dataset
d = final_distance( X , q_tm1 , Kt  ) ;
d = abs(d);
u = partition_matrix1(m , d) ;


end