function [unew ] = KFCM ( X , c , m )
K = kernel_matrix(X , X , -0.5) ;
[unew , idx  ]= initialise_u1( K, c , m , X ) ;
%   o = X( sub2ind(size(K) , idx' , ones(size(idx') ))); 
%   i = X( sub2ind(size(K) , idx' , 2*ones(size(idx') )));
o = idx(:,1);
i = idx(:,2);

 hold on
 plot(o(:),i(:), '--rs','LineWidth',2,...
                 'MarkerEdgeColor','k',...
                 'MarkerFaceColor','g',...
                 'MarkerSize',10);
disp('*******************************************************');

epsilon = 10^(-5) ;
max_dist = 10 ;

while( max_dist > epsilon )
    uold = unew ; 
    d = distance_matrix( uold , K , m );
    unew = partition_matrix1( m ,d ) ;
    dist = (unew - uold).*(unew - uold) ;
    max_dist = max(sum(dist,2));
   % plot2D15(uold , c , X);
end
end

    
    
    
    
