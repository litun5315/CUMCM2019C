%获取航班信息

timeList = xlsread('虹桥机场航班数据.xlsx','Sheet1','AG2:AG364');

flightTime = zeros(24,1);

for i=1:size(timeList,1)
    
    hour = ceil(timeList(i));
    
    flightTime(hour) = flightTime(hour) + 1 ;
    
end

i=1:24;
plot(i, flightTime, 'r');

Fly = zeros(4,1);

Fly(1) = sum(flightTime(1:6));
Fly(2) = sum(flightTime(7:12));
Fly(3) = sum(flightTime(13:18));
Fly(4) = sum(flightTime(19:24));