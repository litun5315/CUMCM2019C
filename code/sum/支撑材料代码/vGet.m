function [v] = vGet(A,N)
%道路繁忙程度对速度的影响模型
cars = 0;
for i=1:size(N,1)
    if N(i,1) - A(1) <100
        cars = cars + 1;
    end
end
v = 5 * (11-cars)/11;  
end

