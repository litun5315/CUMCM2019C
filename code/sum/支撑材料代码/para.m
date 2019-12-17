function [flightTime,shortTime,longTime,shortGet,longGet] = para(time)
%输出的参数有 飞架航班间隔情况 长短途所需时间 长短途所获得金额
    if time < 6
        flightTime = ceil((1/1.2)*100)/100;      
    elseif time < 12
        flightTime = ceil((1/13.33)*100)/100;  
    elseif time <18
        flightTime = ceil((1/20.83)*100)/100;
    else
        flightTime = ceil((1/26.33)*100)/100;   
    end
    shortLen = rand * 15 / 50;
    longLen = (rand * (45-3) + 30) / 50;
    
    shortTime = ceil((shortLen)*100)/100;
    longTime = ceil((longLen)*100)/100;
    
    shortGet = 14 + (shortLen * 50 - 3) * 2.7;
    longGet = ( longLen * 50 - 15 ) * 2.7 +14;
end

