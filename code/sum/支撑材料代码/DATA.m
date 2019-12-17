function [L,Fly,car,earn] = DATA(T)
%数据库获取 储存了一些基本数据 传过来时间段 穿回去一些数据
if T == 1
   L = ((23/50)*3+(25/50)*15+(2/50)*30)/2;
   Fly = 1.2;
   car = ceil(100 * Fly /3);
   earn = 22.3661;
elseif T == 2
    L = ((75/140)*3+(60/140)*15+(5/140)*30)/2;
    Fly = 13.33;
    car = ceil(100 * Fly /3);
    earn = 20.0403;
elseif T == 3
    L = ((111/208)*3+(89/208)*15+(8/208)*30)/2;
    Fly = 20.83;
    car = ceil(100 * Fly /3);
    earn = 21.2471;
else
    L = ((80/178)*3+(92/178)*15+(6/178)*30)/2;
    Fly = 26.33;
    car = ceil(100 * Fly /3);
    earn = 24.4808;
end

end

