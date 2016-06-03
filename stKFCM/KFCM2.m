function U_final =KFCM2(cluster,degree,error, X, init)
% Input 
%       U : initial membership matrix
% cluster : desired number of clusters
%  degree : fuzzification degree 
%   error : stop threshold  
%  kvalue : N x N affinity matrix
% Output
% U_final : membership matrix
    
    kvalue = kernel_matrix(X , X , -0.5);
    data_n = size(kvalue, 1);
    if(nargin < 3)
      init=randperm(N);
    end;
    U=full(sparse(1:cluster,init(1:cluster),1,cluster,data_n,data_n));
    % Main loop
    U_final=U;
    for iter=1:10000
        %calculate normalized memberships
        mf = U_final.^degree;
        mf_tmp = mf*diag(1./sum(mf));
        %calculate distances D
        dist=ones(data_n,1)*diag(mf_tmp'*kvalue*mf_tmp)'-2*kvalue*mf_tmp+1;
        %update memberships U
        tmp = dist.^(-1/(degree-1));    
        U_final = tmp./(sum(tmp,2)*ones(1,cluster)); 

        % objective function
        obj_fcn(iter) = sum(sum(dist.*mf));
        U_old=U_final;
        % check termination condition
        if iter > 1
            if abs(obj_fcn(iter) - obj_fcn(iter-1))< error
                break; 
            end
        end
    end
    clear mf;
    clear mf_tmp;
    clear tmp;
    clear obj_fcn;
    clear dist;
    