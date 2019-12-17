N = 3;    % 接口数目
postFlag = ones(N,1);    % 设置N个接口站，0代表此处无法加车，1代表此处需要来车

load = [2,500];    %路的主结构

postPoint = zeros(N,1);
passinger = 1000;

for i=1:N
    postPoint(i) = N *100;
end
postPoint = [50;200;450];

car = zeros(3,3);    % 初始化最开始的车 每列数据分别表示 路上位置，是否进站，是否接客

for i = 1:100000
    
    if size(car,1) == 1
        car = [car;zeros(1,3)];
        continue;
    end
    for carNum = 1:size(car,1)
        if carNum >= size(car,1)
            continue;
        end
        if car(carNum,1) > load(2)
            car(carNum,:) = [];
            passinger = passinger - 1;
        elseif ~(car(carNum,3) == 0)
            car(carNum) = car(carNum,1)+1;
            if car(carNum,3)==1
                postFlag(1) = 1;
            elseif car(carNum,3)==2
                postFlag(2) = 1;
            else
                postFlag(3) = 1;
            end
            car(carNum,2) = 0;
            continue;
        elseif -(car(carNum,1)-postPoint(1))<2 || postFlag(1)==1 || car(carNum,3)==0
            car(carNum,1) = postPoint(1);
            car(carNum,2) = 1;
            car(carNum,3) = 1;
            postFlag1(1) = 0;
        elseif -(car(carNum,1)-postPoint(2))<2 || postFlag(2)==1 || car(carNum,3)==0
            car(carNum,1) = postPoint(2);
            car(carNum,2) = 1;
            car(carNum,3) = 2;
            postFlaf(2) = 0;
        elseif -(car(carNum,1)-postPoint(3))<2 || postFlag(3)==1 || car(carNum,3)==0
            car(carNum,1) = postPoint(3);
            car(carNum,2) = 1;
            car(carNum,3) = 3
            postFlag(3) = 0;
        elseif postFlag(1)==0&&postFlag(2)==0&&postFlag(3)==0&&((postPoint(1)-car(carNum,1)<2)||(postPoint(2)-car(carNum,1)<2)||(postPoint(3)-car(carNum,1)<2))&&car(carNum,3)==0
            
        elseif Exitcar(car(carNum,:),car)
            
        else
            car(carNum,1) = car(carNum,1) + vGet(car(carNum,:),car);
        end
        
    end
    
    if postFlag(1)==1 || postFlag(2)==1 || postFlag(3)==1
        car = [car;zeros(1,3)];
    end
    
    if passinger <=0
        break;
    end
    
end

i
1000/i