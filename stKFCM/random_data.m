d = (max(X(:,1)) - min(X(:,1)))/15;
for i = 1:c
    [max a(i)] = max ( X(:,1)<(min(X(:,1) + d ) * X(:,1) ));
end

