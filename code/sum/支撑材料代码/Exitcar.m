function [iflag] = Exitcar(A,B)
%导入矩阵车参数与矩阵A看前方5m处是否有车 有车返回1
iflag = 0;
for i=1:size(B,1)
    if B(i,2) == 1
        continue;
    else
        if B(i,1) - A(1) >0 && B(i,1) - A(1) <5
            iflag = 1;
        end
    end
end
end

