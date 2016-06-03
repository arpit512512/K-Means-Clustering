function [d] = plot2D15( u , c , a )
b = zeros(size(u)) ;
d = cell(c,1);
for i = 1:size(u ,1)
    b(i,:) = (u(i,:) == max(u(i,:))) ;
end

for i = 1:c
    for j = 1:size(u,1)
        if b(j,i)==1
            d{i}(end+1,:) = a(j,:);
        end
    end
end

cc=hsv(c);
figure
hold all
 for i = 1:c
     if ~isempty(d{i}) 
     plot(d{i}(:,1),d{i}(:,2), 'color' , cc(i ,:));
     end
 end
 


            
    
    
    
    