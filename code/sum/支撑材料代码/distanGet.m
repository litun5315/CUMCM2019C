function [distan] = distanGet(xbefore,ybefore,xafter,yafter)
%输入两段的经纬度，计算两者距离
R = 6371;
distan_x = abs(2*R * asin( sqrt( sin(0.5*ybefore-0.5*yafter)^2))/100);
distan_y = abs(2*R * asin( sqrt( cos(yafter)^2 * sin(0.5*xbefore-0.5*xafter)^2))/100);
distan = distan_x+distan_y;  
end

