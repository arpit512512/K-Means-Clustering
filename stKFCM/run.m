x = load('data1.txt');
x = (x - mean(x))./std(x);
for i=1:10000
  x = x(randperm(size(x,1)),:);
end
%x = x - min(x);
stKFCM(15, 1.7, x);